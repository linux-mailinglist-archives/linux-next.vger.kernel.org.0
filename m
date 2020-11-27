Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2C72C5ED0
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 03:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388586AbgK0Czm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 21:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730961AbgK0Czm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2020 21:55:42 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25166C0613D4
        for <linux-next@vger.kernel.org>; Thu, 26 Nov 2020 18:55:41 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id x4so265249pln.8
        for <linux-next@vger.kernel.org>; Thu, 26 Nov 2020 18:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oK2CmgbG7yaAaYXLMJTEjTDUzLM6zVzWgfqb+FETAao=;
        b=Mn4zp0gUvJ3L7DwzmWvF9jQ6DvVJWJK2wIhlltdjjPPmd5nmKVEoDHOBMXWeMAL/Sk
         9rpAzAEJb30M5pfU4aCchW+pZ+/eUKSmHOn3WoNEuNI/Uod4ELUSbSIT+Jmv8J5U8UF5
         TawmB3tx9kuj3RL76J/HmWKMcALRF1fnORhjLIl/YBSwOkd3hG4DtDfZ+4cR1mHCMM5G
         ij3jVdolWcp7KUJqU+3bypa8ypJcIlMqxZpH79/BQgeVVZory277e7UlRq+edgW16i4w
         M22YPKT4zd+KKPjAn3WXGOpl5DV/2yJ7L2S3yc7mdyhYsrJf62Jw2QN7ALiYVx/eojMe
         yufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oK2CmgbG7yaAaYXLMJTEjTDUzLM6zVzWgfqb+FETAao=;
        b=gFAw62d6LgHsONm/LgofDevUgNhQw8oZqqY1w3fj3sjYU9tWfagLUU54DQx1IED90X
         RDF1ncgQ+kkuVBrt2GVvKHyKfTwj2XxnRiKrXbW/90HKrUPLYKwJviXOJIKKSi+3a2uq
         nyT3aV78GjGiiEtq7o3+tYMtbvxe8pE9tKk5dgg2oRivP9w5xG9acj18vOEt4h82zeNz
         oz89Xaf8P2l6xISp8LAcL/rdFDHqHdG2bsElm97Z4fiYlVWtdYW31u8UzkdNmNBNwt0N
         iim1/BvWeF6nPPR5MkWV/wmcVEzmdla+lup9NkNmCY0Q79MufMi76O7c/e2+LnCIaxKz
         rF6g==
X-Gm-Message-State: AOAM531WjZ64MBpwbrufar8Is1gNEy7t9x7rjSMdLCW+crn6qs4yLUIu
        jnY0gWrfWoV4cbTTkUq5JBGT3fY5FckI+g==
X-Google-Smtp-Source: ABdhPJwB95+vW0AMeWZfTOtm8z6s0ljA2n4O+IinlMjlbLPwwctcjK8TrCBMT/PRHMLItYKuPlvHtA==
X-Received: by 2002:a17:902:bb92:b029:d9:e9bf:b775 with SMTP id m18-20020a170902bb92b02900d9e9bfb775mr5125274pls.24.1606445739616;
        Thu, 26 Nov 2020 18:55:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gb4sm7987921pjb.30.2020.11.26.18.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 18:55:38 -0800 (PST)
Message-ID: <5fc06aaa.1c69fb81.a7c11.4d72@mx.google.com>
Date:   Thu, 26 Nov 2020 18:55:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc5-394-gc7cab83d100f5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 389 runs,
 14 regressions (v5.10-rc5-394-gc7cab83d100f5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 389 runs, 14 regressions (v5.10-rc5-394-gc7cab=
83d100f5)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-8    | sama5_defco=
nfig              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

bcm2837-rpi-3-b-32       | arm   | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =

imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc5-394-gc7cab83d100f5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc5-394-gc7cab83d100f5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7cab83d100f5af1c10580fe567f8c29779a7e4e =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-8    | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc033279e6509bae0c94cf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc033279e6509bae0c94=
cf6
        failing since 205 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc031087346b0d588c94ce8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3=
-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3=
-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fc031087346b0d5=
88c94ceb
        new failure (last pass: v5.10-rc5-316-g030ec55420bc7)
        1 lines

    2020-11-26 22:47:24.909000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-26 22:47:24.910000+00:00  (user:khilman) is already connected
    2020-11-26 22:47:39.839000+00:00  =00
    2020-11-26 22:47:39.839000+00:00  =

    2020-11-26 22:47:39.840000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-26 22:47:39.840000+00:00  =

    2020-11-26 22:47:39.840000+00:00  DRAM:  948 MiB
    2020-11-26 22:47:39.851000+00:00  RPI 3 Model B (0xa02082)
    2020-11-26 22:47:39.951000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-26 22:47:39.971000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc0358cd80a9126bcc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc0358dd80a9126bcc94=
cc9
        new failure (last pass: v5.10-rc5-316-g030ec55420bc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc036d3665543baf8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc036d3665543baf8c94=
cba
        failing since 31 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc037f7aa264c49fbc94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc037f7aa264c49fbc94=
ccb
        failing since 2 days (last pass: v5.10-rc4-615-gd0b6b0cb24dad, firs=
t fail: v5.10-rc5-256-gea2235a03b2c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc034df78ea77bd57c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc034df78ea77bd57c94=
cc2
        failing since 1 day (last pass: v5.10-rc5-280-gbbd73b6892345, first=
 fail: v5.10-rc5-316-g030ec55420bc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc035f75da2d63415c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc035f75da2d63415c94=
cc3
        new failure (last pass: v5.10-rc5-316-g030ec55420bc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc0325a5f0cf3019bc94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc0325a5f0cf3019bc94=
cc2
        failing since 1 day (last pass: v5.10-rc5-280-gbbd73b6892345, first=
 fail: v5.10-rc5-316-g030ec55420bc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc033c11dbbc1ed59c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc033c11dbbc1ed59c94=
cc6
        new failure (last pass: v5.10-rc5-316-g030ec55420bc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc032d4ded07fa956c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc032d4ded07fa956c94=
cc3
        failing since 10 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc032e7b32828de6dc94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc032e7b32828de6dc94=
ce2
        failing since 10 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc032bffb0e0dd99ec94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc032bffb0e0dd99ec94=
cd4
        failing since 10 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc03294dcd4a2f146c94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc03294dcd4a2f146c94=
ce7
        failing since 10 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc0328ae793fa406ec94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
94-gc7cab83d100f5/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc0328ae793fa406ec94=
cd2
        failing since 10 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
