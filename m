Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDDE49599C
	for <lists+linux-next@lfdr.de>; Fri, 21 Jan 2022 06:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245079AbiAUFyl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jan 2022 00:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiAUFyk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2022 00:54:40 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711BDC061574
        for <linux-next@vger.kernel.org>; Thu, 20 Jan 2022 21:54:40 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n16-20020a17090a091000b001b46196d572so8190248pjn.5
        for <linux-next@vger.kernel.org>; Thu, 20 Jan 2022 21:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+hVkRwLDjsrV9sGCZI55hnNhvnAH0PiAnbgqdkggcwE=;
        b=Jzn8dqBECF4QCRXhsOuIJv7MTV8ZxaoAzNl3GCshVPQD8GViliw5NxIAJWa2BCIPuw
         mVWErdaDyb2Que+GkRu/KCHf8BTQ3j6zA59HJNHtmLxADFLCq0bg3trlBHEf29hF5MgP
         GlKy9Rh3PHZAyRESiC8H2LVZ3BirB+WHKrWeHeo24myoqrIMEiryZzvv61OixR3QWKhQ
         R1P20oRwzONLpiRkeFB2WtKrIpwZ2xDdKtrJBXJBo9F6Wyy0wZ0JGF1EBhz6tHGq3/Eo
         E4FxENIznLKKC+RzJ30GxjpCyEhC2LXDXzk288WltO0U2Md+TfxuyN2yD9ayTdRi49Jw
         fi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+hVkRwLDjsrV9sGCZI55hnNhvnAH0PiAnbgqdkggcwE=;
        b=4ls+Y3K2GtvCDv6zgRk0hxMjuxaOL4hIgri03UNX/nuSOQdyBEwMzTgrRQAwEc1+S7
         Xvz9k0iuUCSTQ1AuF6j765kuDMaoQTVdCAmhNpOFW6FgVflGEaYerBkLX3SoVe7dbMNP
         oERxjELNBYQ6/H9GeHcprOtMpM2C2ir7UdLpRP8hlA+EhobzmqldHYzVmQRrFTaVWNTm
         /4tvwaAwyBQYo6faZi6kqGxxiOgHHBY+QvYicOHobWuVa+fhXFjSMOu4lIzZYw2+LX81
         3xWMa6PAS5yl6BWFkTeZB/ZYy71a4APAFrR2syJE2BMlVBcgZwWTjc6EJhdiF4tWOhsU
         DBBw==
X-Gm-Message-State: AOAM532DJzz7zvhAstCrR7ZDWZFZ8x6mZaoGt6WmhqCCkj/uO6XuxfZr
        9QcDQaxxDgpP3F379xc+GrAahO1GDkT0qDEv
X-Google-Smtp-Source: ABdhPJy4qeNip6UIM42lctTcViJR/8zAVH5xFmCmTiYYgRnncpdGDly2DzNI0u0Mb4fDs9bTTpgWLg==
X-Received: by 2002:a17:902:bd93:b0:149:ba01:e67a with SMTP id q19-20020a170902bd9300b00149ba01e67amr2717090pls.156.1642744479573;
        Thu, 20 Jan 2022 21:54:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id my11sm857142pjb.35.2022.01.20.21.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 21:54:39 -0800 (PST)
Message-ID: <61ea4a9f.1c69fb81.c6d2.33a9@mx.google.com>
Date:   Thu, 20 Jan 2022 21:54:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-11577-gffd79fec234d
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 401 runs,
 18 regressions (v5.16-11577-gffd79fec234d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 401 runs, 18 regressions (v5.16-11577-gffd79fe=
c234d)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 2          =

rk3288-veyron-jaq      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-11577-gffd79fec234d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-11577-gffd79fec234d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ffd79fec234da2dcbfd582118ffe76bf2b32be70 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea17a9a6f5e9c9d0abbd29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea17a9a6f5e9c9d0abb=
d2a
        failing since 0 day (last pass: v5.16-7998-gbeebf0a29205, first fai=
l: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea150f1399c95ee8abbd89

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea150f1399c95=
ee8abbd90
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-21T02:05:36.403310  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   15.230394] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-21T02:05:36.403526  0000
    2022-01-21T02:05:36.403648  kern  :alert : Mem abort info:
    2022-01-21T02:05:36.403759  kern  :alert :   ESR =3D 0x96000006
    2022-01-21T02:05:36.403872  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T02:05:36.404017  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea150f1399c95=
ee8abbd91
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-21T02:05:36.404798  kern  :alert :   EA<8>[   15.257952] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-21T02:05:36.404913   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea14eb1399c95ee8abbd13

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea14eb1399c95ee8abbd54
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:05:10.344488  /lava-81147/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a14eb1399c95ee8abbd55
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:05:10.347625  <8>[   17.746905] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T02:05:11.396994  /lava-81147/1/../bin/lava-test-case
    2022-01-21T02:05:11.397327  <8>[   18.765597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T02:05:11.397521  /lava-81147/1/../bin/lava-test-case
    2022-01-21T02:05:11.397702  <8>[   18.782758] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-21T02:05:11.397883  /lava-81147/1/../bin/lava-test-case
    2022-01-21T02:05:11.398056  <8>[   18.799921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-21T02:05:11.398229  /lava-81147/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea184a761a90ed3aabbd14

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea184a761a90ed3aabbd55
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:19:27.600647  /lava-81150/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a184a761a90ed3aabbd56
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:19:27.602959  <8>[   17.579219] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T02:19:28.652702  /lava-81150/1/../bin/lava-test-case
    2022-01-21T02:19:28.653027  <8>[   18.598787] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T02:19:28.653249  /lava-81150/1/../bin/lava-test-case
    2022-01-21T02:19:28.653539  <8>[   18.614706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-21T02:19:28.653808  /lava-81150/1/../bin/lava-test-case
    2022-01-21T02:19:28.654095  <8>[   18.631916] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-21T02:19:28.654305  /lava-81150/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea14c404b095fbcdabbd82

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea14c504b095fbcdabbdca
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:04:45.892068  /lava-81146/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a14c504b095fbcdabbdcb
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:04:45.905848  <8>[   13.478353] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T02:04:46.946225  /lava-81146/1/../bin/lava-test-case
    2022-01-21T02:04:46.946587  <8>[   14.497770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T02:04:46.946806  /lava-81146/1/../bin/lava-test-case
    2022-01-21T02:04:46.947011  <8>[   14.513766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-21T02:04:46.947215  /lava-81146/1/../bin/lava-test-case
    2022-01-21T02:04:46.947374  <8>[   14.529961] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-21T02:04:46.947530  /lava-81146/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea18d34021bf8ee0abbd1d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea18d44021bf8ee0abbd65
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:21:53.407451  /lava-81151/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a18d44021bf8ee0abbd66
        failing since 9 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-21T02:21:53.410648  <8>[   13.522423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T02:21:54.458253  /lava-81151/1/../bin/lava-test-case
    2022-01-21T02:21:54.458608  <8>[   14.541157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea149bdabf42fdc5abbd40

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea149bdabf42f=
dc5abbd46
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-21T02:03:50.710461  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T02:03:50.710575  kern  :alert :   CM =3D 0, WnR =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea149bdabf42f=
dc5abbd47
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-21T02:03:50.667439  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T02:03:50.667549  kern  :alert : Mem abort info:
    2022-01-21T02:03:50.667638  ker<8>[   16.305092] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T02:03:50.667721  n  :alert :   ESR =3D 0x96000006
    2022-01-21T02:03:50.667833  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T02:03:50.667914  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T02:03:50.668000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T02:03:50.668080  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T02:03:50.668157  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea196ca44896b226abbd1d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea196ca44896b=
226abbd23
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-21T02:24:17.475091  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T02:24:17.475223  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T02:24:17.475314  kern  :alert : user pgtable: 4k pages<8>[  =
 15.729007] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T02:24:17.475463  , 48-bit VAs, pgdp=3D000000007f8cb000
    2022-01-21T02:24:17.475547  ker<8>[   15.741374] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606482_1.5.2.4.1>
    2022-01-21T02:24:17.475627  n  :alert : [0000000000000000] pgd=3D080000=
007f8cc003, p4d=3D080000007f8cc003, pud=3D080000007f8e0003, pmd=3D000000000=
0000000
    2022-01-21T02:24:17.475708  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea196ca44896b=
226abbd24
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-21T02:24:17.431972  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T02:24:17.432083  kern  :alert : Mem abort info:
    2022-01-21T02:24:17.432173  ker<8>[   15.688337] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T02:24:17.432258  n  :alert :   ESR =3D 0x96000006
    2022-01-21T02:24:17.432340  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T02:24:17.432434  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T02:24:17.432523  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T02:24:17.432599  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T02:24:17.432674  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea117f47246c7ddcabbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea117f47246c7ddcabb=
d17
        new failure (last pass: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea1502e52a2df430abbd2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea1502e52a2df430abb=
d2d
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea193a3175cf5669abbd31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11577=
-gffd79fec234d/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea193a3175cf5669abb=
d32
        failing since 8 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
