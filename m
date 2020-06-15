Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448B61F8CCA
	for <lists+linux-next@lfdr.de>; Mon, 15 Jun 2020 06:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgFOEBP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 00:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgFOEBP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2020 00:01:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCA8C061A0E
        for <linux-next@vger.kernel.org>; Sun, 14 Jun 2020 21:01:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id i4so6511335pjd.0
        for <linux-next@vger.kernel.org>; Sun, 14 Jun 2020 21:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=q19qCLDHbCEXzBp/fJey4tQHz3J7up/3eh+yWrreph8=;
        b=ejwd/qRS2pKKE9LJlDIdVY9rrajbAmniekrnHXu05UAUfWvwCAxGdvqHXx+E1IIgzx
         ue73BJMZLGex6OCXlpnHZp2T2gM/w8bT94wofuopjfTsajCHS0seAyrkUALPAoLUMUCn
         lrn4BDJxEFieUv527GA0h43ngPeg7ICe9K6AWA8tlsuLtKys5UDkZ8AzdOJtGMACM/fA
         bL0v26x8fhZzpzB6lew+oc4SEpQBiMVZ3epEhBsqE2AGEc6I45hw4s/UvuprVkby8GZL
         eWp95r41/vFm7w5O8+HjV95cV5kysyiAWm8c/QpPvQ+KM1PKUX9SKXOx51+4rMkLVfKE
         xOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=q19qCLDHbCEXzBp/fJey4tQHz3J7up/3eh+yWrreph8=;
        b=HpJY3psBcezYjB4DdQJsb0VE5dEt1IfGTcGr2pjHBzXPZYD+yZXa2WDYdSlEKHA450
         7vsgiaT04jEYNNUZzGLZX0Q5lG+eJryWEUOlEJZYvmS+wrQTGMkRNxaNhzH7pI+WX9T1
         9mzZLoDv+g0EyswKFofFZ++uYhRBQnkNhAsCj0pJ2bAZY9dlC5Ec5G6RWjStRaGSmrgo
         6kR8MI4gQ39qf/2ik7w/jfPEeviPPyWZEFuDMENoEBrg1KnQeqPlI0F9dxJacX+wj0bk
         SdI44si7IDrSvj28Y9taVB1nfzNZk4WuZesib44KnaA7kut3XVXc5LZbYdn2Oi7Hk89w
         RXaQ==
X-Gm-Message-State: AOAM532vw5iUOMTC+l4DLx7yG2/mWfBIjzdabBib5mMNafq31wUgxOCM
        2RtebtKJszEgZZyXlgwl5O98ln6N/H0=
X-Google-Smtp-Source: ABdhPJxW5nzTBBp1vRA6JeAWRBNW4ud072GMD7MAQdHbZXhGzDDalEw888RnuMNtuwHBuiGEaWPNgg==
X-Received: by 2002:a17:902:c40c:: with SMTP id k12mr21136468plk.105.1592193673869;
        Sun, 14 Jun 2020 21:01:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o1sm11231459pja.49.2020.06.14.21.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 21:01:13 -0700 (PDT)
Message-ID: <5ee6f289.1c69fb81.7713b.6999@mx.google.com>
Date:   Sun, 14 Jun 2020 21:01:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-88-ga69361f43850
Subject: next/pending-fixes baseline: 154 runs,
 5 regressions (v5.8-rc1-88-ga69361f43850)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 154 runs, 5 regressions (v5.8-rc1-88-ga69361f4=
3850)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-88-ga69361f43850/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-88-ga69361f43850
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a69361f438503e2772782446524858112fac25f2 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6c02ff2db5abfd497bf0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6c02ff2db5abfd497b=
f0f
      failing since 1 day (last pass: v5.7-14137-g60392f4b277d, first fail:=
 v5.7-14706-g24b012885d29) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6c259c5914df63c97bf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6c259c5914df63c97b=
f0b
      failing since 2 days (last pass: v5.7-14137-g60392f4b277d, first fail=
: v5.7-14413-gf19136b39e47) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6bdd1b022ffe8ff97bf10

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee6bdd1b022ffe8=
ff97bf13
      failing since 1 day (last pass: v5.7-14413-gf19136b39e47, first fail:=
 v5.7-14706-g24b012885d29)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6bd7685361424f497bf21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6bd7685361424f497b=
f22
      failing since 2 days (last pass: v5.7-13513-ga8195ca429a0, first fail=
: v5.7-14413-gf19136b39e47) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6be270af64b710497bf32

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-88=
-ga69361f43850/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee6be270af64b7=
10497bf37
      new failure (last pass: v5.7-15164-g875d8f7462d6)
      2 lines =20
