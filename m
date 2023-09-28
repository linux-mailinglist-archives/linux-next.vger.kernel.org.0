Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7829A7B18A1
	for <lists+linux-next@lfdr.de>; Thu, 28 Sep 2023 12:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjI1Kx4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Sep 2023 06:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjI1Kx4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Sep 2023 06:53:56 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E285E12A
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 03:53:52 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso11517516b3a.0
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695898432; x=1696503232; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=36wjWoELOQ3ByVqs4wemmqynd6nPX22AazPp2g/MKr0=;
        b=tJqXAloiDh8Hmiy/VelLGcwbiY1+6bpIMZbsCNEzCyI3ti3w6JBJKTFQGdicqKg6OR
         /bNi0JM3pLYYPgT3im0x/1wFd6lMdFkp0uB/jYPG5E3T/xJIsp1jo+g+AMOCai1mDP8a
         fsC9k5+YA1j1j6trptUdOI3wKJj2yCe78HjYaghtUh9JxBzxR3MP/pfXq6DMzigikZIo
         isdKySTVFaZHnaTv4l6SOQVR43E9IbHB1T98XLdQL9//Ja4CT1cxjCHKo4GfNgmF046O
         FJa7JK44w22tJBpAZwnXfay+A1Ja1rKu/6m1F4leerrpAfugO1PbjpiVr14VE1BEbib+
         JXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898432; x=1696503232;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36wjWoELOQ3ByVqs4wemmqynd6nPX22AazPp2g/MKr0=;
        b=p9uRv5JnBradcg4tgIYFx7a4EYQvRKqFk9+IfqRuY/JkktaEWQMsrgeU0WK2Vtw7+O
         rEpHP8cSG9sMdfvuT/3V99CQUmQNrw8mbOlLi3EaE7dP+TFEspE2eq8qi5BIMgsqQzrI
         rKEkPuZ7JeaVerGXTWPGufhEpCbWSuGC9p1WN9+NtgHzghTYvlBG21i3SXy5koKGXtRr
         Zx5cNKKxG4hAaWNMXl7XEYUJXosxL8eU1p57+Oyd4AOVzNz+A2taLmQEya3U2nctfR8Y
         zABFpmhqjXwXscIz4J+bthJXXVsZv/PyXG7KU0qF6AZOzJKOjO1BT7X7dW71cruSPBbn
         JHVg==
X-Gm-Message-State: AOJu0Yw7pi7ni485n2zqIacXtaT6Tl7LopyFF/9icUWNFcaCW9p/Kez+
        TSqIYVvlYhtmK0ZtwoAY9sNH+ShBrZHBlbtuPHuqFA==
X-Google-Smtp-Source: AGHT+IHxFgVKt45pqShKQ9z3SWwClKLBRuqQhAr7Ru1EQWSrP9IXu9VzA2J9tulM/8R5KpXRrgZekw==
X-Received: by 2002:a05:6a00:24c8:b0:692:a727:1fdd with SMTP id d8-20020a056a0024c800b00692a7271fddmr968815pfv.4.1695898431673;
        Thu, 28 Sep 2023 03:53:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b00689f1ce7dacsm13232359pff.23.2023.09.28.03.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:53:50 -0700 (PDT)
Message-ID: <65155b3e.620a0220.b747a.5868@mx.google.com>
Date:   Thu, 28 Sep 2023 03:53:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230928
X-Kernelci-Report-Type: test
Subject: next/master baseline: 194 runs, 13 regressions (next-20230928)
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

next/master baseline: 194 runs, 13 regressions (next-20230928)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230928/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230928
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      719136e5c24768ebdf80b9daa53facebbdd377c3 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651527a7c276082b128a0a70

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651527a7c276082b128a0a85
        failing since 29 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-28T07:13:36.168391  + <8>[   10.651950] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633665_1.4.2.3.1>

    2023-09-28T07:13:36.168962  set +x

    2023-09-28T07:13:36.277084  / # #

    2023-09-28T07:13:36.379699  export SHELL=3D/bin/sh

    2023-09-28T07:13:36.380488  #

    2023-09-28T07:13:36.482320  / # export SHELL=3D/bin/sh. /lava-11633665/=
environment

    2023-09-28T07:13:36.483108  =


    2023-09-28T07:13:36.584899  / # . /lava-11633665/environment/lava-11633=
665/bin/lava-test-runner /lava-11633665/1

    2023-09-28T07:13:36.586174  =


    2023-09-28T07:13:36.591410  / # /lava-11633665/bin/lava-test-runner /la=
va-11633665/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651525afc77fff61b48a0a52

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651525afc77fff61b48a0a67
        failing since 29 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-28T07:05:24.834894  + <8>[   12.726765] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633723_1.4.2.3.1>

    2023-09-28T07:05:24.835433  set +x

    2023-09-28T07:05:24.942775  / # #

    2023-09-28T07:05:25.045174  export SHELL=3D/bin/sh

    2023-09-28T07:05:25.045900  #

    2023-09-28T07:05:25.147497  / # export SHELL=3D/bin/sh. /lava-11633723/=
environment

    2023-09-28T07:05:25.148223  =


    2023-09-28T07:05:25.249765  / # . /lava-11633723/environment/lava-11633=
723/bin/lava-test-runner /lava-11633723/1

    2023-09-28T07:05:25.250874  =


    2023-09-28T07:05:25.255291  / # /lava-11633723/bin/lava-test-runner /la=
va-11633723/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6515275fd9191e22dc8a0a42

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6515275fd9191e22dc8a0a57
        failing since 29 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-28T07:12:22.913882  + <8>[   10.696890] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633667_1.4.2.3.1>

    2023-09-28T07:12:22.914428  set +x

    2023-09-28T07:12:23.023807  / # #

    2023-09-28T07:12:23.124600  export SHELL=3D/bin/sh

    2023-09-28T07:12:23.125263  #

    2023-09-28T07:12:23.226638  / # export SHELL=3D/bin/sh. /lava-11633667/=
environment

    2023-09-28T07:12:23.227392  =


    2023-09-28T07:12:23.328773  / # . /lava-11633667/environment/lava-11633=
667/bin/lava-test-runner /lava-11633667/1

    2023-09-28T07:12:23.329797  =


    2023-09-28T07:12:23.334170  / # /lava-11633667/bin/lava-test-runner /la=
va-11633667/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65151bd426ee9cb97b8a0a80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151bd426ee9cb97b8a0a89
        failing since 43 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-28T06:23:02.200686  + set<8>[   27.612549] <LAVA_SIGNAL_ENDRUN =
0_dmesg 137226_1.5.2.4.1>
    2023-09-28T06:23:02.200983   +x
    2023-09-28T06:23:02.304563  / # #
    2023-09-28T06:23:03.463417  export SHELL=3D/bin/sh
    2023-09-28T06:23:03.468848  #
    2023-09-28T06:23:04.961220  / # export SHELL=3D/bin/sh. /lava-137226/en=
vironment
    2023-09-28T06:23:04.966851  =

    2023-09-28T06:23:07.679184  / # . /lava-137226/environment/lava-137226/=
bin/lava-test-runner /lava-137226/1
    2023-09-28T06:23:07.684841  =

    2023-09-28T06:23:07.687486  / # /lava-137226/bin/lava-test-runner /lava=
-137226/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65151c62e952b3b4548a0a54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151c62e952b3b4548a0a5d
        failing since 43 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-28T06:25:24.201084  + set<8>[   29.129546] <LAVA_SIGNAL_ENDRUN =
0_dmesg 137234_1.5.2.4.1>
    2023-09-28T06:25:24.201316   +x
    2023-09-28T06:25:24.308711  / # #
    2023-09-28T06:25:25.474463  export SHELL=3D/bin/sh
    2023-09-28T06:25:25.480573  #
    2023-09-28T06:25:26.979626  / # export SHELL=3D/bin/sh. /lava-137234/en=
vironment
    2023-09-28T06:25:26.985719  =

    2023-09-28T06:25:29.709039  / # . /lava-137234/environment/lava-137234/=
bin/lava-test-runner /lava-137234/1
    2023-09-28T06:25:29.715682  =

    2023-09-28T06:25:29.721504  / # /lava-137234/bin/lava-test-runner /lava=
-137234/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65151b3e9c52f19f888a0aea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65151b3e9c52f19f888a0=
aeb
        failing since 57 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6515256b9776d4d4988a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6515256b9776d4d4988a0=
a46
        failing since 246 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/651526ee56000b06628a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651526ee56000b06628a0=
a54
        failing since 232 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/651520c430185cbb588a0a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651520c430185cbb588a0=
a8e
        new failure (last pass: next-20230927) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/651526670a67b6f9778a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651526670a67b6f9778a0=
a65
        new failure (last pass: next-20230927) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6515256ba101194c608a0a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6515256ba101194c608a0=
a80
        failing since 232 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65152580b79c3f95288a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65152580b79c3f95288a0=
a5d
        failing since 232 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65152550a101194c608a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230928/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65152550a101194c608a0=
a5d
        failing since 112 days (last pass: next-20230605, first fail: next-=
20230608) =

 =20
