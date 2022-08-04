Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872ED58A33C
	for <lists+linux-next@lfdr.de>; Fri,  5 Aug 2022 00:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbiHDWXL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Aug 2022 18:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239836AbiHDWXC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2022 18:23:02 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FAC316
        for <linux-next@vger.kernel.org>; Thu,  4 Aug 2022 15:22:58 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b133so716560pfb.6
        for <linux-next@vger.kernel.org>; Thu, 04 Aug 2022 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=2PAMzD+VLWShzt+s19ZB9Esh3jbBCWZjyCLUafbnN1A=;
        b=aI7k6MxW9dxYPdBXiWhOIq2THk65ZMiEmB2CmTKtFtmgFNwAa5WiZ4S0JITphYKy8g
         IfbJXHViGUhLCWPd3kt5ij0x9ktMLXVID4j50kNu1whU02KgrgUhQNt1eZYX9S73AISe
         biH+T/fcYQN0fkQc5me9+dO+/iK3WUcKNFmxaseRWPvkI2sGl0tKE9iarOwGl5qm/6ME
         vkvI7wWjfiM8R3Pd13B3FePyMEcwzkSjm/Vwvu+ZSqUbCb8gUir/YJK4tosA6RtOO6Gd
         91A9wQJqmnDT1aywFS+mMG8E79965BGyHcfMQmzy0kc0XD7tdreJGHPgZ19Hj0nYaZ4I
         oD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=2PAMzD+VLWShzt+s19ZB9Esh3jbBCWZjyCLUafbnN1A=;
        b=Pf1MaKgVf2ONh7zPqGbiagUFrIPFGHnDpSB5SCUcf8QkhNoA0Zl8i5HcdwB3OxmBiP
         7fMphhHibUVYNob2RxAln56lLA5mBgaJGmJVLrbmdfVDeQ+k8WtQJE2FcFdAuzvyst8s
         wU/gTOR4xImKDudPZKlvMWjcw8wO8uCL61KLML9z82UQ12hdRyyg3y8XJDosxaEgc6PI
         kywYwtzmpgYu3t7hgGJJg3CQmly77HJiysEzfj362LNDtDgsputOVMcuEHXOJ+w7BHxQ
         lXYfTJG4w/Zi5O5r6c3GanNkV1NZYkcYnQqlQrIhwphaHUTWmjCqAb9kNBBP/++Bqbvm
         E0Kg==
X-Gm-Message-State: ACgBeo18GkuRKNQiwG4gvWxQDyLV4TrhEP43EEXSrHPy4CcigGY8FbMo
        0ad5FRRD01Hsbl2eecYKINHwCMkSzS2vBBz+EJg=
X-Google-Smtp-Source: AA6agR6DWBel7BNkqlYQ6IP7PG16MwRMBieyn6jRfb2xEPwXDdBGIHWRzEZjfB1dX6gNTGhXmVaCXg==
X-Received: by 2002:a05:6a00:3106:b0:52d:53d4:ccc9 with SMTP id bi6-20020a056a00310600b0052d53d4ccc9mr3992405pfb.9.1659651777681;
        Thu, 04 Aug 2022 15:22:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001640aad2f71sm1471952plh.180.2022.08.04.15.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:22:56 -0700 (PDT)
Message-ID: <62ec46c0.170a0220.d5bcb.263f@mx.google.com>
Date:   Thu, 04 Aug 2022 15:22:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-8283-ga8bc7f656e322
Subject: next/pending-fixes baseline: 611 runs,
 22 regressions (v5.19-8283-ga8bc7f656e322)
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

next/pending-fixes baseline: 611 runs, 22 regressions (v5.19-8283-ga8bc7f65=
6e322)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-udoo           | arm   | lab-broonie     | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx6qp-sabresd       | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx6sx-sdb           | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig           | 1          =

imx7ulp-evk          | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

kontron-pitx-imx8m   | arm64 | lab-kontron     | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

odroid-xu3           | arm   | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =

odroid-xu3           | arm   | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =

qemu_mips-malta      | mips  | lab-collabora   | gcc-10   | malta_defconfig=
              | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-10   | defconfig+arm64=
-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-8283-ga8bc7f656e322/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-8283-ga8bc7f656e322
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a8bc7f656e322b2eb4342f861ec51050a0ee873c =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-udoo           | arm   | lab-broonie     | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0e828a9066eb72daf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec0e828a9066eb72daf=
05c
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6qp-sabresd       | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0e8f8a9066eb72daf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec0e8f8a9066eb72daf=
087
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0ebba980e0f52fdaf08d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec0ebba980e0f52fdaf=
08e
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0ea330599276c8daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec0ea330599276c8daf=
058
        new failure (last pass: v5.19-rc5-345-gd3298a6516a4) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1546dfcff3e22cdaf065

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1546dfcff3e22cdaf=
066
        failing since 16 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1a5b646ec5f916daf0bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1a5b646ec5f916daf=
0bc
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1ae7937c0617f9daf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1ae7937c0617f9daf=
075
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1e439166d348c7daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1e439166d348c7daf=
05d
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec2307f05c244ba0daf446

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec2307f05c244ba0daf=
447
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec28f785aa4d6681daf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec28f785aa4d6681daf=
059
        failing since 40 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx7ulp-evk          | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0eb7a980e0f52fdaf088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec0eb7a980e0f52fdaf=
089
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
kontron-pitx-imx8m   | arm64 | lab-kontron     | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec11bee3d17c96c6daf05c

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62e=
c11bee3d17c96c6daf06f
        new failure (last pass: v5.19-3879-ge7dffa5317766)

    2022-08-04T18:36:29.011663  /lava-150121/1/../bin/lava-test-case
    2022-08-04T18:36:29.012215  <8>[   22.851548] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-04T18:36:29.012429  /lava-150121/1/../bin/lava-test-case
    2022-08-04T18:36:29.012627  <8>[   22.871562] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-08-04T18:36:29.012798  /lava-150121/1/../bin/lava-test-case
    2022-08-04T18:36:29.012964  <8>[   22.892843] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-08-04T18:36:29.013130  /lava-150121/1/../bin/lava-test-case   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62ec10068e4cb36e64daf06b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ec10068e4cb36=
e64daf072
        new failure (last pass: v5.19-3879-ge7dffa5317766)
        2 lines

    2022-08-04T18:28:59.640350  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2022-08-04T18:28:59.641873  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   20.476860] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-08-04T18:28:59.642885  ) =

    2022-08-04T18:28:59.644155  + set <8>[   20.486232] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 2326892_1.5.2.4.1>
    2022-08-04T18:28:59.645162  +x   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/62ec10068e4cb36e=
64daf074
        new failure (last pass: v5.19-3879-ge7dffa5317766)
        1 lines

    2022-08-04T18:28:59.073958  / # =

    2022-08-04T18:28:59.190614  #
    2022-08-04T18:28:59.296170  export SHELL=3D/bin/sh
    2022-08-04T18:28:59.297969  =

    2022-08-04T18:28:59.298979  / # #
    2022-08-04T18:28:59.402296  / # export SHELL=3D/bin/sh. /lava-2326892/e=
nvironment
    2022-08-04T18:28:59.505695  /lava-2326892/bin/lava-test-runner /lava-23=
26892/0
    2022-08-04T18:28:59.510398  =

    2022-08-04T18:28:59.511380  / # . /lava-2326892/environment
    2022-08-04T18:28:59.513606  / # /lava-2326892/bin/lava-test-runner /lav=
a-2326892/0 =

    ... (9 line(s) more)  =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec10cebb283cc1fadaf079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec10cebb283cc1fadaf=
07a
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
odroid-xu3           | arm   | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec121dc00903854ddaf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-odr=
oid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-odr=
oid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec121dc00903854ddaf=
065
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
odroid-xu3           | arm   | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec180fd03b22a4e7daf059

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ec180fd03b22a=
4e7daf060
        new failure (last pass: v5.19-rc7-260-gaab2277715b66)
        1 lines

    2022-08-04T19:03:19.806806  kern  :emerg : Disabling IRQ #145
    2022-08-04T19:03:19.825859  <8>[   24.404578] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_mips-malta      | mips  | lab-collabora   | gcc-10   | malta_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec0cf5ffb29362d8daf08b

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ec0cf5ffb2936=
2d8daf093
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766)
        1 lines

    2022-08-04T18:16:12.471233  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 1f4def80, epc =3D=3D 8023f954, ra =3D=
=3D 8023f938
    2022-08-04T18:16:12.514873  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-10   | defconfig+arm64=
-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62ec0f425815a395c0daf057

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-8283-=
ga8bc7f656e322/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62ec0f425815a395c0daf079
        failing since 157 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-08-04T18:25:54.448851  /lava-6972200/1/../bin/lava-test-case
    2022-08-04T18:25:54.459805  <8>[   36.904413] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62ec0f425815a395c0daf09c
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T18:25:52.227327  /lava-6972200/1/../bin/lava-test-case
    2022-08-04T18:25:52.237841  <8>[   34.682320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62ec0f425815a395c0daf09d
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T18:25:51.183452  /lava-6972200/1/../bin/lava-test-case
    2022-08-04T18:25:51.194523  <8>[   33.638933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62ec0f425815a395c0daf09e
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T18:25:49.091726  <8>[   31.535682] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-08-04T18:25:50.138934  /lava-6972200/1/../bin/lava-test-case
    2022-08-04T18:25:50.149939  <8>[   32.593772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
