Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3972623DA
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 02:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIIAR6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 20:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgIIARv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 20:17:51 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A5DC061573
        for <linux-next@vger.kernel.org>; Tue,  8 Sep 2020 17:17:51 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e33so754208pgm.0
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2020 17:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+UGvf6Pr68Cs+xKz7Ykea5vTQO5qdqLLkGOnoW4MMjo=;
        b=ybR+AFxh/IswvR+4jnQyX9UHV4Idy//dT7bAfLEBFaedIhIUPGewdRk7aHARD+hPLc
         O/k7er8K7zxMf8loePZXUs+Yho9i1/iQ1XP59cKuscJm5aejjyRPaUa7TRnTAlLFwtoI
         xPMW6WkQoBymEXkluOFUFqfM6XedqgXYujjSdwtMvyw6P++l88IxyLSeRtgzytfu+SkN
         VeISrzHsT6DbdSPLo27iC02K1bMqKASYGDE8mH0ObLvAXYold7hyyDFNrqHZ0w4LkT3S
         9hFACsrz7stU+Y+0xDAJc8DO/o0058nRC/TI65uI2NJ5qHNMaMqfh0kiUAZ1SjOdP6P2
         l6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+UGvf6Pr68Cs+xKz7Ykea5vTQO5qdqLLkGOnoW4MMjo=;
        b=Orrpz4jxTbeZl6RSDP3NBb+RhNKJUp5ejTWBVPKtwTTqTNTTzfrlkdZPW6CJTYB5sS
         meb9yJ1F+ed/dAlXtZC2fcwwJeIbVGKe+lOe6+Gb4Yd4ZJs7UBN6ZDg3sb4eu76NJX6Y
         Ubx8t46u4eBwrvUDKjLMCrlKCRcpWmEGsfo9WD2uw70VAIQFE4gZoB4Wyvq6rS55gMw/
         bYAdavokE6hV+CHThMbn3Eu1+Cswauo2i7tuc1XqJWX5OUXQOqco0ZzaO3O5jtsiRChN
         qleyDQox1RJl0/7q2XLjaMy7snZdrIHG58emtbl21/SPHx3azb90vtPxdAow9vHjsQvR
         UvLA==
X-Gm-Message-State: AOAM531CSU1XKfdPpx9mvfPVKLwJ6fZvXcHG1YKX/GyYoUvNMQiPrD45
        8fYhpBOhJmYZDlvjjY7Q6TW0hEhDuDI/LA==
X-Google-Smtp-Source: ABdhPJwqTFuAibX2FjJofd46ht+gNuhGBnUsehsFzONH1ePFE0GyvqIL91Hsshg6WUmNSnnnE+OJ8A==
X-Received: by 2002:a63:4854:: with SMTP id x20mr1019904pgk.220.1599610668932;
        Tue, 08 Sep 2020 17:17:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m13sm522050pfk.103.2020.09.08.17.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 17:17:48 -0700 (PDT)
Message-ID: <5f581f2c.1c69fb81.e7fdc.23d1@mx.google.com>
Date:   Tue, 08 Sep 2020 17:17:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc4-284-g72e0a6a27fe8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 310 runs,
 5 regressions (v5.9-rc4-284-g72e0a6a27fe8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 310 runs, 5 regressions (v5.9-rc4-284-g72e0a6a=
27fe8)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
bcm2837-rpi-3-b   | arm64 | lab-baylibre  | gcc-8    | defconfig           =
         | 3/4    =

panda             | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONF=
IG_SMP=3Dn | 4/5    =

panda             | arm   | lab-collabora | gcc-8    | omap2plus_defconfig =
         | 0/1    =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONF=
IG_SMP=3Dn | 0/1    =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZ=
E_BASE=3Dy | 82/88  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc4-284-g72e0a6a27fe8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc4-284-g72e0a6a27fe8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      72e0a6a27fe84b976bceb5f3a2898eb64b52cc81 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
bcm2837-rpi-3-b   | arm64 | lab-baylibre  | gcc-8    | defconfig           =
         | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f57e6ecea96fd2f4cd35390

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f57e6ecea96fd2f=
4cd35392
      failing since 4 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)
      2 lines

    2020-09-08 20:15:28.005000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-08 20:15:28.005000  (user:khilman) is already connected
    2020-09-08 20:15:43.705000  =00
    2020-09-08 20:15:43.705000  =

    2020-09-08 20:15:43.725000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-08 20:15:43.725000  =

    2020-09-08 20:15:43.725000  DRAM:  948 MiB
    2020-09-08 20:15:43.745000  RPI 3 Model B (0xa02082)
    2020-09-08 20:15:43.829000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-08 20:15:43.857000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
panda             | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONF=
IG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f57ecde1785707bf9d35380

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f57ecde1785707=
bf9d35384
      failing since 34 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-08 20:43:04.627000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-08 20:43:04.632000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-08 20:43:04.636000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-08 20:43:04.641000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-08 20:43:04.651000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-08 20:43:04.656000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-08 20:43:04.660000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-08 20:43:04.665000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-08 20:43:04.670000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-08 20:43:04.679000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
panda             | arm   | lab-collabora | gcc-8    | omap2plus_defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f57ec5bfef1b50344d35379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f57ec5bfef1b50344d35=
37a
      failing since 34 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONF=
IG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f57ec78810f9745d1d35379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f57ec78810f9745d1d35=
37a
      failing since 4 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)  =



platform          | arch  | lab           | compiler | defconfig           =
         | results
------------------+-------+---------------+----------+---------------------=
---------+--------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZ=
E_BASE=3Dy | 82/88  =


  Details:     https://kernelci.org/test/plan/id/5f57e7ec6fd3c21f63d35392

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-28=
4-g72e0a6a27fe8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
f57e7ec6fd3c21f63d353c5
      failing since 4 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)

    2020-09-08 20:21:59.178000  <8>[   53.219652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>
      =20
