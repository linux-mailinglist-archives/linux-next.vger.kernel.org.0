Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047AB57C925
	for <lists+linux-next@lfdr.de>; Thu, 21 Jul 2022 12:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbiGUKgz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jul 2022 06:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbiGUKgu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2022 06:36:50 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1345282475
        for <linux-next@vger.kernel.org>; Thu, 21 Jul 2022 03:36:26 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id f11so1422254plr.4
        for <linux-next@vger.kernel.org>; Thu, 21 Jul 2022 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/udjK/dNCl0QVYKPnBIVnsjY8lt/2V9GwBBo6D3+Xjw=;
        b=PfV3zYXynvEAcz/IC+nyWMvxIMqwNqPQ/gXKouR70A+4eLesq4ZJs027Oy23q2KLk/
         +en33liAWh7AEnoX3tiJPI4t3UJLx4903PWTSv1tV10trJKB8qgSq8lqdfW4qo5oO4fQ
         jjKyQIwkrx2F30dmawAXzE21HH5ppSVBssgaet6ArBefvWM/2fI9MVTuqwsHTXBKcGt+
         jOI55AUBozgFhyLSX4S95leXZpX26x5XY1KH57dWQZmQwR1qYlG/1T39ZiowCTselhiW
         Hsniyj5KbEHHAO17qlXZVzXOd5K3r+EWlJCeFhhKqRNqn2HV5FbtDiKKc8A7d8nOmq/m
         K9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/udjK/dNCl0QVYKPnBIVnsjY8lt/2V9GwBBo6D3+Xjw=;
        b=ZWLHUJhg0dbbCisrFYI76mqkYkakPmIWJVVWME0pQy1Knh+nWJW1/ENJRM4rlW9yWe
         WyJckOgsRSMBfK/JOZpWBnPlMyn5bhcovBsnQ6yMcCG65kjlTIg6Xij6Hk4VQ5dS4WYf
         0xvRg6B1e1VdoOepTFJCXH8tiHqbuLrJ621VejRvwrKAvoxylZ7avxJm+b99r6+cNz0j
         6bed4i7P/S6pc6IJ3cnziMWME8OxEoesqz1rev6E1jjJLX/gu/NqLSea0ChF/LY3sTkt
         2Y7IRBQKTilBCHPFTihX/Q7ko39ykzl4o/UI1fVVn5KP43f/Spl9UxlKxInencAWUqNN
         toMw==
X-Gm-Message-State: AJIora8Z+lVxi0BcwhMTocMStYD9e9Czhyhwr0rcjT64hA6tTY+mgxZP
        EhBI+AxncTPk/UwO3hCXH548zKdlIktJUeQIVeQ=
X-Google-Smtp-Source: AGRyM1vKKyzDGr3ajShpPGfhtDgDXVlLUtBliL+bfKp6JHllVlugrc6KfBhpBtzLoTQt4AQIG+F3nA==
X-Received: by 2002:a17:90b:4f8f:b0:1f2:1eab:b3ea with SMTP id qe15-20020a17090b4f8f00b001f21eabb3eamr7972793pjb.243.1658399785836;
        Thu, 21 Jul 2022 03:36:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c13-20020a170903234d00b0016c0408932dsm1337140plh.129.2022.07.21.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 03:36:25 -0700 (PDT)
Message-ID: <62d92c29.1c69fb81.ed086.207d@mx.google.com>
Date:   Thu, 21 Jul 2022 03:36:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc7-260-gaab2277715b66
Subject: next/pending-fixes baseline: 433 runs,
 7 regressions (v5.19-rc7-260-gaab2277715b66)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 433 runs, 7 regressions (v5.19-rc7-260-gaab227=
7715b66)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig           | 1          =

imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc7-260-gaab2277715b66/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc7-260-gaab2277715b66
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aab2277715b6685019135996862f1938eb05f14a =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8facf241ad7bdfbdaf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8facf241ad7bdfbdaf=
077
        failing since 1 day (last pass: v5.19-rc6-500-g27ca1dbc37a0, first =
fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8f274e69b6e92d1daf0a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8f274e69b6e92d1daf=
0a8
        failing since 51 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8f6e7a447868565daf0a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8f6e7a447868565daf=
0a3
        failing since 25 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8f773353412f0e0daf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8f773353412f0e0daf=
05e
        failing since 51 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8fb5b72f642cf15daf09e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8fb5b72f642cf15daf=
09f
        failing since 51 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8f6ea9d276a49c8daf0ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8f6ea9d276a49c8daf=
0ae
        failing since 82 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d8f3dae30b5e25c4daf072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
60-gaab2277715b66/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d8f3dae30b5e25c4daf=
073
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =20
