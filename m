Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449162F0B0F
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 03:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbhAKCml (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 21:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbhAKCmk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 21:42:40 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C47AC061786
        for <linux-next@vger.kernel.org>; Sun, 10 Jan 2021 18:42:00 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id y8so8729559plp.8
        for <linux-next@vger.kernel.org>; Sun, 10 Jan 2021 18:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mgMP355Dt0+321ID4lg3aC9XfqrRw/o2fA7lPQ2zB+4=;
        b=kTW6f5uSC72b80XGaFYWweH0U0n6gRR+CYbuXSyq3YJpxsgmT7AF+1FaRsFG5VLo28
         pRZp767ofbmyifwAP8UXi4vj23fJN3qhlyhw7Ypa1LCXXdKbm1UeZ6Q22wlBRO4/NEaF
         exEEHzi318gsj1oAxSVFRqE4b6IjdvLbRVkPZvrlYwcJbZLok2JMBZqxEIFdJj7zcj2k
         GnYs3Nx7wHYhyiDJdzIwMil7pH2M/zAlmdQ39zJzYsiELsrn6IcpvQZXmkFphJQpxrv2
         3RfKdng54tsuyduAjiknUeqbeYaq8XZtnHmnPW7YOfYhwltAGwKseTNlI8mtKS3Tn8J5
         fYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mgMP355Dt0+321ID4lg3aC9XfqrRw/o2fA7lPQ2zB+4=;
        b=B4FEKr+6dOdZm4Mbi5SHFg2U0kZrJlYJga0JXLCEycf0OkQE/EyHDAB0OwYxx4SP4e
         ozDcsP8yFWMIsSPivRDejzbDxbbWzAHgMAYnb4euFABKk/+fWz5fJDuzPe4kFIATG8Ee
         C9Tp7fBMpXFe4ie7sjapOAOTzLKwA4lSTddbCS7hwnbmNm7b7DYG3QL0suuVO/sd6f0S
         ryyU5fBMuMJXwSaAbBmcmU0WyyUdq3xvimKjV4YFXmN+mpjZ2ba3iwpiVGjqp6y293s8
         5Df/aVstU8QrHg9tMKfTU6d3P8TdxPBSSa5giYK7X+g50ZKXAw+TLEbPYfkcVaQR7z2C
         jRfg==
X-Gm-Message-State: AOAM532tD544BhWhFHxEdn5iJW9dxl2PCM4jvxIXM/VUNrkv4VJqaQ4Y
        ZQ+/GkfSdp/FH4Lz8CPpkLNlSPUAQe3Jag==
X-Google-Smtp-Source: ABdhPJza44cfWWAqOVQe4+3CcdCEexrC6+Qsghib2Nt3B5bm2VQMXGbLr+cUun0vnybzxQwjU7pnHg==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr14497071plk.74.1610332918465;
        Sun, 10 Jan 2021 18:41:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i184sm17785518pfe.126.2021.01.10.18.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 18:41:57 -0800 (PST)
Message-ID: <5ffbbaf5.1c69fb81.72985.64fc@mx.google.com>
Date:   Sun, 10 Jan 2021 18:41:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.11-rc2-703-g273380159754
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 373 runs,
 9 regressions (v5.11-rc2-703-g273380159754)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 373 runs, 9 regressions (v5.11-rc2-703-g273380=
159754)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc2-703-g273380159754/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc2-703-g273380159754
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2733801597542b19d3f0fce3d1f5422f0fd9a9db =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb870d706719784dc94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb870d706719784dc94=
cc5
        failing since 23 days (last pass: v5.10-9016-g31c318f75dc4, first f=
ail: v5.10-11328-gc41c506b38eb) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb86275978709239c94cfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb86275978709239c94=
cff
        failing since 2 days (last pass: v5.11-rc2-439-g7507456d8b0c, first=
 fail: v5.11-rc2-506-g48b46fac6daa) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb886b1da0f07a31c94cf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb886b1da0f07a31c94=
cf3
        failing since 3 days (last pass: v5.11-rc2-384-g0bac5ecdd304, first=
 fail: v5.11-rc2-439-g7507456d8b0c) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb88d869691c163dc94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb88d869691c163dc94=
cdc
        new failure (last pass: v5.11-rc2-506-g48b46fac6daa) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb855e51ec67d48dc94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb855e51ec67d48dc94=
cc8
        failing since 55 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb8571f63cdde103c94cd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb8571f63cdde103c94=
cd1
        failing since 55 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb857864bc69adcac94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb857864bc69adcac94=
cc6
        failing since 55 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb85f4f970a7f7b5c94cf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb85f4f970a7f7b5c94=
cf6
        failing since 55 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffb85202d08700a27c94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-7=
03-g273380159754/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffb85202d08700a27c94=
ce1
        failing since 55 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
