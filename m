Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3F555F575
	for <lists+linux-next@lfdr.de>; Wed, 29 Jun 2022 07:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiF2FDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jun 2022 01:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiF2FDM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jun 2022 01:03:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660BB5FFB
        for <linux-next@vger.kernel.org>; Tue, 28 Jun 2022 22:03:09 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n10so13061699plp.0
        for <linux-next@vger.kernel.org>; Tue, 28 Jun 2022 22:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=w7lPB7RlLeuC1JLs0wzWA3RPjgGG92KkWsnjxBVbQ0E=;
        b=YXwT77JsrpIJyGVXSvdte5zT1cveNa/WO01ANTZIC1bMxpyb26TBktUff1rUFsHan9
         lve74PV7Ni5enuIam1ED2dexd9bO1RVLHoZjoXrNHsUO1t0FzKKai7VcvcS0IlgHHGZY
         owLVYiNm7QZGNoU1myUmWRNt+UUkIrPdrULGPonTfiIcSAtYqiwcXWX9zB2MI+x6xaTd
         RJ8vK8UkG7/WhjeiyMC1ZtybZyd7jOnDZgY5uRWNxi8R7GlZ6CtFq5lVH899s4Pv1W22
         46Jch6OlvsGz8evCW/Wv4+4DiY5gHijIR4PNph5mkenV8FbSGMYBjuFCZtGZCrVKAxO4
         Srvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=w7lPB7RlLeuC1JLs0wzWA3RPjgGG92KkWsnjxBVbQ0E=;
        b=T94H8mGZyE/hNv73A94vH/Pd/VqVGunMJ7S7kpngh1e+e6FxT+buMpMYnQf41bpH5J
         gy7FrEVxMirvZHl0Zv22O1FuJbkGQilqxh9JA/MsmUxOZRfvc3x0cD28I/bLfi4Dojgn
         rKcDGAKzm7/ld90D1wIUj5+VLr4JYhHIRtO1z3PGmygJujVMWj3pGd0SUJyejDMuRKGm
         tRQO8VQ8AkyxxPG5Ncwo0Lj3WbhNOj5Fk6PSf7VZrkhqfSDzgdIQ4sAxObifNw/LNH55
         DmK26xfwI59y6Cf3gwROkSeFyDQpku/RiyTRz+KcyvccIfbHuxJAwPTtRkPsVxwnPB15
         2/sA==
X-Gm-Message-State: AJIora8bRVqwiksDXq0quJBOOJLQvUdI58tcXuRQUesopb+GPy2F9iSq
        IT+/UGeH2zorvs9azfByc4S5wREBrA1IY8ry
X-Google-Smtp-Source: AGRyM1s7IETK9oxKBgesuzesnmtDXZa5w/KAX7CQZ8Q56blvhi/nGDoWOyyi6b+xp1F5moxZ7Xd0Kg==
X-Received: by 2002:a17:90a:1d0:b0:1ec:7066:49b8 with SMTP id 16-20020a17090a01d000b001ec706649b8mr1803329pjd.163.1656478988426;
        Tue, 28 Jun 2022 22:03:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c126-20020a621c84000000b005252defb016sm10397229pfc.122.2022.06.28.22.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 22:03:07 -0700 (PDT)
Message-ID: <62bbdd0b.1c69fb81.826ae.eaeb@mx.google.com>
Date:   Tue, 28 Jun 2022 22:03:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc4-255-ge85c7a5a90ae
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 300 runs,
 20 regressions (v5.19-rc4-255-ge85c7a5a90ae)
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

next/pending-fixes baseline: 300 runs, 20 regressions (v5.19-rc4-255-ge85c7=
a5a90ae)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
da850-lcdk         | arm   | lab-baylibre    | gcc-10   | davinci_all_defco=
nfig        | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

odroid-xu3         | arm   | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+ima    =
            | 2          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+ima    =
            | 2          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc4-255-ge85c7a5a90ae/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc4-255-ge85c7a5a90ae
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e85c7a5a90ae0df72d68c4204fb5e2ab844fb26e =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
da850-lcdk         | arm   | lab-baylibre    | gcc-10   | davinci_all_defco=
nfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba2948d5b3908a0a39bef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba2948d5b390=
8a0a39bf3
        failing since 156 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-29T00:53:27.519394  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-29T00:53:27.520022  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-29T00:53:27.522654  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-29T00:53:27.565269  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba4304abd8c42e5a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bba4304abd8c42e5a39=
bfb
        failing since 29 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba78c265046ed94a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bba78c265046ed94a39=
be5
        failing since 29 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62bbae21afe49fe513a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bbae21afe49fe513a39=
bce
        failing since 36 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
odroid-xu3         | arm   | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba68b9adcb2dbf4a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bba68b9adcb2dbf4a39=
bce
        new failure (last pass: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62bba3c80505e1ee17a39c3d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bba3c80505e1e=
e17a39c40
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-29T00:58:41.332111  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-29T00:58:41.335657  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-29T00:58:41.344493  [   61.435608] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-29T00:58:41.344764  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba3c80505e1e=
e17a39c41
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T00:58:41.311695  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-29T00:58:41.312226  kern  :alert : Mem abort info:
    2022-06-29T00:58:41.312499  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-29T00:58:41.312813  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-29T00:58:41.313227  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-29T00:58:41.313399  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-29T00:58:41.313662  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-29T00:58:41.314077  kern  :alert : Data abort info:
    2022-06-29T00:58:41.314236  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T00:58:41.314605  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62bba814122ce5022ea39c62

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bba814122ce50=
22ea39c65
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-29T01:16:46.977636  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-29T01:16:46.981172  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-29T01:16:46.985831  [   69.227229] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-29T01:16:46.986120  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba814122ce50=
22ea39c66
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T01:16:46.956596  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-29T01:16:46.957123  kern  :alert : Mem abort info:
    2022-06-29T01:16:46.957398  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-29T01:16:46.957762  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-29T01:16:46.958692  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-29T01:16:46.958896  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-29T01:16:46.959101  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-29T01:16:46.959509  kern  :alert : Data abort info:
    2022-06-29T01:16:46.959737  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T01:16:46.959919  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62bba9b9fce15cf7cfa39bf6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bba9b9fce15cf=
7cfa39bf9
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-29T01:23:47.612387  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-29T01:23:47.615943  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-29T01:23:47.620362  [   71.304965] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-29T01:23:47.620643  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba9b9fce15cf=
7cfa39bfa
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T01:23:47.591809  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-29T01:23:47.592317  kern  :alert : Mem abort info:
    2022-06-29T01:23:47.592542  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-29T01:23:47.592845  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-29T01:23:47.593376  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-29T01:23:47.593600  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-29T01:23:47.594039  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-29T01:23:47.594304  kern  :alert : Data abort info:
    2022-06-29T01:23:47.594522  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T01:23:47.594959  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62bbaa96968274ef89a39bcd

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62bbaa96968274ef89a39bf3
        failing since 120 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-06-29T01:27:29.754670  <8>[   55.012707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-06-29T01:27:30.780128  /lava-6702603/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62bbaa96968274ef89a39c16
        failing since 29 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-29T01:27:28.603501  /lava-6702603/1/../bin/lava-test-case
    2022-06-29T01:27:28.615025  <8>[   53.873462] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62bbaa96968274ef89a39c17
        failing since 29 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-29T01:27:26.528736  <8>[   51.785647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-29T01:27:27.559941  /lava-6702603/1/../bin/lava-test-case
    2022-06-29T01:27:27.571948  <8>[   52.830375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62bbaa96968274ef89a39c18
        failing since 29 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-29T01:27:26.515376  /lava-6702603/1/../bin/lava-test-case   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba3d00505e1ee17a39c4b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba3d00505e1e=
e17a39c4f
        failing since 7 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T00:58:49.616631  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T00:58:49.617187  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-29T00:58:49.617535  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079b9b000
    2022-06-29T00:58:49.617860  kern  :alert : [0000000000000005] pgd=3D080=
0000079b9d003, p4d=3D0800000079b9d003, pud=3D0800000079b9e003, pmd=3D000000=
0000000000
    2022-06-29T00:58:49.618173  <8>[   57.650165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62bba81d700883bdd3a39c40

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62bba81d700883b=
dd3a39c43
        failing since 7 days (last pass: v5.19-rc1-331-g13bdc020d5006, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-29T01:16:56.080513  <8>[   61.421422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-29T01:16:56.080692  + set +x
    2022-06-29T01:16:56.080769  <8>[   61.423712] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6702618_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba81d700883b=
dd3a39c44
        failing since 7 days (last pass: v5.19-rc1-331-g13bdc020d5006, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T01:16:56.013191  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-29T01:16:56.013729  kern  :alert : Mem abort info:
    2022-06-29T01:16:56.014081  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-29T01:16:56.014411  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-29T01:16:56.014729  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-29T01:16:56.015038  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-29T01:16:56.015341  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-29T01:16:56.015641  kern  :alert : Data abort info:
    2022-06-29T01:16:56.015936  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T01:16:56.016235  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (5 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bba8458dfb7bdf16a39c0f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62bba8458dfb7bd=
f16a39c13
        failing since 7 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-29T01:17:51.163929  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-29T01:17:51.164471  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-29T01:17:51.164825  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079a0c000
    2022-06-29T01:17:51.165156  kern  :alert : [0000000000000005] pgd=3D080=
0000079a0b003, p4d=3D0800000079a0b003, pud=3D0800000079b66003, pmd=3D000000=
0000000000
    2022-06-29T01:17:51.165477  <8>[   62.429437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
tegra124-nyan-big  | arm   | lab-collabora   | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62bbccd92fdeff0db7a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
55-ge85c7a5a90ae/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bbccd92fdeff0db7a39=
bce
        failing since 27 days (last pass: v5.18-11819-gfcd5217077654, first=
 fail: v5.18-12139-gb5db4eaa8649) =

 =20
