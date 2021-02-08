Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2241B312985
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 04:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBHDqv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Feb 2021 22:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBHDqv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Feb 2021 22:46:51 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0830DC06174A
        for <linux-next@vger.kernel.org>; Sun,  7 Feb 2021 19:46:11 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id a16so7083956plh.8
        for <linux-next@vger.kernel.org>; Sun, 07 Feb 2021 19:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FQm5plG4v7D/ZgUcvdfG0DgwLlnVdm9aByTamjFTk9g=;
        b=hmxLWhtcqEYSgor+bLA6GrkfbLdp6Ayy3bjQnr5JWNUoJcwli+ISpmWugu5ZUqnZj/
         VNJX+pTPv500BB3X2FflJsLwnHnBkk18baBWXx9N9Xg01qWyhR4lXYqf/sYUK/N8A14P
         K+Ajt5WRN7pNjJ3dTIg+y2EW1SQxsEDmW/Dj8bXEAP6HLvn14hjja3M78cxdSdIp0I5t
         ipy0vaCHU5Whg8TJlhnFOCPbb9DthbkGWS1uA+bd5V/C26KLg2FzdmfptGY5WXCFVFsC
         cJ70T/qyUG4qnvj0m0Dh6tzwqmfB1IbOCM9hIIBFWG6KU0zlNZsXEM74Ps1Ykne77WJ7
         NN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FQm5plG4v7D/ZgUcvdfG0DgwLlnVdm9aByTamjFTk9g=;
        b=AUVnqMl8xW7UbLvyyg0pVens4Dui50GLR3Kq5FYy1uPWjJAQMEZ3EP8rAreruDZiLZ
         /95DpkplBArWGtyDX8+7I3DN1rufSXZXwGhHLpzVuQp8ASFiPJDznmvVLGK83ujTLMkD
         3aRYH+qQwGJc1yuFO0vgSZCbU0UiVfNozYJO9bRzNVyChnXya+HhnPdtYOVbR43OsiUA
         uSQX1dRuq0WtBBLTsyBrwlssYaTGmLkBSCLhu7wY7nZYlGteWOJhkNPguXoTUWcH18iy
         ZHmh4O/N2L8mQRfYhhCR9XPciB+ysxYQvjAtFjp9U+p1QrSue9V5XEZTJhy+KJDUCo6z
         LTjw==
X-Gm-Message-State: AOAM530KrhxJqE8NCqLdHQeX8PV/rsSw2DWuQEFoDEf5O7RV+vjk38hi
        l6TM0t297IUU1Rdo61d/ACplOXxNNQBfJw==
X-Google-Smtp-Source: ABdhPJwtUAT+u2acBT4PQ1XH1aRenMkhqLnHYtC2HIbJjI35LaUE9pZ746x3+lbe/1XSiKQmhafkLA==
X-Received: by 2002:a17:902:8695:b029:e1:6152:c76e with SMTP id g21-20020a1709028695b02900e16152c76emr14157132plo.13.1612755970212;
        Sun, 07 Feb 2021 19:46:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k69sm10868520pfd.4.2021.02.07.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 19:46:09 -0800 (PST)
Message-ID: <6020b401.1c69fb81.a3c51.89c9@mx.google.com>
Date:   Sun, 07 Feb 2021 19:46:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc6-436-gda0c88a4d23e
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 300 runs,
 6 regressions (v5.11-rc6-436-gda0c88a4d23e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 300 runs, 6 regressions (v5.11-rc6-436-gda0c88=
a4d23e)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc6-436-gda0c88a4d23e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc6-436-gda0c88a4d23e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      da0c88a4d23e1e6b5ea07176b2e16b61d24fee52 =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60207c1ca781c99f7e3abea0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60207c1ca781c99f7e3ab=
ea1
        failing since 17 days (last pass: v5.11-rc4-275-g31be679b2913, firs=
t fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602077b26c78989c883abe65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602077b26c78989c883ab=
e66
        failing since 83 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602077ba6c78989c883abe74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602077ba6c78989c883ab=
e75
        failing since 83 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602077b03f5a013ff43abe62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602077b03f5a013ff43ab=
e63
        failing since 83 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60207761a7605a17183abe69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60207761a7605a17183ab=
e6a
        failing since 83 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6020778628a9e296823abe85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc6-4=
36-gda0c88a4d23e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6020778628a9e296823ab=
e86
        failing since 83 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
