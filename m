Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48FC37F7FA
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 14:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhEMMb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 08:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbhEMMbz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 08:31:55 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504DCC061574
        for <linux-next@vger.kernel.org>; Thu, 13 May 2021 05:30:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id s20so14270407plr.13
        for <linux-next@vger.kernel.org>; Thu, 13 May 2021 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t/m78wkxrAVIXPPu7aQW8ZwtoVAEXloX/QfzG6cxsxQ=;
        b=ooMYa5c6pF7yKSpG7JMIsIxO9tquRjPJZ6yMkWtirFRY8S1MCt+qhbYz2YeV8m48yh
         XjRASHKhESBH0urBqUFDOTEpT3HKLJb8MArD4LXhuThfH/wv9buYz6tgzsxrJhbrSo6T
         rHHQ7Kbhp8KC6HyFAPooi6dEicu5797na9AMwEcvYXi4TxBhXwrxfTrgOUuErFD3EzvG
         fW9oMzJqlZrzfsnqXhjeZeMAtCufQxC4JMeAkV+00P+cIZ07eXk+CuxSfXa1vJYSquXi
         mwxZyqdIppeQi0pQPcC0QdCbxH3LncRHs9ldBnmfZ3ZRNS3zDH93k++dUPab/nIXYvVN
         eqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t/m78wkxrAVIXPPu7aQW8ZwtoVAEXloX/QfzG6cxsxQ=;
        b=BDvViiVX4CtVPaM88mXucEi6N3O/mhPkwYhliU+2SyNV8Et8vRAofNdY0/ULtySzuf
         8Yqpj/lPfmVPm6FFwI7PI2j6Ti/6btfVFb7KazzELSJk/QCjguRohWoCBz0bLNhFK01m
         qb9oGXJEwouaC2pd8gNUbpYfDlGW+lCNl+tpwjaaWWca9YSLW0sJY04SmrnTbV7RhzrC
         aNethVZPfYOjgmS0a+MwSVmVd+AF33Igz1hFdB9Lo2Iv/FmQ9v5H0vtClbCICg+MjLyj
         L2L8cPCiNct8QvhWsRbPbR/oSOCxEhCF6C/uo0EXPItqJ9N7yThIW8ynmne3lXRkBWmB
         vh4g==
X-Gm-Message-State: AOAM531CzXUnpM4etkZDgAh4ip0yheh4WzGRA5ZjbXOkMLBXO7ZAlXFq
        cFhHkj5OUmk3EEGQQAMInMiVOn4MTyWM4B7f
X-Google-Smtp-Source: ABdhPJzBcQiklB3z06JxQbJZ2gk/0AzCbox2KodLSQSDUCrTPV/aXAgokB0o3UebzV4jGnsEZxAogQ==
X-Received: by 2002:a17:902:d4c2:b029:ed:4a62:abda with SMTP id o2-20020a170902d4c2b02900ed4a62abdamr39136061plg.5.1620909044537;
        Thu, 13 May 2021 05:30:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e1sm2144569pgl.25.2021.05.13.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 05:30:44 -0700 (PDT)
Message-ID: <609d1bf4.1c69fb81.ffe21.7847@mx.google.com>
Date:   Thu, 13 May 2021 05:30:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210513
Subject: next/master baseline: 601 runs, 14 regressions (next-20210513)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 601 runs, 14 regressions (next-20210513)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210513/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210513
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ec2618180c3450d06a6a4ba951d4c9a2c689b517 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609ceb46d39b3e1434ccc2b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ceb46d39b3e1434ccc=
2ba
        failing since 77 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce8adc50067cc83ccc2b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce8adc50067cc83ccc=
2b7
        failing since 0 day (last pass: next-20210510, first fail: next-202=
10512) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce13a58d280554eccc2b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce13a58d280554eccc=
2b1
        new failure (last pass: next-20210512) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce36dc0398167d5ccc2cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce36dc0398167d5ccc=
2cd
        new failure (last pass: next-20210512) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce6bc611177cf53ccc2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce6bc611177cf53ccc=
2f1
        new failure (last pass: next-20210512) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609ce29026e20ee1eeccc2c2

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609ce29026e20ee1eeccc2d6
        failing since 36 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-05-13 08:25:48.163000+00:00  /lava-3794454/1/../bin/lava-test-case
    2021-05-13 08:25:48.171000+00:00  <8>[   55.751374] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
ce29026e20ee1eeccc2dc
        failing since 36 days (last pass: next-20210323, first fail: next-2=
0210406) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609cdad948358299a0ccc2d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609cdad948358299a0ccc=
2d7
        failing since 176 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609cdae380738ba22accc2a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609cdae380738ba22accc=
2a7
        failing since 176 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609cdad9750e3e08bcccc2b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609cdad9750e3e08bcccc=
2b9
        failing since 176 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609cdb1233d1f1ef72ccc2d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609cdb1233d1f1ef72ccc=
2d9
        failing since 176 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
r8a77950-salvator-x     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce275c1b82de810ccc2bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce275c1b82de810ccc=
2bc
        new failure (last pass: next-20210512) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609ce406fc08e5c0adccc2d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ce406fc08e5c0adccc=
2da
        failing since 91 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609cde653505115779ccc2c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210513/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609cde653505115779ccc=
2c5
        failing since 91 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
