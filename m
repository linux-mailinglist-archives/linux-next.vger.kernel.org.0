Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC2F3670AE
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 18:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241875AbhDUQ4S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 12:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241630AbhDUQ4S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 12:56:18 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC004C06174A
        for <linux-next@vger.kernel.org>; Wed, 21 Apr 2021 09:55:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id b17so30459413pgh.7
        for <linux-next@vger.kernel.org>; Wed, 21 Apr 2021 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OjrSnkWu5aX7X58/wkvc3fkp7eagllnpfJ3NwO33HB8=;
        b=DSY0zG2/vah57LX9kqa4SIIyYvLAWNDJ131ZM3UOJe/uYBHfhFgRXg/ESrJWltRISx
         IxgggDgkNkHymvj1eLYT9iCuGgPopw9fvYbcghbK2j4jC9rWhAFtItYrmVA8aqDHw4+G
         0AqWeAIbF7qzVMUegjsida/zyfsecQe9pzmHzCFAuJvNnm5m3Yc8bHT9Y44ZJye8aiZw
         JArgzAiGqo0Yqpi8rer8oQBIWpmmJ49doQkmQyVUibVyowgRy4trPb1y1OKTer38m7CK
         5Ht5hK5YD7/MBctxfK/bG3HM8M97xcFJv3RQm7fZC2Sn7fgPBQbBEBgOxgXDjfAuK5m9
         gLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OjrSnkWu5aX7X58/wkvc3fkp7eagllnpfJ3NwO33HB8=;
        b=KrL/OsOsfP4WP57zA/+/em/kJQoIYPsQCajvc9Sig/QGeV76Avs8Yyx9E05fIK0fbH
         CutaHKw//pB+GQGQ4BKVVIPivmBqmTQO2Rsl+XeZxVMvmhj4gT3TaZkMXy8LSEvmBeC/
         XXE8GW4Hk1V7K4IQvTx1mjGn+Zx2KhBhbTx/oC/xcr5sUIvzh8/gGhqE9XK//h4KaVD/
         +RLDMIEvOhZfta9Qi0NS6T2adKhtjaJ3ESIOrBJ4n/jgAY7HOUA2SIfW2314IvudM9IE
         GiE4vG1U1pKubx7nRF55JvVUKBT8tDhE0dlPLaxA2nJA4bHr3xEPlkW8JyMnquo7+TNd
         2G9g==
X-Gm-Message-State: AOAM530uN6KIdVpj6/bzQZn9M+y6Jb+1TDlmWazA/JKq+k6bPu94J4yU
        KxySTiAra8HNnMm8KpFTPcECoalSkwn2mGdpuvI=
X-Google-Smtp-Source: ABdhPJydqBSopNv6wkE5QczijD7JfxvwA4NIbYn037OqVaefkD/uzyDJCv6Y9yvjiH4i5DNslUlnTw==
X-Received: by 2002:a63:6d04:: with SMTP id i4mr22344678pgc.97.1619024143805;
        Wed, 21 Apr 2021 09:55:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bj15sm2731395pjb.6.2021.04.21.09.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:55:43 -0700 (PDT)
Message-ID: <6080590f.1c69fb81.da64e.7b35@mx.google.com>
Date:   Wed, 21 Apr 2021 09:55:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210421
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 344 runs, 16 regressions (next-20210421)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 344 runs, 16 regressions (next-20210421)

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

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210421/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210421
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b74523885a715463203d4ccc3cf8c85952d3701a =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60801f1b743bf412469b77e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60801f1b743bf412469b7=
7e3
        failing since 23 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6080272c8c9f5403069b77a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6080272c8c9f5403069b7=
7a4
        failing since 55 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60801937150f282ee79b77b9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60801937150f282=
ee79b77bf
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-21 12:23:03.992000+00:00  kern  :alert : Mem [   21.705424] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-21 12:23:03.992000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60801937150f282=
ee79b77c0
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines

    2021-04-21 12:23:03.995000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-21 12:23:03.996000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-21 12:23:03.997000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-21 12:23:03.997000+00:00  kern  :alert : Data abort info:
    2021-04-21 12:23:03.998000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-21 12:23:04.034000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-21 12:23:04.035000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.744751] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-21 12:23:04.036000+00:00  00007382000   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60801a28ecf57fef7d9b77a9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60801a28ecf57fe=
f7d9b77af
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-21 12:27:03.713000+00:00  kern  :alert : Mem abort info:
    2021-04-21 12:27:03.714000+00:00  kern  :aler[   21.738374] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-21 12:27:03.714000+00:00  t :   ESR =3D 0x96000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60801a28ecf57fe=
f7d9b77b0
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines

    2021-04-21 12:27:03.717000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-21 12:27:03.718000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-21 12:27:03.718000+00:00  kern  :alert : Data abort info:
    2021-04-21 12:27:03.718000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-21 12:27:03.719000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-21 12:27:03.765000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002c92400
    2021-04-21 12:27:03.766000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d310003
    2021-04-21 12:27:03.767000+00:00  kern  :emerg : Internal error: Oops: =
96000[   21.785439] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60801adc7d40763ed39b77d1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60801adc7d40763=
ed39b77d7
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-21 12:30:02.775000+00:00  kern  :alert : Mem [   21.727954] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-21 12:30:02.775000+00:00  abort info:
    2021-04-21 12:30:02.776000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-21 12:30:02.776000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-21 12:30:02.777000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-21 12:30:02.777000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-21 12:30:02.778000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60801adc7d40763=
ed39b77d8
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-21 12:30:02.817000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-21 12:30:02.819000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.767311] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-21 12:30:02.820000+00:00  0003a8c1000
    2021-04-21 12:30:02.821000+00:00  kern  :aler[   21.778136] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 118635_1.5.2.4.1>
    2021-04-21 12:30:02.821000+00:00  t : [0000000000000050] pgd=3D08000000=
3a8bf003, p4d=3D080000003a8bf003, pud=3D080000003a8be003, pmd=3D00000000000=
00000
    2021-04-21 12:30:02.822000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60801973adaf3bcb189b77b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60801973adaf3bcb189b7=
7b2
        failing since 27 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60803f5e4a12ad4f1d9b77a6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60803f604a12ad4=
f1d9b77ac
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-21 15:05:48.207000+00:00  uest at virtual address fffffbfffe800=
0e4
    2021-04-21 15:05:48.207000+00:00  kern  :alert : Mem abort info:
    2021-04-21 15:05:48.208000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-21 15:05:48.208000+00:00  ker[   22.784336] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60803f614a12ad4=
f1d9b77ad
        failing since 1 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6080189622ec5d94db9b779a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6080189622ec5d94db9b7=
79b
        failing since 154 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608017994373d137f69b77c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608017994373d137f69b7=
7c3
        failing since 154 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608017435ce64d8d109b77bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608017435ce64d8d109b7=
7bd
        failing since 154 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6080173f5ce64d8d109b77b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6080173f5ce64d8d109b7=
7b1
        failing since 154 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60801b4c2af99903c99b779a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210421/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60801b4c2af99903c99b7=
79b
        failing since 69 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
