Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F3032CB51
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 05:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhCDEXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 23:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbhCDEWd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 23:22:33 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFC8C061574
        for <linux-next@vger.kernel.org>; Wed,  3 Mar 2021 20:21:53 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id a24so15378745plm.11
        for <linux-next@vger.kernel.org>; Wed, 03 Mar 2021 20:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rsTH9M7weByIa/kppoLZGrUIHGOcjq8FrpPYodybcik=;
        b=AHqNQwxo7GXppqGzoLcmoWJA8OVhVMx6ncuhsHsC0w5vS7trR3E1iLlxUBIujHa9Sb
         sK4l7j4p/Qa8RJ29FdzzFdaslt5+12jlIh/QEYt1IFhJS778R/r1voWfqwLL4gON/ESn
         PFmFtKsoXjCrxnuc+m3qpUH0nrq9Sis0UNXjYSurPYE1PKkWAZg16vegPjfkaFOfkAOX
         Ny0UhmFFPh5iVxkpZtWJyM2l0iHNAfuVLawHtikdGOXtVEGxsI8PFcSrQ0BEEMCsIuFr
         dmGl/bVZKpHUuPoyFdelE3nze11d0c6ePIdaeuH+g8ZZ9jKQoCKDWIOrsxdf4DZ9p60K
         /naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rsTH9M7weByIa/kppoLZGrUIHGOcjq8FrpPYodybcik=;
        b=PNZhbcyfc1PdoIdMmwKKHBZVcPZy5fwYFaiwjtEF5VqgXEOWkW8lowL+TrruPWf+WS
         Zn5qjL+65gMoX1TzCUI4Wwoo9ZY+/fJhleQ/0Tr8sRPswoE25/Ot34w4JteiQXaDAKq3
         htQkw2xCyTZrLHnsYJvAaqiaAiBAV0KuQcIhZZN4V8JE0DdcOZt4+EvVvgl3u+EeSN9n
         kCftHUOd/ERhPEPfhBAM+pDZQh+W4q7G9Q1mrUB4GtQMQy7GmlYpytlcBBxfjK3Lcqre
         2kfC44c62Sux9GJOtqHS8TEBV6GCjFbmE1mlExuO2HQ4+4DAbxJ4p0gkblmkSibbQJ6j
         gKCA==
X-Gm-Message-State: AOAM533ot7uBBxDfTp9b6XZnRQMITGmEj+sFEhdfW8r0ukwLN7k8FJIq
        61AY03r8DzavTvS3sTz5e08pVCRF+MlbsgC1
X-Google-Smtp-Source: ABdhPJwJztQgGLwyS7ZmT6ozXaq9PANqm0/6gd7ikK3qY7z/C9a1FxETNuGNWvReaYOEUEo6gn58fw==
X-Received: by 2002:a17:90a:8b16:: with SMTP id y22mr2359747pjn.191.1614831712267;
        Wed, 03 Mar 2021 20:21:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v12sm8168966pjr.28.2021.03.03.20.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 20:21:51 -0800 (PST)
Message-ID: <6040605f.1c69fb81.f34d1.2f49@mx.google.com>
Date:   Wed, 03 Mar 2021 20:21:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-339-gdbc40beb5545e
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 322 runs,
 11 regressions (v5.12-rc1-339-gdbc40beb5545e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 322 runs, 11 regressions (v5.12-rc1-339-gdbc40=
beb5545e)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =

imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200             | arm64  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =

meson-gxm-q200             | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc1-339-gdbc40beb5545e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc1-339-gdbc40beb5545e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dbc40beb5545ecb25b90451ad0e6c339b0a32ca2 =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60402ccb89c3c4585faddcbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402ccb89c3c4585fadd=
cc0
        new failure (last pass: v5.12-rc1-302-gdec4d73ab259b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60402e5d068e45b0a7addcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402e5d068e45b0a7add=
cb3
        failing since 1 day (last pass: v5.11-11896-g31549ef5d561, first fa=
il: v5.12-rc1-190-ge8638196c4142) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60402ffa362906cbfcaddd20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402ffa362906cbfcadd=
d21
        failing since 3 days (last pass: v5.11-11308-g1e0436e950f3, first f=
ail: v5.11-11896-g31549ef5d561) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxm-q200             | arm64  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60402bd684fe3333fdaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402bd684fe3333fdadd=
cb2
        new failure (last pass: v5.12-rc1-302-gdec4d73ab259b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxm-q200             | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60402c76359f3e5aa0addcca

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60402c76359f3e5=
aa0addcce
        new failure (last pass: v5.12-rc1-302-gdec4d73ab259b)
        10 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60402c76359f3e5=
aa0addccf
        new failure (last pass: v5.12-rc1-302-gdec4d73ab259b)
        2 lines

    2021-03-04 00:40:02.273000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-03-04 00:40:02.273000+00:00  kern  :alert : [001ffdfa31d4c5c9] add=
ress between user and kernel address ranges
    2021-03-04 00:40:02.273000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#1] PREEMPT SMP
    2021-03-04 00:40:02.273000+00:00  kern  :emerg : Code: <8>[   45.887527=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
    2021-03-04 00:40:02.274000+00:00  d503233f b4000160 b140<8>[   45.89664=
3] <LAVA_SIGNAL_ENDRUN 0_dmesg 780407_1.5.2.4.1>
    2021-03-04 00:40:02.274000+00:00  041f 54000128 (f9400401) =

    2021-03-04 00:40:02.274000+00:00  + set +x   =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60402adc8441dd8719addce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402adc8441dd8719add=
ce6
        failing since 107 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60402b1c1892d3c5c6addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402b1c1892d3c5c6add=
cb2
        failing since 107 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60402a87e780bc28ceaddcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402a87e780bc28ceadd=
cbd
        failing since 107 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60402a96a3ccc3f70faddcd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60402a96a3ccc3f70fadd=
cd7
        failing since 107 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6040299b943577db69addce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
39-gdbc40beb5545e/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6040299b943577db69add=
ce6
        failing since 0 day (last pass: v5.11-rc6-436-gda0c88a4d23e, first =
fail: v5.12-rc1-302-gdec4d73ab259b) =

 =20
