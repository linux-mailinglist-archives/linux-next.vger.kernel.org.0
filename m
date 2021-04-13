Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311C035E46E
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 18:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346950AbhDMQ5R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 12:57:17 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:39911 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238598AbhDMQ5M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 12:57:12 -0400
Received: by mail-pf1-f169.google.com with SMTP id c17so11815916pfn.6
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L2KT8WGhIZiN7lUlJtRKJzdtFZKNPsuzMm/wRBRt69Y=;
        b=z1DzeDE9VPzHb1l5Puj2CH3ZsJ7QGvwOdfR2TCFvGBqaWmI3C9HanlRzhg+OAxyRWR
         neNeTDb6+mGSW+RFhGO1Q3mFIr2mKEyQEuJALyUK7Q0MqLE/VxuAYuCrFjqXKZ8Rfjga
         XjEZdEMTwJltosNPk9QB93Pvj2kf0YUgZk+6nrRGzdls5MUt9k5ZwzXy6KUBx+h/TvTR
         KsGsDuW5Ko1FfOcvckuhg/NK4mE/VLcJEsHrLixcQYktjBZ4Zt/bh3/aeyd81/1H0ReM
         Y39l+iEsgzGQcS+TzAXSF9CQrKu73j1HcJ9ikAyLN7/hMSNRDpOXgYDhclb0Bj/f5qeZ
         W+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L2KT8WGhIZiN7lUlJtRKJzdtFZKNPsuzMm/wRBRt69Y=;
        b=rImL1dZ7PALVh7S+tVaWmqyuGfwkWHSsqsk4y0HTbGeS+HPOUgYsfaOBAj2itqaTpx
         X06EC22eLvyfOx9imRC+sukxxTnYSs8vwF2fX9zzMIa/v8J5FVCoyICZy1dC5Kn8p9ti
         vk04yFO+SjOtpGjdc/Bq4C5ObT9OsZus1bjli3TD+aLwcokZBmtkrq/slhg3NsnidNv5
         tIopVmkPAuvr5fy8dBZn6rY9Jn6KADY5wDTlV5yYni/sQ12mRqNliZY1k415kCY9niTz
         cUKNPNOl8G3a6tdauAFoHh9Oqa90bhUE/a6oXp0UZyS0jgMuKQ+Hu3fPupoJ9C604xO+
         CykQ==
X-Gm-Message-State: AOAM532DDSw/Iv4LUQ2b+d6uWEWf3WjEs54HKjkvy2ZIx0Hk63w7lAk9
        P9etG/B8A4SpFN9aRD4okGvvwij45pdnZUQy
X-Google-Smtp-Source: ABdhPJyZENbb+02Mlv9eW2bESP10vf4VIw0sTwwVeStuS1gt4TAWx1fGFIjanMSw/McLzlpD5yhUzQ==
X-Received: by 2002:a62:f84a:0:b029:245:17e4:bde2 with SMTP id c10-20020a62f84a0000b029024517e4bde2mr24766706pfm.64.1618332952371;
        Tue, 13 Apr 2021 09:55:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x194sm14395031pfc.18.2021.04.13.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:55:52 -0700 (PDT)
Message-ID: <6075cd18.1c69fb81.bf84c.308c@mx.google.com>
Date:   Tue, 13 Apr 2021 09:55:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210413
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 636 runs, 25 regressions (next-20210413)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 636 runs, 25 regressions (next-20210413)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | bcm2835_defcon=
fig            | 1          =

bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | clang-10 | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210413/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210413
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dcf1b51d6b2ac5da234ae6883ed0e9422c339588 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6075ae36592cfc12c3dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075ae36592cfc12c3dac=
6b8
        failing since 15 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6075bf5b1cf737998edac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075bf5b1cf737998edac=
6b2
        failing since 47 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/6075960ad54872e846dac6cd

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6075960ad54872e=
846dac6d1
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-13 13:00:36.212000+00:00  kern  :alert : Mem [   21.493447] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-13 13:00:36.213000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6075960ad54872e=
846dac6d2
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-13 13:00:36.217000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-13 13:00:36.218000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-13 13:00:36.218000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-13 13:00:36.219000+00:00  kern  :alert : Data abort info:
    2021-04-13 13:00:36.220000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-13 13:00:36.264000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-13 13:00:36.265000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.532466] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-13 13:00:36.266000+00:00  dp=3D0000000000da0000
    2021-04-13 13:00:36.267000+00:00  ker[   21.543128] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 91847_1.5.2.4.1>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60759723f651edd483dac6b6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60759723f651edd=
483dac6ba
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-13 13:05:16.535000+00:00  kern  :alert : Mem abort info:
    2021-04-13 13:05:16.536000+00:00  kern  :aler[   21.642605] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-13 13:05:16.537000+00:00  t :   ESR =3D 0x96000007
    2021-04-13 13:05:16.537000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-13 13:05:16.538000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-13 13:05:16.538000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-13 13:05:16.539000+00:00  kern  :alert : Data abort info:
    2021-04-13 13:05:16.539000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60759723f651edd=
483dac6bb
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-13 13:05:16.578000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000bcf0e00
    2021-04-13 13:05:16.579000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d380003, p4d=3D080000000d380003, pud=3D080000000d380003[   21.6=
89382] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D2>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6075957e70f7b8a811dac6f4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6075957e70f7b8a=
811dac6f8
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-13 12:58:16.977000+00:00  kern  :alert : Mem abort info:
    2021-04-13 12:58:16.978000+00:00  kern  :alert :   ES[   21.619931] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-13 12:58:16.979000+00:00  R =3D 0x96000007
    2021-04-13 12:58:16.979000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-13 12:58:16.980000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-13 12:58:16.981000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-13 12:58:16.981000+00:00  kern  :alert : Data abort info:
    2021-04-13 12:58:16.982000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6075957e70f7b8a=
811dac6f9
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-13 12:58:17.027000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000003fe1000
    2021-04-13 12:58:17.029000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c560003
    2021-04-13 12:58:17.029000+00:00  kern  :emerg : Internal error: Oops: =
96000007 [#1][   21.667807] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESU=
LT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-13 12:58:17.030000+00:00   PREEMPT SMP   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6075937652ba0cdcfbdac6ed

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6075937652ba0cd=
cfbdac6f1
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-13 12:49:40.149000+00:00  kern  :alert : Mem [   21.581524] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-13 12:49:40.149000+00:00  abort info:
    2021-04-13 12:49:40.150000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-13 12:49:40.151000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-13 12:49:40.151000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6075937652ba0cd=
cfbdac6f2
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-13 12:49:40.155000+00:00  kern  :alert : Data abort info:
    2021-04-13 12:49:40.156000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-13 12:49:40.201000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-13 12:49:40.203000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.620758] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-13 12:49:40.203000+00:00  0003a8c3000   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/6075969641fa78f510dac6c6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6075969641fa78f=
510dac6ca
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-13 13:02:59.233000+00:00  kern  :alert : Mem [   21.557014] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-13 13:02:59.234000+00:00  abort info:
    2021-04-13 13:02:59.234000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6075969641fa78f=
510dac6cb
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-13 13:02:59.239000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-13 13:02:59.239000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-13 13:02:59.240000+00:00  kern  :alert : Data abort info:
    2021-04-13 13:02:59.241000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-13 13:02:59.274000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-13 13:02:59.276000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.596043] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-13 13:02:59.276000+00:00  dp=3D000000003a81d000
    2021-04-13 13:02:59.277000+00:00  ker[   21.606569] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 91868_1.5.2.4.1>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6075987795dd255685dac6e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075987795dd255685dac=
6e9
        new failure (last pass: next-20210412) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607591d15300be0e48dac6e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607591d15300be0e48dac=
6e6
        failing since 19 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6075909693830f2d52dac6c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075909693830f2d52dac=
6c8
        failing since 20 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6075b176837a7c1cf5dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075b176837a7c1cf5dac=
6b2
        failing since 0 day (last pass: next-20210409, first fail: next-202=
10412) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6075c3f3d33cc97054dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075c3f3d33cc97054dac=
6b3
        failing since 0 day (last pass: next-20210409, first fail: next-202=
10412) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6075a14304c47c0edadac6dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075a14304c47c0edadac=
6de
        failing since 0 day (last pass: next-20210409, first fail: next-202=
10412) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60759696e43657e20edac6f9

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60759696e43657e20edac711
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
59696e43657e20edac717
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-13 13:03:12.513000+00:00  /lava-3516800/1/../bin/lava-test-case=
   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/607595d5c2e1ff279fdac6d9

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/607595d5c2e1ff279fdac6f1
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
595d5c2e1ff279fdac6f7
        failing since 6 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-13 13:00:01.155000+00:00  /lava-3516741/1/../bin/lava-test-case
    2021-04-13 13:00:01.163000+00:00  <8>[   58.827991] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607599c0b5493be1dddac72a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607599c0b5493be1dddac=
72b
        failing since 61 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-11 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6075968be43657e20edac6f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075968be43657e20edac=
6f2
        failing since 61 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60759b295798b0aac8dac737

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210413/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60759b295798b0aac8dac=
738
        failing since 61 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
