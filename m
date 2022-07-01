Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B215562AF9
	for <lists+linux-next@lfdr.de>; Fri,  1 Jul 2022 07:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbiGAFni (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Jul 2022 01:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiGAFni (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Jul 2022 01:43:38 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18D357245
        for <linux-next@vger.kernel.org>; Thu, 30 Jun 2022 22:43:36 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id t21so1479676pfq.1
        for <linux-next@vger.kernel.org>; Thu, 30 Jun 2022 22:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kjxhWAn2s00JQKhKk5fypOMZPh0RFWDwYu2b1tzkUAw=;
        b=5dbNNgaYTLxUQWlv84DxlC19Y4tCqbL0//+PSSuy3/VMjVfGHA5UMLzIkv/LY3VUfQ
         9NQDfZJogVnw+S46KvonnaZUVKrptUCkp46V+c8HlcUG4L8sM9rAdNgOK5LgeY6kOISs
         60208L0uO5VoKIGpJB0+XaQvId0k+H1nR6X3qsOan6G3ZIhn8GAklNLhC5XLU9Czr3xl
         YmKfPVxCt8+UDSnDCKZ337fPd/DkkfZuZeLR2JHG3eU/FFP/HBXkEN6m1CWcCI/uk8sC
         V+bUeKwFUSJ0DZmGNwa5DlTLBWmDjHeT2wCdDzhHnSEfePlwkCkZUpTeH45uHN6NCQY4
         6b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kjxhWAn2s00JQKhKk5fypOMZPh0RFWDwYu2b1tzkUAw=;
        b=TVI4paSJQF1v9JGpqOCiB0p+lqG/QO17RrD2J6x5Xc9mX68cy4V52LcKsD6oWDs7SC
         +tz+cPWvuj3brrGXWxARZGjr7P5lt7z8RzQ7DphK0xgHE8dB+eTYgHeGKIB717gI+02P
         EiaYxpD4C4UxP11lP3wSkPJ0jNOS4kR8z3iVEMseR/tHR5JNTg84473yF1hRz9MS73xk
         gP3L/1YWr+HY2DQvJp94RX/bGUtiB/Rlg2jmLbHcTb8oGWUky0pCRpxa1kKISz4C8W6E
         C0kX1aUCtrm66oxfe9uTYk/LsDUGY5geyeCCf6Grt10mkuxXpCwKq5X/HyoKYDBEvUmh
         8QyA==
X-Gm-Message-State: AJIora8K13tXjD4OdUMJC6IJp4KIE8Sg4nL6Qfe8iYncB2i0luRmHo8c
        g0EEo5mwkQvo1a+1uFbUgr88uJ1uqmuzdbGL
X-Google-Smtp-Source: AGRyM1vcTB3dqEeZ9tuiMK+dbTko4mwhW8fjkRn52eS39CjDfZjDv1hhadQVtQbI2mty5PTMfBzJ9A==
X-Received: by 2002:a62:1444:0:b0:525:254d:14ce with SMTP id 65-20020a621444000000b00525254d14cemr18401371pfu.58.1656654216058;
        Thu, 30 Jun 2022 22:43:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b0016a091eb88esm14583186plh.126.2022.06.30.22.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 22:43:35 -0700 (PDT)
Message-ID: <62be8987.1c69fb81.a29a6.520d@mx.google.com>
Date:   Thu, 30 Jun 2022 22:43:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc4-362-g66af410b51f8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 246 runs,
 14 regressions (v5.19-rc4-362-g66af410b51f8)
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

next/pending-fixes baseline: 246 runs, 14 regressions (v5.19-rc4-362-g66af4=
10b51f8)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
da850-lcdk          | arm   | lab-baylibre    | gcc-10   | davinci_all_defc=
onfig        | 1          =

imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =

rk3328-rock64       | arm64 | lab-baylibre    | gcc-10   | defconfig+ima   =
             | 2          =

rk3399-gru-kevin    | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-=
chromebook   | 4          =

rk3399-rock-pi-4b   | arm64 | lab-collabora   | gcc-10   | defconfig+ima   =
             | 2          =

tegra124-nyan-big   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc4-362-g66af410b51f8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc4-362-g66af410b51f8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66af410b51f88c5b355bb33993c5d78642e046f9 =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
da850-lcdk          | arm   | lab-baylibre    | gcc-10   | davinci_all_defc=
onfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62be4edeebbf947aa3a39bee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62be4edeebbf947=
aa3a39bf2
        failing since 158 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-07-01T01:33:07.064422  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-07-01T01:33:07.064669  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-07-01T01:33:07.067628  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-07-01T01:33:07.107398  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit  | arm   | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62be66a52a7f914d3fa39c02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62be66a52a7f914d3fa39=
c03
        failing since 31 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62be5fe408ed694ad3a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62be5fe408ed694ad3a39=
bdc
        failing since 38 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
jetson-tk1          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62be6160c61f0327fca39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62be6160c61f0327fca39=
bcf
        failing since 62 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62be583be9cffbaac7a39c0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62be583be9cffbaac7a39=
c0f
        failing since 9 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
rk3328-rock64       | arm64 | lab-baylibre    | gcc-10   | defconfig+ima   =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/62be574a6ffae67418a39c0d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62be574a6ffae67=
418a39c10
        failing since 10 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-01T02:08:53.070348  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-01T02:08:53.073986  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-01T02:08:53.079240  [   71.198509] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-01T02:08:53.079424  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62be574a6ffae67=
418a39c11
        failing since 10 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-01T02:08:53.049266  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-01T02:08:53.049848  kern  :alert : Mem abort info:
    2022-07-01T02:08:53.050055  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-01T02:08:53.050290  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-01T02:08:53.050697  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-01T02:08:53.050848  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-01T02:08:53.051235  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-01T02:08:53.051650  kern  :alert : Data abort info:
    2022-07-01T02:08:53.051818  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-01T02:08:53.052174  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin    | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-=
chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62be5898cec123f327a39be4

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62be5898cec123f327a39c0a
        failing since 123 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-01T02:14:33.712699  <8>[   54.564890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-07-01T02:14:34.741304  /lava-6721524/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62be5898cec123f327a39c2d
        failing since 31 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-01T02:14:31.472052  <8>[   52.323039] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-07-01T02:14:32.505577  /lava-6721524/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62be5898cec123f327a39c2e
        failing since 31 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-01T02:14:31.460602  /lava-6721524/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62be5898cec123f327a39c2f
        failing since 31 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-01T02:14:29.453740  <4>[   50.304534] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-01T02:14:30.416639  /lava-6721524/1/../bin/lava-test-case
    2022-07-01T02:14:30.429423  <8>[   51.279968] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
rk3399-rock-pi-4b   | arm64 | lab-collabora   | gcc-10   | defconfig+ima   =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/62be5611ed834fb056a39bcf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62be5611ed834fb=
056a39bd2
        failing since 10 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-01T02:03:45.695163  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-01T02:03:45.695315  <8>[   57.888575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-01T02:03:45.695390  + set +x
    2022-07-01T02:03:45.695456  <8>[   57.890647] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6721487_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62be5611ed834fb=
056a39bd3
        failing since 10 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-01T02:03:45.654602  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-01T02:03:45.654711  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-01T02:03:45.654782  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000937a000
    2022-07-01T02:03:45.654848  kern  :alert : [0000000000000005] pgd=3D080=
0000009378003, p4d=3D0800000009378003, pud=3D0800000009351003, pmd=3D000000=
0000000000
    2022-07-01T02:03:45.654913  <8>[   57.867846] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-01T02:03:45.654976  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform            | arch  | lab             | compiler | defconfig       =
             | regressions
--------------------+-------+-----------------+----------+-----------------=
-------------+------------
tegra124-nyan-big   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62be7faa5a983837faa39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-3=
62-g66af410b51f8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62be7faa5a983837faa39=
bd0
        failing since 38 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-155-gb82692513a38) =

 =20
