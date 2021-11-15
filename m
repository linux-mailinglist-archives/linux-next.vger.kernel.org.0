Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFD644FF3C
	for <lists+linux-next@lfdr.de>; Mon, 15 Nov 2021 08:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhKOHfD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 02:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhKOHew (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 02:34:52 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38031C061746
        for <linux-next@vger.kernel.org>; Sun, 14 Nov 2021 23:31:54 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b13so13769667plg.2
        for <linux-next@vger.kernel.org>; Sun, 14 Nov 2021 23:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VGCcV3B8MrQdWXvsbd9gcBRn8T1+sReUv14LQ6MYfYk=;
        b=Lrml7L+I1ZcVXx5SDL1NmiyUyDw2mZiTPj5NSUbYPtT6qPi0azVWmwN2puWVz/MJ5y
         ZJA0Ksqhqv6zhj0j6mQBUY4lRtQlKtmx/NdXwfikOljiEnpxYFre2aX5y/ouqSOT0XTJ
         bnOEaZqqnGmQxZKt6OXdi0unnDayTVtQHqbUF3lpv5n9hsJM6xuGfqRNfFM0oE0CLKYR
         tUkQB+e7QQLJrAlpH4p1LMMP2nPFKvytir3zIROQy4Z2GMcQf1DmTnWXYT5/7B4G6mew
         5nYJvlyLhnUzO+6IIrh3CwnXf7MkMGtNgvHxfqWetSmL2UkAjf8jO9h5Xtyg/U//fzij
         jopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VGCcV3B8MrQdWXvsbd9gcBRn8T1+sReUv14LQ6MYfYk=;
        b=cvFMTDLATQ5VbLT1zlkS5/DBfV11hyIdV+6FZ7na1ysu9MeOIs1lCZP0ohIPhT2rms
         +2WY+hEpzshXXLKFvueoMtiU64fToxahz/+zahmT7/NKtkWMCBAUFNzHz6zZrRuLuxHf
         rEDLAoTJnSOKEllYLz4ofc/GB6w8Hk0OvQZOR5FsCeakyHVNTgEXvukggFPXkCu7VaJn
         fcHFl6RYatt1z3FqasSa3/tnkt4LXXMt3Ie+1y5wN3IttwyLHs92ImJuFiVdtILF/vYS
         d7gHkm6LLN6WEb+H/hnsoaqb5fLijO7HNAXy1FlJvUe/GANkWilwiAba7PTLpi8hSc6v
         eetQ==
X-Gm-Message-State: AOAM530WXndDS2D7n7rL1o8sErXg0PqWJw5uJCiNZTRVrsG1pXs/1+Ht
        bkCUis8Rql7TVXMxq5Bb8CSrlogMveWgYF1N
X-Google-Smtp-Source: ABdhPJwKffunO7hLD1PDf7YhQqQfEvCFbx0qgI9Y4ImEiLjK6NZL6/OAkg1rE/b5d3JbHxESPyXkDA==
X-Received: by 2002:a17:90b:1650:: with SMTP id il16mr40977108pjb.242.1636961513523;
        Sun, 14 Nov 2021 23:31:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s2sm19193780pjs.56.2021.11.14.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 23:31:53 -0800 (PST)
Message-ID: <61920ce9.1c69fb81.2a5c1.763c@mx.google.com>
Date:   Sun, 14 Nov 2021 23:31:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211115
X-Kernelci-Report-Type: test
Subject: next/master baseline: 783 runs, 6 regressions (next-20211115)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 783 runs, 6 regressions (next-20211115)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | clang-13 | multi_v7_defconfi=
g           | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
            | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre  | clang-13 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211115/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211115
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      09bd48c4acfa9069ca7517ea27fcc17689ad0f2e =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | clang-13 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/6191d3527a2675c41833593e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211115/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211115/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6191d3527a2675c418335=
93f
        failing since 18 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6191cf1e5ed3afea2d3358f0

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6191cf1e5ed3afe=
a2d3358f4
        new failure (last pass: next-20211111)
        12 lines

    2021-11-15T03:08:01.928952  kern  <8>[   44.451533] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-11-15T03:08:01.930374  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6191cf1e5ed3afe=
a2d3358f5
        new failure (last pass: next-20211111)
        2 lines

    2021-11-15T03:08:01.936489  kern  :alert :   ESR =3D 0x96000045
    2021-11-15T03:08:01.937683  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-11-15T03:08:01.939013  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-11-15T03:08:01.940228  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-11-15T03:08:01.941439  kern  :alert :   FSC =3D 0x05: level 1 <8>[=
   44.480146] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>
    2021-11-15T03:08:01.942712  translation fault<8>[   44.487810] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 1075186_1.5.2.4.1>
    2021-11-15T03:08:01.943939  =

    2021-11-15T03:08:01.945141  kern  :alert : Data abort info:   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6191d2dedca61db63a3358e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6191d2dedca61db63a335=
8e2
        new failure (last pass: next-20211112) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | clang-13 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6191d68b8f9fae4a7d3358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6191d68b8f9fae4a7d335=
8e6
        new failure (last pass: next-20211112) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6191d57a688ffa107d3358ea

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6191d57a688ffa107d335929
        new failure (last pass: next-20211112)

    2021-11-15T03:35:05.165181  /lava-4984827/1/../bin/lava-test-case<8>[  =
 14.145582] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
