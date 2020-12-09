Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728A22D397E
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 05:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgLIENp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 23:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgLIENp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 23:13:45 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55E0C0613CF
        for <linux-next@vger.kernel.org>; Tue,  8 Dec 2020 20:13:04 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id hk16so188911pjb.4
        for <linux-next@vger.kernel.org>; Tue, 08 Dec 2020 20:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jY7jxwxvQ//H6lo6TXJj9EzavHhHjBXIN3MgY4EPKro=;
        b=r2I5SaTsEiSim+3/qKa+ZYUPH7tZaiX9pFdPtNmLxHlH6iF1clhD7KpEkt7O1bsruw
         CvB4MdMrVFQBHLBCBHLIrR163o+GTgobaph06W+WlHgvbrzsAemKTyuehvU/tmRPmEm2
         LX7lmg0+QHL7Zb6VhxWmQZX50ihGzcAYszmcsDnlHzcLfpMYpe6TI9j4leuhzf04o20V
         nNKRwLmXTJ8vypFqWaWEK58mKEFO4UXGuGgqzgwbMB3Kph4p4WD10Gdjqno4JL2qj7/S
         oNh3m9EUKEUPqQVa4pKSNE43pERtornDX8ZVdbDQ1k2ENccTKUZly0DXld5l8rW8suvX
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jY7jxwxvQ//H6lo6TXJj9EzavHhHjBXIN3MgY4EPKro=;
        b=RmbvyrjtNz8yEO69tJkDQ/F4PzuwP8KBlGa6rFfikEoNz7z6oaaHmdcITPYsqbUqpH
         qPuVtnE9Ixg7AYwJGCOR0Fj8pqHKd8AVSwBdfkbro1RnntOMXDNB2rY3sMKzwuZFigJt
         tqW2CLhpREDQTz+/5TYJlq/ID+2uV1KgmFQBPiA6x6UBD6hRzA8sLDsR5bo9IvtYByYw
         23mlXC6ZyTF8SsqJNYyI5YxEs4l/Bnq0MGPMq3XxHNeVko9855KNFaCbgvfL/zTR84R5
         mN5fO5YJYN1Of7sGOU4yWZWRro2ozH7xH4vHoXhwBQrOSjyMAuMoC+oswcCC7J0VWvHU
         D2kw==
X-Gm-Message-State: AOAM531vMhfEfaFsWKB/4neJASP1SR2sqRmMytCbyuguhjZwoE8Ukw85
        ZbZ63vxNZx/Z8prBiMtsRtHSMF/4OrR73w==
X-Google-Smtp-Source: ABdhPJxe7v46MWOz2yZG3+G2YKkwMK7yJwBPmzZn0IroTf1I3jc7ff0Mf3qit4dn8rBUEzAl/lL+5w==
X-Received: by 2002:a17:902:8f94:b029:da:d168:4443 with SMTP id z20-20020a1709028f94b02900dad1684443mr370371plo.57.1607487183780;
        Tue, 08 Dec 2020 20:13:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 19sm389253pfn.133.2020.12.08.20.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 20:13:03 -0800 (PST)
Message-ID: <5fd04ecf.1c69fb81.bc182.11ee@mx.google.com>
Date:   Tue, 08 Dec 2020 20:13:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc7-201-gc9b6935dc4f4
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 307 runs,
 12 regressions (v5.10-rc7-201-gc9b6935dc4f4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 307 runs, 12 regressions (v5.10-rc7-201-gc9b69=
35dc4f4)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained      | arm    | lab-baylibre    | gcc-8    | sama5_de=
fconfig              | 1          =

imx6q-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6q-var-dt6customboard   | arm    | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_x86_64                | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc7-201-gc9b6935dc4f4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc7-201-gc9b6935dc4f4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c9b6935dc4f4d4ea5d48b6ea96220632c1a5eadf =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained      | arm    | lab-baylibre    | gcc-8    | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01c82b3964392b8c94cdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01c82b3964392b8c94=
ce0
        failing since 217 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx6q-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01f133bd1c075e1c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01f133bd1c075e1c94=
cc3
        failing since 44 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx6q-var-dt6customboard   | arm    | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01fc7eedefa9aaac94cd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01fc8eedefa9aaac94=
cd1
        new failure (last pass: v5.10-rc7-168-g5f4524a4d7e4e) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01bdf1fd845bc18c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01bdf1fd845bc18c94=
cc0
        failing since 7 days (last pass: v5.10-rc5-501-g8b4247fa6afd, first=
 fail: v5.10-rc6-167-g607b9a2b9696) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01f81f7b13b68a8c94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01f81f7b13b68a8c94=
cea
        failing since 2 days (last pass: v5.10-rc6-310-g01e6f29caf8f, first=
 fail: v5.10-rc6-420-gb2779a0d410f) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd018e2bafae32a68c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd018e2bafae32a68c94=
cdb
        new failure (last pass: v5.10-rc7-168-g5f4524a4d7e4e) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01ced990ec7370ec94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01ced990ec7370ec94=
cba
        new failure (last pass: v5.10-rc7-168-g5f4524a4d7e4e) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01a31d8c168b1f1c94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01a31d8c168b1f1c94=
ce4
        failing since 22 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01b06a510eedb28c94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01b06a510eedb28c94=
ce6
        failing since 22 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0189645bfab9e1ac94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0189645bfab9e1ac94=
cc4
        failing since 22 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0403520f7d04987c94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0403520f7d04987c94=
cca
        failing since 22 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd01aee5123fdc2c1c94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-2=
01-gc9b6935dc4f4/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd01aee5123fdc2c1c94=
cca
        new failure (last pass: v5.10-rc7-168-g5f4524a4d7e4e) =

 =20
