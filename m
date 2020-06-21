Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC138202D75
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 00:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgFUWo5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 18:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgFUWo5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 18:44:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3CDC061794
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 15:44:57 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id u8so7186562pje.4
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 15:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=emqvAGLaas9Ep3cJbFxqrqzLWsbpT7QehlzpFH+JvHY=;
        b=PmNFE1GB97chNQl1CaW1Y/9RmxNq3lhdQa/CpoBU6WlV/9SpOUTvoRk9kcTY+BZXKX
         ArB3PlnR1NfZV6aTaS1ZMvX/zzqVHyUPLggwA3mOvGy1ELLm6TEfif7M19Nxu5+sY5OM
         U7wlFwGAhTODftijGKPRtK6rdmSjyef5g1NJyjVtMkcD+7KnXaqRar2t5qjI5poXRvLh
         WSTj/oZ2yNdE1Vum9ojrRv9tlcoYubLM0foQE9ffQNtEI5eo7ynLp5NxJlsOA8i7m2mt
         sZ5E6Dav43kJEXegV8S4ZMb/v4GMO91+f0uR4YOI+PwurArgYF74IhYhN1LEk+CWrRoe
         V9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=emqvAGLaas9Ep3cJbFxqrqzLWsbpT7QehlzpFH+JvHY=;
        b=XzaequPNuJE/3u1fd2K2Mk9oqiM9547djrhK2qnkXltS+U311GgGO9PCwHTb1sFaHi
         GibAJvo1ZJ6TqII89CBdFQfO5jGL8vZByXsaB9OwN00LaQgp/Q87fHyFRJNMHHmODgL+
         HKq5KjAcrN0DIQYsY8tqsMinIQ6T9A8PkXBjlpJXYJuJJO494AougwUDKSyaHnmWKyki
         y1IYpdX8kRZj/te+11ory9/BdeHvRKmsSPkAXPz7vuE7ZWk3tXkjREtg3fgmTCO7qah5
         rs17az+VsJYffJUIiBRBKh8Oa03TQcDk+VvG0X1BuqRucvadE3Yaqc5gh8Af4QMcb81q
         FURg==
X-Gm-Message-State: AOAM532WQxx8LS4nMLiod+alKtUXkAzWsn+P+P7BHfeuL+9HhAMDGuAR
        R7j/zJuDdw9Mob6G/w7aEJBCetFBiYM=
X-Google-Smtp-Source: ABdhPJyGDQ5Kt1Ii1T+f1Azp1O7bWB1UpT9sM22aj6Oa1C1QVpzAYgdvMSVJV6svL0Axj6Aw15HWJQ==
X-Received: by 2002:a17:90a:630b:: with SMTP id e11mr1168542pjj.236.1592779495039;
        Sun, 21 Jun 2020 15:44:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m129sm10646970pfm.206.2020.06.21.15.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 15:44:54 -0700 (PDT)
Message-ID: <5eefe2e6.1c69fb81.bd830.0653@mx.google.com>
Date:   Sun, 21 Jun 2020 15:44:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200621
Subject: next/master baseline: 97 runs, 4 regressions (next-20200621)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 97 runs, 4 regressions (next-20200621)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200621/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200621
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5a94f5bc041ea9e4d17c93b11ea6f6a2e5ad361b =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eefa83fb1bad0b6a197bf17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200621/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200621/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eefa83fb1bad0b6a197b=
f18
      failing since 54 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eefae7c03beeb36b797bf1b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eefae7c03beeb36=
b797bf1e
      new failure (last pass: next-20200618)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eefaeb51d75ac285b97bf0b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eefaeb51d75ac2=
85b97bf10
      new failure (last pass: next-20200618)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eefaab77115622ce997bf11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eefaab77115622ce997b=
f12
      new failure (last pass: next-20200618) =20
