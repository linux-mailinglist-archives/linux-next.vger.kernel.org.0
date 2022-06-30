Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E3356106B
	for <lists+linux-next@lfdr.de>; Thu, 30 Jun 2022 06:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiF3E6f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jun 2022 00:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiF3E6e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jun 2022 00:58:34 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B964120BCD
        for <linux-next@vger.kernel.org>; Wed, 29 Jun 2022 21:58:32 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id w1-20020a17090a6b8100b001ef26ab992bso1646277pjj.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jun 2022 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xHWBRyNklxpivz0mxmMucKAS7ip0T8aQpIjvNJt8QDI=;
        b=Q5a+5FjhZzhCa6theUZFvaH1YWS9EfEARBkdXubRr9IStdkVAOa3vEXInZu/Iw7ia9
         OGEqOMC2NwQpcsLA2c1DL7mi8ZiGYsndWGiNOiqSLIgZJNxoM7wXtjHb9StGxSYhg9YE
         DSLyxHXQhP9hF/CrPw6hoH9oF7Oodr2ywkpihEZbsb+6KAnPSxmBzmyN2Tw8U6sMNpnM
         d0YHDoithhbmN2mQ9sBeie350K/4W0B+mDWP0iQn0j5Fn1/CvlPiln8SDu6K5GsPeYeM
         dgtgTeoLndjokiJLsGj52eUccjo+HgDP4P1RBS8Z9zHwYnzY7fmrQPSExv7ms2GH3rmc
         tjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xHWBRyNklxpivz0mxmMucKAS7ip0T8aQpIjvNJt8QDI=;
        b=wunX+JMVH3l8++WJKZ5l81e4N56ZGADVAYVeHBut2F00Zr5HkVpP1yWfMgguMrt7wO
         LGcpydwTlE/GOm0XMlEIHl61HuEscrdqXxx+UNJ/szKvhMMHASH5NICgoLCZh+++l4OI
         WQFmlE9DSJPn2qVe1X4aSuYw4LAmKnzQM6oLh5eM7ovC/o/BAZISYwtfaLDxrwaGc7YU
         e0OEjHtTEMBQCWJ+sAoaqZdLY4INxmnqOsS5BHuhjhMxJbx/0MDE+VXQQM0Gy0dvv11y
         wDjR2cELF7LXsxKj7kSSOQpntVPoSNdkdOZ8yxA2tqHEZdnZ/4NBlIU29NXNbQhVzWWL
         EYRg==
X-Gm-Message-State: AJIora+cz9nvCmyrX7g4fWOfQ0yXpvDvJEhdSpxoDEXYSpefvLD1kRBd
        tdH+El2W5s58+lI/NgrvOOVnt3f9X8V23Sd8VK4=
X-Google-Smtp-Source: AGRyM1t1xaNEdwFoO7O1GkYFC4gz2nprVKpjRDjpXLsOUizogdUPIUv3FlY+c+70RZdWNl4qjaaUzw==
X-Received: by 2002:a17:90b:3c4:b0:1ec:aa3f:8dc3 with SMTP id go4-20020a17090b03c400b001ecaa3f8dc3mr8002009pjb.130.1656565111900;
        Wed, 29 Jun 2022 21:58:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j4-20020a17090276c400b0016188a4005asm12283339plt.122.2022.06.29.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:58:30 -0700 (PDT)
Message-ID: <62bd2d76.1c69fb81.1c785.1b9d@mx.google.com>
Date:   Wed, 29 Jun 2022 21:58:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc4-310-gae0dd4695f93
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 287 runs,
 14 regressions (v5.19-rc4-310-gae0dd4695f93)
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

next/pending-fixes baseline: 287 runs, 14 regressions (v5.19-rc4-310-gae0dd=
4695f93)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g           | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | tegra_defconfig  =
            | 1          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+crypto =
            | 2          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+crypto =
            | 1          =

tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | multi_v7_defconfi=
g           | 1          =

tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc4-310-gae0dd4695f93/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc4-310-gae0dd4695f93
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae0dd4695f93685f200ad72402df42b583d4af52 =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf53e1123d79005a39bf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcf53e1123d79005a39=
bf2
        failing since 4 days (last pass: v5.19-rc3-373-gd317111b3b1ae, firs=
t fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcfa8e69ca4226eea39c0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcfa8e69ca4226eea39=
c0d
        failing since 30 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcfc822d49271208a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcfc822d49271208a39=
be2
        failing since 30 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf61cb50526926ea39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcf61cb50526926ea39=
bcf
        failing since 40 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf930251e63943aa39c46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcf930251e63943aa39=
c47
        new failure (last pass: v5.19-rc4-221-g426ccb4c911a) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf79a4fe93348fca39c01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcf79a4fe93348fca39=
c02
        new failure (last pass: v5.19-rc4-255-ge85c7a5a90ae) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62bcf7525f8541e9b8a39c01

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bcf7525f8541e=
9b8a39c04
        failing since 8 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-30T01:07:09.901936  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-30T01:07:09.905507  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-30T01:07:09.912027  [   71.213258] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-30T01:07:09.912314  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bcf7525f8541e=
9b8a39c05
        failing since 8 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-30T01:07:09.877911  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-30T01:07:09.878468  kern  :alert : Mem abort info:
    2022-06-30T01:07:09.878689  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-30T01:07:09.878978  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-30T01:07:09.879400  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-30T01:07:09.879627  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-30T01:07:09.879864  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-30T01:07:09.880288  kern  :alert : Data abort info:
    2022-06-30T01:07:09.880454  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-30T01:07:09.880829  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62bcfa5efb451155a1a39c53

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bcfa5efb45115=
5a1a39c56
        failing since 8 days (last pass: v5.18-rc7-251-g195d7f7a62c6, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-30T01:20:08.191987  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-30T01:20:08.195560  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-30T01:20:08.200006  [   69.225693] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-30T01:20:08.200297  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bcfa5efb45115=
5a1a39c57
        failing since 8 days (last pass: v5.18-rc7-251-g195d7f7a62c6, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-30T01:20:08.171246  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-30T01:20:08.171796  kern  :alert : Mem abort info:
    2022-06-30T01:20:08.172032  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-30T01:20:08.172314  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-30T01:20:08.172749  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-30T01:20:08.173000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-30T01:20:08.173243  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-30T01:20:08.173653  kern  :alert : Data abort info:
    2022-06-30T01:20:08.173854  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-30T01:20:08.174081  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf631f244fd72dba39c02

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bcf631f244fd7=
2dba39c06
        failing since 8 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-30T01:02:26.237368  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-30T01:02:26.237900  kern  :alert : Mem abort info:
    2022-06-30T01:02:26.238243  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-30T01:02:26.238565  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-30T01:02:26.238874  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-30T01:02:26.239206  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-30T01:02:26.239505  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-30T01:02:26.239795  kern  :alert : Data abort info:
    2022-06-30T01:02:26.240081  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-30T01:02:26.240366  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (5 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcf952cb1029971ca39bd1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bcf952cb10299=
71ca39bd5
        failing since 8 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-30T01:15:45.358488  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-30T01:15:45.359040  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-30T01:15:45.359393  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000093eb000
    2022-06-30T01:15:45.359719  kern  :alert : [0000000000000005] pgd=3D080=
00000012ff003, p4d=3D08000000012ff003, pud=3D08000000093f1003, pmd=3D000000=
0000000000
    2022-06-30T01:15:45.360040  <8>[   59.616874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-30T01:15:45.360382  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62bcfea0fd31db71fba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bcfea0fd31db71fba39=
bce
        failing since 37 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-155-gb82692513a38) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bd0359dd351f6984a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
10-gae0dd4695f93/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bd0359dd351f6984a39=
bdb
        failing since 28 days (last pass: v5.18-11819-gfcd5217077654, first=
 fail: v5.18-12139-gb5db4eaa8649) =

 =20
