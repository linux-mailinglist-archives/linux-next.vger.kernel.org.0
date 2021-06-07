Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7B939D46E
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 07:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhFGFqC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 01:46:02 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:38753 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGFqB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 01:46:01 -0400
Received: by mail-pf1-f182.google.com with SMTP id z26so12252901pfj.5
        for <linux-next@vger.kernel.org>; Sun, 06 Jun 2021 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Qi8wBGtIkXn56q7O0vbHn3TmMWSffIq/2RPBtd35JsI=;
        b=cWOEPW86crcg7hXDXf70jxPesse1wnKLIvTe8cYoQkYu1P5WnyrmcFXDMFjp5Za7/X
         g1h5hfttg+Ymau4Km7c6S2aiLweMJI4dGAJBGS5w7qC5f3eF2V3CFdEwznjX5uaNZkqa
         uA/wzYV7CD2t3U6EBKdpZ65yQq8SPeYFlU/VtWtcTO15X/L79dn/Z1UBun7h+H1jAc5O
         ZxK3sA0gTW2YdkLA1aFsW9wOu5Y92XdP2ukjBR9o9BHO+RzEOYxefg4orArASoIYIem3
         2w9NFEfpsCk1hCbwdPM+iLxykMn26ag/SS+8Ne1TIkazVifksQiB8lBaO/4lE/786zzU
         Yk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Qi8wBGtIkXn56q7O0vbHn3TmMWSffIq/2RPBtd35JsI=;
        b=U9Znkgj100nY3FIQVKoS76c3CNqTfGIYmC1/zojdcIW/3MEQAMcpmpn2LflQMG8JcB
         Es0BvBCGLa0c4bZgrAFyPojAsWP7e7ua6uKEwnZZb8146qjLBnS+4hP5s4BPk0ghljox
         oS9gtb3WfylWyNZ4DZjNwhQvcHoThO6Jom7zzQfv0zPhV9GIiBfwaCJEa7MYS964Ij3e
         s1WerkjdlZtTScJukVZFzspUAkt8laXRgJV91GmFVeqsjfVvyMQA6gThgcftSqXqQb/E
         RLmSNPuNQCo+5sWU1V/zlwB/kt6SvvlYN4gybBznW1NfTisqf3eFaF248tZtkifZxV7t
         6kkw==
X-Gm-Message-State: AOAM531dekwAYSGFpuKCx1Rm3kc8/VzgnsId5OXiQ2P9iY8LPkHE3QZC
        bEGOxz67aDS2qlpI3VUUpIK2S6Uk9RR/3IID
X-Google-Smtp-Source: ABdhPJy3sbXVEdKALFJE0tQljQ8DP+Ylspbob+pBCRz/Budbr4wMKpTSKGJftolBCa+MlOIU/mnQ2Q==
X-Received: by 2002:a62:7582:0:b029:2ea:132:6d99 with SMTP id q124-20020a6275820000b02902ea01326d99mr15681687pfc.53.1623044590828;
        Sun, 06 Jun 2021 22:43:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o16sm9272735pjw.10.2021.06.06.22.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 22:43:10 -0700 (PDT)
Message-ID: <60bdb1ee.1c69fb81.643ec.cbaf@mx.google.com>
Date:   Sun, 06 Jun 2021 22:43:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-rc5-179-g1071fb6d78e0
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 229 runs,
 9 regressions (v5.13-rc5-179-g1071fb6d78e0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 229 runs, 9 regressions (v5.13-rc5-179-g1071fb=
6d78e0)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

meson-gxl-s805x-p241       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

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
v5.13-rc5-179-g1071fb6d78e0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc5-179-g1071fb6d78e0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1071fb6d78e0a8bb503a3e891be17c09a47267a8 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd7e8ace496a872f0c0dfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd7e8ace496a872f0c0=
dfc
        failing since 122 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd78fe24656064900c0e8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd78fe24656064900c0=
e8f
        failing since 224 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s805x-p241       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd792263c191321e0c0dfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd792263c191321e0c0=
dfc
        failing since 16 days (last pass: v5.13-rc2-449-g435e556b2959, firs=
t fail: v5.13-rc2-481-g054f1a7414a0) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd7946c6a3284d320c0e0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd7946c6a3284d320c0=
e10
        new failure (last pass: v5.13-rc3-488-g5b9d8060231e) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd76129f69816c850c0e2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd76129f69816c850c0=
e2e
        failing since 202 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd76b084c9bcfc5d0c0e08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd76b084c9bcfc5d0c0=
e09
        failing since 202 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd7641d8109842450c0e14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd7641d8109842450c0=
e15
        failing since 202 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd7bf5eb2781f1840c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd7bf5eb2781f1840c0=
df6
        failing since 202 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bd809d1780ca8ed10c0e13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-1=
79-g1071fb6d78e0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bd809d1780ca8ed10c0=
e14
        failing since 202 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
