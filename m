Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF1D375F27
	for <lists+linux-next@lfdr.de>; Fri,  7 May 2021 05:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhEGDa4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 May 2021 23:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhEGDaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 May 2021 23:30:55 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C66C061574
        for <linux-next@vger.kernel.org>; Thu,  6 May 2021 20:29:56 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i13so6779717pfu.2
        for <linux-next@vger.kernel.org>; Thu, 06 May 2021 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DkVSGAVeFpyRfjDTWzdGROBq9jbr67K8yoZXQuWPEIo=;
        b=OMhpYZG0QxX/Fb4pKeS1ka7jdPjMC/pN+1gjwPFbhJBYRVYm3G5mJLL7f1NQnvN4Vq
         bxfRDOKCGwFZlF0czgKHd8o/15EMmklIBm7XF0Kn7BARMuW2C4C7zTpbxuttUPdD12f/
         s0xbb7NWpKyYcpZbVI7KtgqTUch9KdYDK1yiLMZDTk5A0nRai14rLCVtEztLDc7OQ4/a
         Hgwkh4I5oVw+/TWEXV1qNs+nTfvfZVYt48PUefTxXkg9dKQGDJAuYkmi6CArSraPE7us
         xLLDAh+ZXmCPznhN1MnoAl2HGMGRVgYlnKg6k7y/tqzj5S/aGjDcOidEbT9a16dNifqk
         VAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DkVSGAVeFpyRfjDTWzdGROBq9jbr67K8yoZXQuWPEIo=;
        b=r/AqUFImSe2aiEoC1cBXEWDdn4QmgJuDSOTyfbRtEw/l9ymWKrrq+0UcQ8nlSFkQZV
         keqR4nv+d3FmNoYifzmW/rhVTNn7GSCwj7fCmWFNOxhRguh71xAGiC2cdNUs+nQ4ejKb
         jJGj3ihjSbP6ICobIFEiJSEXripfMq35QejbnQ6hbhfp2RH7zb+y40cujo9fqzXpokta
         kfASYyUBCkyzSeL4ZgNJnfqtEBbG1efAaWvmoKvzPxvsH87L6Ot6mI2j6NDouFYHEa4k
         ZmwAYOX+oR/FoUSrH6r9V+Ag1DfiO5gdHTqt5NVaGPEuLVQZmyVWtTvucvLMzrakyArl
         RPSw==
X-Gm-Message-State: AOAM530FFZX4D8RImBigRDNP1gRvahmRn2oFafIQAo8l8j/GbIF9xPf+
        Rj/x+az0D5ZXOY+Zi7tHtbRK4eT30wYFxxMs
X-Google-Smtp-Source: ABdhPJxdVpeS6TL7UtjDboYYiwFofxGoyoXZt4ECQf76lDxO+y1CvHN4/xqywcHJYXlnhWJZpUx2lQ==
X-Received: by 2002:a63:1125:: with SMTP id g37mr7602896pgl.56.1620358195671;
        Thu, 06 May 2021 20:29:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s21sm10837769pjr.52.2021.05.06.20.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 20:29:55 -0700 (PDT)
Message-ID: <6094b433.1c69fb81.c3605.b722@mx.google.com>
Date:   Thu, 06 May 2021 20:29:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.12-14769-gf2b8e46e5bad
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 216 runs,
 15 regressions (v5.12-14769-gf2b8e46e5bad)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 216 runs, 15 regressions (v5.12-14769-gf2b8e46=
e5bad)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 2          =

bcm2837-rpi-3-b-32           | arm   | lab-baylibre    | gcc-8    | bcm2835=
_defconfig            | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mq-zii-ultra-zest        | arm64 | lab-pengutronix | gcc-8    | defconf=
ig                    | 1          =

imx8mq-zii-ultra-zest        | arm64 | lab-pengutronix | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-14769-gf2b8e46e5bad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-14769-gf2b8e46e5bad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f2b8e46e5bad2b18fa310e0d44223331d4a82dee =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60947a91762e5160826f5467

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60947a91762e516=
0826f546b
        failing since 9 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-06 23:23:43.526000+00:00  kern  :alert : Mem [   23.206342] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-06 23:23:43.527000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60947a91762e516=
0826f546c
        failing since 9 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-06 23:23:43.530000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-06 23:23:43.531000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-06 23:23:43.531000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-06 23:23:43.532000+00:00  kern  :alert : Data abort info:
    2021-05-06 23:23:43.532000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-06 23:23:43.569000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-06 23:23:43.570000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.245795] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-06 23:23:43.571000+00:00  0003a0ae000   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b-32           | arm   | lab-baylibre    | gcc-8    | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/609476e40e0d98153a6f5476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609476e40e0d98153a6f5=
477
        failing since 9 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60947d39efff3afb5f6f5469

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947d39efff3afb5f6f5=
46a
        failing since 0 day (last pass: v5.12-13980-g822909eab3c2, first fa=
il: v5.12-14615-gcafa2254e3fa3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mq-zii-ultra-zest        | arm64 | lab-pengutronix | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60947b97a2cbbeae846f546a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ul=
tra-zest.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ul=
tra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947b97a2cbbeae846f5=
46b
        failing since 0 day (last pass: v5.12-rc7-172-g314f802f6efd0, first=
 fail: v5.12-14615-gcafa2254e3fa3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mq-zii-ultra-zest        | arm64 | lab-pengutronix | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60947da14bea1fd83c6f5469

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutro=
nix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutro=
nix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947da14bea1fd83c6f5=
46a
        failing since 1 day (last pass: v5.12-rc8-129-g209594898343e, first=
 fail: v5.12-13980-g822909eab3c2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60947c2d7bcde60e1f6f5478

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947c2d7bcde60e1f6f5=
479
        new failure (last pass: v5.12-14615-gcafa2254e3fa3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60947ce93cf3f471086f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947ce93cf3f471086f5=
468
        new failure (last pass: v5.12-14615-gcafa2254e3fa3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60947b7060c7eb8ed76f547b

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60947b7060c7eb8ed76f5493
        failing since 9 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-05-06 23:27:40.206000+00:00  <8>[   56.644792] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
47b7060c7eb8ed76f5499
        failing since 9 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609474ccfb54f74bba6f546a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609474ccfb54f74bba6f5=
46b
        failing since 171 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609474de324a94bb756f5475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609474de324a94bb756f5=
476
        failing since 171 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6094a57240ae73642b6f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6094a57240ae73642b6f5=
468
        failing since 171 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6094748893d2a4b06f6f5470

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6094748893d2a4b06f6f5=
471
        failing since 171 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60947b3bd06e650aab6f5479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14769=
-gf2b8e46e5bad/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60947b3bd06e650aab6f5=
47a
        new failure (last pass: v5.12-14615-gcafa2254e3fa3) =

 =20
