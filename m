Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335555967F7
	for <lists+linux-next@lfdr.de>; Wed, 17 Aug 2022 06:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiHQEWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Aug 2022 00:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiHQEWa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2022 00:22:30 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4540F5AC4D
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 21:22:26 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id p18so10992901plr.8
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=GEPNzG2kLsinNZPOKPDiTgspl9sE41iNm3/P6HqBcUs=;
        b=E4VYsCcS+oOpSHQ9F5KDjVzWo4UPoG33cIwXoxfPGxiTKyD+5oP3NVQjrEGbPaSCdy
         8xQ/WR/wzHxPw8/MM8W03tkAx3NPUzpdcyKQkA/SxznPEt0lHxFfoQQn6JKMpgCfJ6gW
         H3i5GlE3WF0zIUjiLwFDyXcjVX26c0U1wnWEQPNE44HYbHp64jYMK/ORIMmOlArw3MTG
         RgVYWq9vQ+6PMWSwq/HNV9H/FKk9tkRQ1RPX1FGx3Un9PYY9JjXzfLAMDa4OYT3MHqKV
         Ysj49gcrLdKCYldnJp/rbWKUn+WOPK9AvsO+IG5ksMpTNcoI3HzDIE9qPcpd/LLKTtkc
         DK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=GEPNzG2kLsinNZPOKPDiTgspl9sE41iNm3/P6HqBcUs=;
        b=A9OyYmQLrcmLuk6Vkrc3pw8dCEoFHjmJYL73i6UIcSasrwyR/x/6nwIgpnMX35Z7mY
         B2wlIz55e/1EZrulnj/QnWFoBA8sqYpEHV9lBHRs9JBgdq6KXqTJMQluKNXVwQQbqhX7
         6YP2xaB3SLIjzSZUZZUIGBI0tM4WEYWLCRhJrCg1YJXY9FTIPXlrOMLgSlzmqGLtzKF9
         Kfkn8aTdJdOt1lmMERQTBjtXgvuz6FAY9iok9ydwJe5GTCQWPuKwxjDN3zVoVvGP74Qs
         u1IdW7wk9tREQRQOhhZZ6t7gC8s0XSV4JgQIM38RCUj3FduErA7OVeiRpFWrHtMZtXRy
         mSlg==
X-Gm-Message-State: ACgBeo2KR3iBhBcF7dt/JzQQwAC/w2msA39fjLFKWhemD5NBZJ4EnzeS
        kTtLGdsPddO3Y6guaAWuN/98Xp4o+NLBiUNf
X-Google-Smtp-Source: AA6agR7KpQNyqnON6XD651nJ1LolI/Nt+TfHaCoa229m3Iw/uLkPM68u5iFU/v67BRgZxCSFBJty3g==
X-Received: by 2002:a17:90b:4390:b0:1f7:2cb1:9e43 with SMTP id in16-20020a17090b439000b001f72cb19e43mr1877910pjb.91.1660710144915;
        Tue, 16 Aug 2022 21:22:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ep3-20020a17090ae64300b001f4ebd47ae7sm382170pjb.54.2022.08.16.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 21:22:24 -0700 (PDT)
Message-ID: <62fc6d00.170a0220.e2c54.0d4d@mx.google.com>
Date:   Tue, 16 Aug 2022 21:22:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-204-g5ca89432fef1f
Subject: next/pending-fixes baseline: 414 runs,
 42 regressions (v6.0-rc1-204-g5ca89432fef1f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 414 runs, 42 regressions (v6.0-rc1-204-g5ca894=
32fef1f)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig           | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | omap2plus_defc=
onfig          | 1          =

beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig           | 1          =

beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig           | 1          =

beaglebone-black      | arm   | lab-broonie     | gcc-10   | omap2plus_defc=
onfig          | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | omap2plus_defc=
onfig          | 1          =

da850-lcdk            | arm   | lab-baylibre    | gcc-10   | davinci_all_de=
fconfig        | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig           | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

imx7d-sdb             | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =

jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+cryp=
to             | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 3          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig     =
               | 2          =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre    | gcc-10   | defconfig     =
               | 2          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig           | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | omap2plus_defc=
onfig          | 1          =

qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc1-204-g5ca89432fef1f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc1-204-g5ca89432fef1f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5ca89432fef1fe21d205e71455a40b6b97459a12 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc43bc6e4c265e6535564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc43bc6e4c265e65355=
650
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc4496030f2a94df355661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc4496030f2a94df355=
662
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc44977abc25d51335564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc44977abc25d513355=
650
        failing since 8 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc45101588b10f0535564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/basel=
ine-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/basel=
ine-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc45101588b10f05355=
64f
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc4268625a4b844a355659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am=
57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am=
57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc4268625a4b844a355=
65a
        failing since 9 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc36a1e42edcfad8355670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/b=
aseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/b=
aseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc36a1e42edcfad8355=
671
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc37f697804cc9fb355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc37f697804cc9fb355=
655
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc39483d1d794ddb355650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc39483d1d794ddb355=
651
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3a9d1ae2c4c984355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3a9d1ae2c4c984355=
649
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc4402d3e88a344e35565a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/basel=
ine-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/basel=
ine-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc4402d3e88a344e355=
65b
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc459e85478cc208355663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc459e85478cc208355=
664
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc46f295254e6031355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc46f295254e6031355=
643
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-broonie     | gcc-10   | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc354ed20cfa2d7435565d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc354ed20cfa2d74355=
65e
        failing since 9 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3feab9c32ea937355678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3feab9c32ea937355=
679
        failing since 9 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
da850-lcdk            | arm   | lab-baylibre    | gcc-10   | davinci_all_de=
fconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc30995005b23a1d3556b9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62fc30995005b23=
a1d3556c1
        failing since 205 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-08-17T00:04:30.403271  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-08-17T00:04:30.403618  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-08-17T00:04:30.406408  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-08-17T00:04:30.451385  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc37dc4ad5314a94355674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc37dc4ad5314a94355=
675
        failing since 28 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3b74e9e0f6eee3355670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3b74e9e0f6eee3355=
671
        failing since 78 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3c141cd0a9e25335564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3c141cd0a9e253355=
64c
        failing since 78 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3f98cc198b19e1355650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3f98cc198b19e1355=
651
        failing since 52 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc41b45c0e497edf35565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc41b45c0e497edf355=
65d
        failing since 78 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx7d-sdb             | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc339f0824aca112355679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc339f0824aca112355=
67a
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc4539e100e445cb35573a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc4539e100e445cb355=
73b
        failing since 109 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+cryp=
to             | 2          =


  Details:     https://kernelci.org/test/plan/id/62fc33c2135ae70f4835569a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fc33c2135ae70f483556a8
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-17T00:17:58.777063  /lava-155653/1/../bin/lava-test-case
    2022-08-17T00:17:58.777525  <8>[   19.414231] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
c33c2135ae70f483556aa
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-17T00:17:59.815063  /lava-155653/1/../bin/lava-test-case
    2022-08-17T00:17:59.815474  <8>[   20.458679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-17T00:17:59.815738  /lava-155653/1/../bin/lava-test-case
    2022-08-17T00:17:59.815979  <8>[   20.478669] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/62fc362edcc6ecee18355646

  Results:     49 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fc362edcc6ecee18355654
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-17T00:28:15.733357  /lava-155663/1/../bin/lava-test-case
    2022-08-17T00:28:15.733754  <8>[   19.399267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-17T00:28:15.734008  /lava-155663/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
c362edcc6ecee18355656
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-17T00:28:16.755058  /lava-155663/1/../bin/lava-test-case
    2022-08-17T00:28:16.755707  <8>[   20.443455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-17T00:28:16.755967  /lava-155663/1/../bin/lava-test-case
    2022-08-17T00:28:16.756199  <8>[   20.463381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-17T00:28:16.756431  /lava-155663/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62f=
c362edcc6ecee18355659
        new failure (last pass: v6.0-rc1-172-gee556793d89d0)

    2022-08-17T00:28:17.792667  /lava-155663/1/../bin/lava-test-case
    2022-08-17T00:28:17.793058  <8>[   21.507040] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-17T00:28:17.793309  /lava-155663/1/../bin/lava-test-case
    2022-08-17T00:28:17.793544  <8>[   21.526958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/62fc392cb197c943273556e8

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fc392cb197c943273556f6
        failing since 9 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3)

    2022-08-17T00:40:45.932008  /lava-155679/1/../bin/lava-test-case
    2022-08-17T00:40:45.932380  <8>[   19.768519] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-17T00:40:45.932632  /lava-155679/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
c392cb197c943273556f8
        failing since 9 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3)

    2022-08-17T00:40:46.969772  /lava-155679/1/../bin/lava-test-case
    2022-08-17T00:40:46.970394  <8>[   20.812872] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-17T00:40:46.970654  /lava-155679/1/../bin/lava-test-case
    2022-08-17T00:40:46.970891  <8>[   20.832856] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-17T00:40:46.971126  /lava-155679/1/../bin/lava-test-case
    2022-08-17T00:40:46.971353  <8>[   20.853459] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-17T00:40:46.971579  /lava-155679/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre    | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/62fc390f5906e307bf355667

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-kha=
das-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-kha=
das-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62fc390f5906e30=
7bf35566e
        new failure (last pass: v6.0-rc1-172-gee556793d89d0)
        2 lines

    2022-08-17T00:40:22.486475  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-08-17T00:40:22.525174  kern  :alert : Data abort info:
    2022-08-17T00:40:22.525550  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-08-17T00:40:22.526068  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-08-17T00:40:22.526327  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000bdb8c000
    2022-08-17T00:40:22.526572  kern  :alert :<8>[   20.014887] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-08-17T00:40:22.526813   [0000000000000328] pgd=3D08000000b<8>[   2=
0.025366] <LAVA_SIGNAL_ENDRUN 0_dmesg 2383860_1.5.2.4.1>
    2022-08-17T00:40:22.527049  db8d003, p4d=3D08000000bdb8d003, pud=3D0800=
0000bdb8e003, pmd=3D0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62fc390f5906e30=
7bf35566f
        new failure (last pass: v6.0-rc1-172-gee556793d89d0)
        12 lines

    2022-08-17T00:40:22.482440  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000328
    2022-08-17T00:40:22.482844  kern  :alert : Mem abort info:
    2022-08-17T00:40:22.483381  kern  :alert :   ESR =3D 0x0000<8>[   19.97=
2791] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D12>
    2022-08-17T00:40:22.483646  000096000006
    2022-08-17T00:40:22.483894  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-08-17T00:40:22.484135  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-08-17T00:40:22.484368  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3688c61b9e43a7355667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3688c61b9e43a7355=
668
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc38681aad1355b33556b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc38681aad1355b3355=
6b1
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc39f9639f69fb9a355656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc39f9639f69fb9a355=
657
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3bd96e0feb02ee355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3bd96e0feb02ee355=
649
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc34d05b00e611cc35568b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc34d05b00e611cc355=
68c
        failing since 9 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc344acc0cf3e94335568a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc344acc0cf3e943355=
68b
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc34f65e6cb08020355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc34f65e6cb08020355=
643
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc363dbe66b2ae6b35564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc363dbe66b2ae6b355=
64c
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc3449cc0cf3e943355687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc3449cc0cf3e943355=
688
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc34a65dc881b7ba35565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc34a65dc881b7ba355=
65c
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fc361ef6f6ae860c355649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-20=
4-g5ca89432fef1f/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fc361ef6f6ae860c355=
64a
        failing since 11 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =20
