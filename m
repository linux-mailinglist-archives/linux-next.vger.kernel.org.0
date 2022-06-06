Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0A1353E36D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jun 2022 10:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiFFG6p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jun 2022 02:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiFFG6m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2022 02:58:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3062408B
        for <linux-next@vger.kernel.org>; Sun,  5 Jun 2022 23:58:38 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so11844448pjq.2
        for <linux-next@vger.kernel.org>; Sun, 05 Jun 2022 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=c4wlR/ETsr+ndxlhK053kYliLJ2/a4p/ESt9J9KFkFg=;
        b=53eDnKPa6QB9VhBL6D+7wK2IfYVn3jEeQoV1SOhtc3Ll9RikzY9edGU+iPGkY5GjGb
         6rNRf1FHBLMkbhneT3vdc5bcVORwCiGfkgn+9FyjnKMgOomfs4WXbOvGx603qE0Hd3tS
         z4R9UQuSgL/E0w5y7v8asEcFhxqu0SO8M/bBETuAQ9n62jK3eP3lHA6LndKxTwLgWI9a
         Tbk0by8QNwZa8nMZGd64BSnOF8xWkvGSXIiN/+lF++k5rsU0c2XH+WI9Ljh4aqF4vEQP
         eTMBCF3w6wPmnxg6srxhD2QuenNNLT5sclb50oLDW6gm2QrvhE1A/ftYD/IVgSBJi0WH
         DDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=c4wlR/ETsr+ndxlhK053kYliLJ2/a4p/ESt9J9KFkFg=;
        b=lEnVY7fgeIJjWYDYIBMtnOgGjwln4eYpUlIYommqcvPeyo7CPab7N7un+CTdv8wkNe
         d19bktvCdVbINaOtTzQGeqyEqZhUGWzHcWn/1wMLFErDp1k/Z5JOa3XbXsHVP6Q2cMJ8
         vL0yHSjBSpO1gBQUevDZIHfKMHsU3WBakJQQxoT8Q/vWi7snY1OXOePzTzZBBb6Xchhr
         6KzogOIdZfxFgP/ntfFx424kGpT8WErjTBZFX6bsCI4WduvChsd7dVJ8WwrLUc+cBAhi
         QSq/oMbGsYwqp2X4SU6H4OOdF10hJOk4JcRBQMDmtWGS7d6z/a9I63gI91VamdFZPAGH
         hfCQ==
X-Gm-Message-State: AOAM533oT4FWKYO83AfFJY8Zvx214cSQdhbj4RXf2ktu1dS9LlhyaEC/
        9YBosgxPCtRkzxQYcEDClTI1dyWMWQWWWQTa
X-Google-Smtp-Source: ABdhPJxSpPhnY8RwdDVHRFs50slct83jfz6seUZYhgk5lCdTToyykh5+yAwsTi13/3GmqVuPeNChVw==
X-Received: by 2002:a17:902:e1cc:b0:164:1517:e8bf with SMTP id t12-20020a170902e1cc00b001641517e8bfmr23126242pla.98.1654498717221;
        Sun, 05 Jun 2022 23:58:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ij20-20020a170902ab5400b001676daaf055sm2681541plb.219.2022.06.05.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 23:58:36 -0700 (PDT)
Message-ID: <629da59c.1c69fb81.da334.6298@mx.google.com>
Date:   Sun, 05 Jun 2022 23:58:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-102-g5a749a6e62f23
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 467 runs,
 43 regressions (v5.19-rc1-102-g5a749a6e62f23)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 467 runs, 43 regressions (v5.19-rc1-102-g5a749=
a6e62f23)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc1-102-g5a749a6e62f23/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc1-102-g5a749a6e62f23
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5a749a6e62f239d6a05ca264344e7f03f719615a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6d6727cd76589ea39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6d6727cd76589ea39=
be9
        failing since 0 day (last pass: v5.18-11819-gfcd5217077654, first f=
ail: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6f80dc1d5bade5a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-a=
t91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-a=
t91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6f80dc1d5bade5a39=
bd8
        failing since 6 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6c25eb9a9a92dba39bce

  Results:     4 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/629d6c25eb9a9a9=
2dba39bd5
        failing since 133 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-06T02:53:16.287171  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-06T02:53:16.287470  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-06T02:53:16.290221  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-06T02:53:16.336026  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6d99b8d6cb8c9fa39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6d99b8d6cb8c9fa39=
bf5
        failing since 6 days (last pass: v5.16-rc4-241-g3e464b455df7, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6f8d93a61d66cca39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6f8d93a61d66cca39=
bf3
        failing since 6 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7019b277c364c0a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7019b277c364c0a39=
bd2
        failing since 6 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d720ddad5bed434a39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d720ddad5bed434a39=
be3
        failing since 6 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7875f4874578aaa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7875f4874578aaa39=
bce
        failing since 6 days (last pass: v5.16-rc4-241-g3e464b455df7, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6d6baa73aec74ca39c2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6d6baa73aec74ca39=
c2b
        failing since 13 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d74eda35bab7082a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d74eda35bab7082a39=
bd8
        failing since 37 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d77d072937f64dda39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-j=
etson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-j=
etson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d77d072937f64dda39=
bd0
        failing since 17 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7b56aeef5cef23a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7b56aeef5cef23a39=
bf5
        failing since 17 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7200faf56be088a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7200faf56be088a39=
bd0
        failing since 0 day (last pass: v5.18-12139-gb5db4eaa8649, first fa=
il: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d71134ec006e16fa39bd0

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
9d71134ec006e16fa39bd9
        failing since 6 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-06T03:13:58.985686  /lava-124760/1/../bin/lava-test-case
    2022-06-06T03:13:59.061709  <8>[   40.449237][  T318] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6e681623171164a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6e681623171164a39=
bd1
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6ed630e3e79093a39c08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6ed630e3e79093a39=
c09
        failing since 27 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d71d4768a8ed99aa39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d71d4768a8ed99aa39=
be1
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d71ffdad5bed434a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d71ffdad5bed434a39=
bd1
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d71d5dc59a53b5fa39c49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d71d5dc59a53b5fa39=
c4a
        failing since 26 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7201dad5bed434a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7201dad5bed434a39=
bd7
        failing since 26 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d724c1aed98d769a39c69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d724c1aed98d769a39=
c6a
        failing since 26 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7202dad5bed434a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7202dad5bed434a39=
bdd
        failing since 26 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/629d736a22c30ec392a39be2

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/629d736a22c30ec392a39c04
        failing since 98 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-06-06T03:24:10.154130  /lava-6548871/1/../bin/lava-test-case
    2022-06-06T03:24:10.165411  <8>[   57.037625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/629d736b22c30ec392a39c27
        failing since 6 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-06T03:24:08.516255  /lava-6548871/1/../bin/lava-test-case
    2022-06-06T03:24:08.530895  <8>[   55.400253] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/629d736b22c30ec392a39c28
        failing since 6 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-06T03:24:06.489382  <8>[   53.356111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-06T03:24:07.491316  /lava-6548871/1/../bin/lava-test-case
    2022-06-06T03:24:07.506673  <8>[   54.374618] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/629d736b22c30ec392a39c29
        failing since 6 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-06T03:24:05.620413  <4>[   52.486880] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-06T03:24:06.471862  /lava-6548871/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d70d15c6f42f20fa39c49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d70d15c6f42f20fa39=
c4a
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7226faf56be088a39c04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-ban=
anapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-ban=
anapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7226faf56be088a39=
c05
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7318fd39caaf99a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7318fd39caaf99a39=
bdd
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6ff793c7b6815ca39bf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6ff793c7b6815ca39=
bf7
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d700693c7b6815ca39c09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d700693c7b6815ca39=
c0a
        failing since 0 day (last pass: v5.18-11819-gfcd5217077654, first f=
ail: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6f6a4cfe841b5da39bff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun=
8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun=
8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6f6a4cfe841b5da39=
c00
        new failure (last pass: v5.18-12248-g882f1d1979b5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6b8377936d5d4ba39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-=
olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-=
olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6b8377936d5d4ba39=
bcf
        failing since 0 day (last pass: v5.18-12248-g882f1d1979b5, first fa=
il: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6e076abd04acbea39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6e076abd04acbea39=
bf5
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d735822c30ec392a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d735822c30ec392a39=
bdd
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7268490869cfd3a39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7268490869cfd3a39=
bee
        failing since 6 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6b935ded1f9120a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6b935ded1f9120a39=
bd4
        new failure (last pass: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7bc22c65fad1ffa39c5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r=
40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r=
40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7bc22c65fad1ffa39=
c5f
        new failure (last pass: v5.18-12248-g882f1d1979b5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6d69ba6582b316a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6d69ba6582b316a39=
be2
        failing since 10 days (last pass: v5.18-1222-g391cf5a1244f, first f=
ail: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d700ba3d8bcd829a39c08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d700ba3d8bcd829a39=
c09
        failing since 13 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d71689414afda27a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-=
tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-=
tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d71689414afda27a39=
bd9
        failing since 2 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-12248-g882f1d1979b5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629d77125404e8bdb6a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegr=
a124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegr=
a124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d77125404e8bdb6a39=
bce
        failing since 13 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d6eaf307e8afc5ca39c4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
02-g5a749a6e62f23/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d6eaf307e8afc5ca39=
c4d
        failing since 4 days (last pass: v5.18-11819-gfcd5217077654, first =
fail: v5.18-12139-gb5db4eaa8649) =

 =20
