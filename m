Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4D2355B89
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 20:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbhDFSjc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 14:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244913AbhDFSjS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 14:39:18 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420E6C06174A
        for <linux-next@vger.kernel.org>; Tue,  6 Apr 2021 11:39:10 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id y32so7824857pga.11
        for <linux-next@vger.kernel.org>; Tue, 06 Apr 2021 11:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hzR+ud9sGMyw19UniKCvu8NZu4p6Wu9J2QmhF0LEPFQ=;
        b=LJjbGshhBaA3ES/kZOuOlcF8kUn09Ganbcm4aexcIz8lwIyKRIJdM42Vxqwu1w+8Sj
         IYqYQ5Bn8BAsBjzsS42R98/l5Lap1Kc6uqBggTUEjplVGt1nfcvDDS0a4N7z4W6jemLd
         GcCQI4NcEA1pTueT4vy/ZVHUgRqqPhDa1LZ+7x68sU/rPUEwi6arXUzpKcFD99UiTUy5
         yHmfRSE4r27r5QQrveT36HDWjmblmLk0bjDPULSzDSQ/9J1iVozmnWiUytC6VXWHznpz
         OkaYDFt62WKM/ntG9m3ASrh609ykghaniV+NmzWaZnb/2wQFL6LMMfWnvo1upmYRK53G
         RPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hzR+ud9sGMyw19UniKCvu8NZu4p6Wu9J2QmhF0LEPFQ=;
        b=LRRpRm+CMDtab3tHbnNz09zbfNDOqZez9Js08tijsQW3sYTDJ+saor52myR888C9iF
         dwkiAeT8KAIFPbDv4Jpui05ofWTnb+IfJt+jhCW8sOqd40CxLpnv75PN5laHfCTPUBDb
         g8PleQBMV5Y1pAQbfQLIpqB1Sb95ivct5CpHFBnMrFumzC4aL6BiISL1m8gXlpAOB4yZ
         ewo6OqWWyOuNj8ETXfsTNIGoDGMeq4IYoLhTfdJmm7/ORgOHRqKbnKio8SbZusRCO0Xh
         xs6sVV/xNiRGQrffjB7VmyhIitO9PfMdG8+x7DO722fp5v1q2KAVGuxUc2PqIBLRwkoc
         XZUA==
X-Gm-Message-State: AOAM532NBiFqjB325Nnjlc9lWjpvtO5IAAn7+WaZnkmJSQkqpFvrGa4S
        /Urd/jKJ8WRdRTbwxrmwosPnrbsMkkeJ8w==
X-Google-Smtp-Source: ABdhPJxbxdiFlYuD29GjcR/6fjx6cQIO9t4HUmqS+GAdQa6KVhHeTPfV/+KENuTuVCqi9gdScrtF1A==
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id g12-20020a056a00078cb02901f5d5871701mr28944986pfu.59.1617734349085;
        Tue, 06 Apr 2021 11:39:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v14sm2963030pju.19.2021.04.06.11.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:39:08 -0700 (PDT)
Message-ID: <606caacc.1c69fb81.e1085.879b@mx.google.com>
Date:   Tue, 06 Apr 2021 11:39:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210406
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 570 runs, 33 regressions (next-20210406)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 570 runs, 33 regressions (next-20210406)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-11 | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2 | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-11 | defconfig      =
              | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210406/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210406
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9c54130cd25528028b2d38f6ada0c79e92210390 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/606c6ce8df3812f07cdac6ed

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c6ce8df3812f=
07cdac6f3
        new failure (last pass: next-20210323)
        11 lines

    2021-04-06 14:14:40.248000+00:00  kern  :alert : Mem [   21.336979] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-06 14:14:40.248000+00:00  abort info:
    2021-04-06 14:14:40.249000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-06 14:14:40.250000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-06 14:14:40.251000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c6ce8df3812f=
07cdac6f4
        new failure (last pass: next-20210323)
        2 lines

    2021-04-06 14:14:40.255000+00:00  kern  :alert : Data abort info:
    2021-04-06 14:14:40.256000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-06 14:14:40.300000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-06 14:14:40.301000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.375859] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-06 14:14:40.302000+00:00  dp=3D0000000007243000
    2021-04-06 14:14:40.303000+00:00  ker[   21.386528] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 69217_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606c742ee01ad3290bdac6d4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c742ee01ad32=
90bdac6da
        new failure (last pass: next-20210323)
        11 lines

    2021-04-06 14:45:44.024000+00:00  kern  :alert : Mem abort info:
    2021-04-06 14:45:44.026000+00:00  kern  :aler[   21.582405] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-06 14:45:44.026000+00:00  t :   ESR =3D 0x96000007
    2021-04-06 14:45:44.027000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-06 14:45:44.028000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-06 14:45:44.028000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-06 14:45:44.029000+00:00  kern  :alert : Data abort info:
    2021-04-06 14:45:44.030000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c742ee01ad32=
90bdac6db
        new failure (last pass: next-20210323)
        2 lines

    2021-04-06 14:45:44.066000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000003923000
    2021-04-06 14:45:44.067000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d850003, p4d=3D080000000d850003, pud=3D08000000[   21.629268] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-11 | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/606c7094cbf7fc7d17dac6cd

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c7094cbf7fc7=
d17dac6d3
        new failure (last pass: next-20210322)
        11 lines

    2021-04-06 14:30:22.216000+00:00  kern  :alert : Mem [   21.556198] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-06 14:30:22.217000+00:00  abort info:
    2021-04-06 14:30:22.218000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c7094cbf7fc7=
d17dac6d4
        new failure (last pass: next-20210322)
        2 lines

    2021-04-06 14:30:22.222000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-06 14:30:22.223000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-06 14:30:22.223000+00:00  kern  :alert : Data abort info:
    2021-04-06 14:30:22.224000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-06 14:30:22.258000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-06 14:30:22.259000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit[   21.594460] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-06 14:30:22.259000+00:00   VAs, pgdp=3D000000003a957[   21.6049=
76] <LAVA_SIGNAL_ENDRUN 0_dmesg 69364_1.5.2.4.1>
    2021-04-06 14:30:22.260000+00:00  000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606c778a1f9cd7fe61dac6ca

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c778a1f9cd7f=
e61dac6d0
        new failure (last pass: next-20210323)
        11 lines

    2021-04-06 15:00:03.635000+00:00  kern  :alert : Mem abort info:
    2021-04-06 15:00:03.636000+00:00  kern  :alert :   ES[   21.554640] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-06 15:00:03.637000+00:00  R =3D 0x96000007
    2021-04-06 15:00:03.638000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-06 15:00:03.638000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-06 15:00:03.639000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-06 15:00:03.639000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c778a1f9cd7f=
e61dac6d1
        new failure (last pass: next-20210323)
        2 lines

    2021-04-06 15:00:03.644000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-06 15:00:03.678000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002802800
    2021-04-06 15:00:03.679000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d410003, p4d=3D080000000d410003, pud=3D080000000d410003[   21.6=
01443] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D2>
    2021-04-06 15:00:03.680000+00:00  , pmd=3D080000000d[   21.611385] <LAV=
A_SIGNAL_ENDRUN 0_dmesg 69679_1.5.2.4.1>
    2021-04-06 15:00:03.681000+00:00  420003, pte=3D0000000000000000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/606c6fb84bb264e31adac705

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c6fb84bb264e=
31adac70b
        new failure (last pass: next-20210323)
        11 lines

    2021-04-06 14:26:43.723000+00:00  kern  :alert : Mem [   21.570634] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-06 14:26:43.724000+00:00  abort info:
    2021-04-06 14:26:43.725000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c6fb84bb264e=
31adac70c
        new failure (last pass: next-20210323)
        2 lines

    2021-04-06 14:26:43.729000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-06 14:26:43.729000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-06 14:26:43.730000+00:00  kern  :alert : Data abort info:
    2021-04-06 14:26:43.730000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-06 14:26:43.765000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-06 14:26:43.766000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.609974] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-06 14:26:43.767000+00:00  000073ce000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606c71352795089599dac6d6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606c71352795089=
599dac6dc
        new failure (last pass: next-20210323)
        11 lines

    2021-04-06 14:33:03.753000+00:00  kern  :alert : Mem [   21.569721] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-06 14:33:03.754000+00:00  abort info:
    2021-04-06 14:33:03.755000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-06 14:33:03.755000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-06 14:33:03.756000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606c71352795089=
599dac6dd
        new failure (last pass: next-20210323)
        2 lines

    2021-04-06 14:33:03.760000+00:00  kern  :alert : Data abort info:
    2021-04-06 14:33:03.761000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-06 14:33:03.805000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-06 14:33:03.806000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.608983] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-06 14:33:03.807000+00:00  0003a965000
    2021-04-06 14:33:03.808000+00:00  kern  :aler[   21.619807] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 69396_1.5.2.4.1>
    2021-04-06 14:33:03.809000+00:00  t : [0000000000000050] pgd=3D08000000=
3a966003   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/606c71498614bca561dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c71498614bca561dac=
6bb
        failing since 12 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606c6f5ddbb47fc6ccdac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c6f5ddbb47fc6ccdac=
6ca
        failing since 14 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c757d43faf23b51dac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c757d43faf23b51dac=
6c2
        failing since 18 days (last pass: next-20210317, first fail: next-2=
0210319) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c7a498928e768f0dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c7a498928e768f0dac=
6bd
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606c707591f594f4aedac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c707591f594f4aedac=
6bb
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606c742ad950dd6fe4dac6df

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/606c742ad950dd6fe4dac6f3
        new failure (last pass: next-20210323)

    2021-04-06 14:45:55.325000+00:00  <8>[   57.244694] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/606=
c742ad950dd6fe4dac6f9
        new failure (last pass: next-20210323)

    2021-04-06 14:45:56.429000+00:00  /lava-3475057/1/../bin/lava-test-case
    2021-04-06 14:45:56.438000+00:00  <8>[   58.358333] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/606c6faf4bb264e31adac6da

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/606c6faf4bb264e31adac6ee
        new failure (last pass: next-20210323)

    2021-04-06 14:26:49.642000+00:00  <8>[   57.296564] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/606=
c6faf4bb264e31adac6f4
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c713070d297cca6dac6be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c713070d297cca6dac=
6bf
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606c6eb0c3d2c30c34dac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c6eb0c3d2c30c34dac=
6cc
        failing since 139 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606c6ea9c3d2c30c34dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c6ea9c3d2c30c34dac=
6c0
        failing since 139 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606c6e56023da47c73dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c6e56023da47c73dac=
6b2
        failing since 139 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606c746fe4b28dccf5dac6ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c746fe4b28dccf5dac=
6ee
        failing since 139 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606c6e806a68a89855dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c6e806a68a89855dac=
6d6
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c79d668926bf91adac6be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c79d668926bf91adac=
6bf
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-11 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606c768edabb020f90dac6e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c768edabb020f90dac=
6e5
        new failure (last pass: next-20210322) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | clang-11 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c7d97f59010971fdac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c7d97f59010971fdac=
6b5
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c71292795089599dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c71292795089599dac=
6c3
        failing since 15 days (last pass: next-20210319, first fail: next-2=
0210322) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606c73d1826f5d9a2cdac6f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c73d1826f5d9a2cdac=
6f2
        new failure (last pass: next-20210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606c77e26ec72bda77dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210406/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c77e26ec72bda77dac=
6bd
        new failure (last pass: next-20210323) =

 =20
