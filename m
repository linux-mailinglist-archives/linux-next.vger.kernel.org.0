Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9737634CD
	for <lists+linux-next@lfdr.de>; Wed, 26 Jul 2023 13:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjGZLXv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Jul 2023 07:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjGZLXq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jul 2023 07:23:46 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACD82D45
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 04:23:37 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686b9920362so887879b3a.1
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690370616; x=1690975416;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mD4kf2BqaWmYf1TenGyzPvVtCl25a+lF6g8UZ/HKwGA=;
        b=ijAerSQ3Ogb2hrW1M0yVn/XTFL+NqLjOFfKjtowFWm+kpSgO2A7g+bTaxkYdzH0h1+
         uz9Es1rAOeR7yNUrGH8/QOo4BR/YbzyeXaYr0njAxm7eKg3ihdkGYF/m/h9pvxB3sOSK
         H6+2rWQ4rJlEY7H30uqh/R4Tfy5d0ClNp6UHVNONwlLRqsiTh71PFNChkiEH2rHUPhPO
         9E+wvtncd4Vjb7YUwTYbsy4D3g+tAzoOw8BOkZmwacb0VJ+LDdhS5ratSc+3DhCaMi8D
         j8GPJmc7yzuR7poaKlBD6H9jt/D+JGq+z2qNz64qxzjxOKW2zfN7OsDMFhJAIzi/dGBa
         rECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690370616; x=1690975416;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD4kf2BqaWmYf1TenGyzPvVtCl25a+lF6g8UZ/HKwGA=;
        b=iqqL+ib4oOkT63H6x8IZfEpEyaNEIo48ry19zy8Q20gpn72FCwDpTH56sm0sTZTehu
         QIQ+hKjJ4Ke44YU8b0BHJeGCoNocPFEiyAfbSVVZW7ApjnULpwbchOF0d6BFal/OhpoB
         HWgPrYq9DqnX2j1A3AbGk+KoFukiLLbRzpeJSM+K+T/E6xTOmWgqAGL+LmZ3DdkBkLaK
         PdB/uZj9ksU5a3YyGaMLQULA/HbDJy6pTlkyfc3Y05tcQZ60rK/n+2oPlcm88FV9GAva
         /cIGp3rXj3mNYxuIGRdStgvFmG7xwg3W7WFZPdfbGQjB1qdxMRwnEzkq26bCfGypWxU1
         bLGw==
X-Gm-Message-State: ABy/qLaoOGtIthwNItV1xgV9q0pxlbnKYqCe8mQq8wN9CxUpOlAn6Z5y
        LkRHAt0tC6BFYM5XjatKuoEz2+QN+ZskflSfZOBQ5A==
X-Google-Smtp-Source: APBJJlFjYB4MNTzimvKSPvPG8NH932sCyM6XsoqvawkSWObSbbP400PhqtD6WUlXw/WchsrThhGOrw==
X-Received: by 2002:a05:6a20:3d8b:b0:10c:7c72:bdf9 with SMTP id s11-20020a056a203d8b00b0010c7c72bdf9mr1553794pzi.29.1690370615333;
        Wed, 26 Jul 2023 04:23:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a5-20020a62bd05000000b006826df9e295sm11225647pff.113.2023.07.26.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 04:23:34 -0700 (PDT)
Message-ID: <64c10236.620a0220.d65bd.455f@mx.google.com>
Date:   Wed, 26 Jul 2023 04:23:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230726
X-Kernelci-Report-Type: test
Subject: next/master baseline: 473 runs, 32 regressions (next-20230726)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 32 regressions (next-20230726)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230726/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230726
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0ba5d07205771c50789fd9063950aa75e7f1183f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c9db6d4baf715b8ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0c9db6d4baf715b8ac=
e29
        failing since 4 days (last pass: next-20230718, first fail: next-20=
230721) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cb141c4278f6098ace2d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cb141c4278f6098ace32
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-26T07:28:15.818898  + set +x

    2023-07-26T07:28:15.825696  <8>[   10.513284] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11144316_1.4.2.3.1>

    2023-07-26T07:28:15.933805  / # #

    2023-07-26T07:28:16.034687  export SHELL=3D/bin/sh

    2023-07-26T07:28:16.035429  #

    2023-07-26T07:28:16.136772  / # export SHELL=3D/bin/sh. /lava-11144316/=
environment

    2023-07-26T07:28:16.137463  =


    2023-07-26T07:28:16.238871  / # . /lava-11144316/environment/lava-11144=
316/bin/lava-test-runner /lava-11144316/1

    2023-07-26T07:28:16.240066  =


    2023-07-26T07:28:16.246028  / # /lava-11144316/bin/lava-test-runner /la=
va-11144316/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cb201c4278f6098ace47

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cb201c4278f6098ace4c
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-26T07:28:09.112068  <8>[    7.854639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11144312_1.4.2.3.1>

    2023-07-26T07:28:09.115488  + set +x

    2023-07-26T07:28:09.216812  =


    2023-07-26T07:28:09.317377  / # #export SHELL=3D/bin/sh

    2023-07-26T07:28:09.317541  =


    2023-07-26T07:28:09.418072  / # export SHELL=3D/bin/sh. /lava-11144312/=
environment

    2023-07-26T07:28:09.418231  =


    2023-07-26T07:28:09.518746  / # . /lava-11144312/environment/lava-11144=
312/bin/lava-test-runner /lava-11144312/1

    2023-07-26T07:28:09.519013  =


    2023-07-26T07:28:09.523787  / # /lava-11144312/bin/lava-test-runner /la=
va-11144312/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c41f723634c9968ace68

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c41f723634c9968ace6b
        failing since 12 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-26T06:58:28.889912  + [   17.563725] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238518_1.5.2.4.1>
    2023-07-26T06:58:28.890209  set +x
    2023-07-26T06:58:28.996081  =

    2023-07-26T06:58:29.097335  / # #export SHELL=3D/bin/sh
    2023-07-26T06:58:29.097775  =

    2023-07-26T06:58:29.198742  / # export SHELL=3D/bin/sh. /lava-1238518/e=
nvironment
    2023-07-26T06:58:29.199284  =

    2023-07-26T06:58:29.300197  / # . /lava-1238518/environment/lava-123851=
8/bin/lava-test-runner /lava-1238518/1
    2023-07-26T06:58:29.300912  =

    2023-07-26T06:58:29.304757  / # /lava-1238518/bin/lava-test-runner /lav=
a-1238518/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c42f518ebd96628ace7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c42f518ebd96628ace7d
        failing since 12 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-26T06:58:31.622046  [   16.207780] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1238513_1.5.2.4.1>
    2023-07-26T06:58:31.727204  =

    2023-07-26T06:58:31.828458  / # #export SHELL=3D/bin/sh
    2023-07-26T06:58:31.828875  =

    2023-07-26T06:58:31.929809  / # export SHELL=3D/bin/sh. /lava-1238513/e=
nvironment
    2023-07-26T06:58:31.930275  =

    2023-07-26T06:58:32.031246  / # . /lava-1238513/environment/lava-123851=
3/bin/lava-test-runner /lava-1238513/1
    2023-07-26T06:58:32.031968  =

    2023-07-26T06:58:32.035925  / # /lava-1238513/bin/lava-test-runner /lav=
a-1238513/1
    2023-07-26T06:58:32.058792  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c68798a2a910df8ace67

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c68798a2a910df8ace6a
        failing since 12 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-26T07:08:32.157268  [   13.352326] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1238525_1.5.2.4.1>
    2023-07-26T07:08:32.262659  =

    2023-07-26T07:08:32.363829  / # #export SHELL=3D/bin/sh
    2023-07-26T07:08:32.364266  =

    2023-07-26T07:08:32.465215  / # export SHELL=3D/bin/sh. /lava-1238525/e=
nvironment
    2023-07-26T07:08:32.465763  =

    2023-07-26T07:08:32.566856  / # . /lava-1238525/environment/lava-123852=
5/bin/lava-test-runner /lava-1238525/1
    2023-07-26T07:08:32.567766  =

    2023-07-26T07:08:32.571953  / # /lava-1238525/bin/lava-test-runner /lav=
a-1238525/1
    2023-07-26T07:08:32.590900  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cb23f1e179a68a8ace7c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cb23f1e179a68a8ace81
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-26T07:28:21.800267  + set +x

    2023-07-26T07:28:21.806708  <8>[   10.358466] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11144329_1.4.2.3.1>

    2023-07-26T07:28:21.911011  / # #

    2023-07-26T07:28:22.011650  export SHELL=3D/bin/sh

    2023-07-26T07:28:22.011834  #

    2023-07-26T07:28:22.112331  / # export SHELL=3D/bin/sh. /lava-11144329/=
environment

    2023-07-26T07:28:22.112521  =


    2023-07-26T07:28:22.213017  / # . /lava-11144329/environment/lava-11144=
329/bin/lava-test-runner /lava-11144329/1

    2023-07-26T07:28:22.213278  =


    2023-07-26T07:28:22.217811  / # /lava-11144329/bin/lava-test-runner /la=
va-11144329/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cb15f1e179a68a8ace60

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cb15f1e179a68a8ace65
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-26T07:27:48.212795  <8>[   10.589309] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11144289_1.4.2.3.1>

    2023-07-26T07:27:48.215922  + set +x

    2023-07-26T07:27:48.321747  =


    2023-07-26T07:27:48.423507  / # #export SHELL=3D/bin/sh

    2023-07-26T07:27:48.424184  =


    2023-07-26T07:27:48.525597  / # export SHELL=3D/bin/sh. /lava-11144289/=
environment

    2023-07-26T07:27:48.526366  =


    2023-07-26T07:27:48.627860  / # . /lava-11144289/environment/lava-11144=
289/bin/lava-test-runner /lava-11144289/1

    2023-07-26T07:27:48.629023  =


    2023-07-26T07:27:48.634042  / # /lava-11144289/bin/lava-test-runner /la=
va-11144289/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c51c234b744d5b8ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-k3-j721e=
-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-k3-j721e=
-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0c51d234b744d5b8ac=
e24
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c497e20d9841378ace34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0c497e20d9841378ac=
e35
        failing since 97 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c5eb34088a36288ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0c5eb34088a36288ac=
e23
        failing since 97 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0d2fa7c5e9b53118ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0d2fa7c5e9b53118ac=
e1d
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cb32c5a12887ee8ace1c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cb32c5a12887ee8ace21
        failing since 33 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-26T07:28:27.903208  + set<8>[   11.944370] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11144300_1.4.2.3.1>

    2023-07-26T07:28:27.903736   +x

    2023-07-26T07:28:28.011449  / # #

    2023-07-26T07:28:28.113727  export SHELL=3D/bin/sh

    2023-07-26T07:28:28.114419  #

    2023-07-26T07:28:28.215775  / # export SHELL=3D/bin/sh. /lava-11144300/=
environment

    2023-07-26T07:28:28.216476  =


    2023-07-26T07:28:28.317775  / # . /lava-11144300/environment/lava-11144=
300/bin/lava-test-runner /lava-11144300/1

    2023-07-26T07:28:28.319048  =


    2023-07-26T07:28:28.323682  / # /lava-11144300/bin/lava-test-runner /la=
va-11144300/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0d24117ed1705a38ace9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0d24117ed1705a38ac=
ea0
        new failure (last pass: next-20230721) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c5906d5a6c5f3c8ace39

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c5906d5a6c5f3c8ace3c
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T07:04:33.884755  / # #
    2023-07-26T07:04:35.345893  export SHELL=3D/bin/sh
    2023-07-26T07:04:35.366355  #
    2023-07-26T07:04:35.366478  / # export SHELL=3D/bin/sh
    2023-07-26T07:04:37.249191  / # . /lava-989307/environment
    2023-07-26T07:04:40.700921  /lava-989307/bin/lava-test-runner /lava-989=
307/1
    2023-07-26T07:04:40.721576  . /lava-989307/environment
    2023-07-26T07:04:40.721705  / # /lava-989307/bin/lava-test-runner /lava=
-989307/1
    2023-07-26T07:04:40.764820  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:04:40.818636  + cd /lava-989307/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0ca05241eed2b3d8ace27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0ca05241eed2b3d8ace2a
        new failure (last pass: next-20230713)

    2023-07-26T07:23:08.932076  / # #
    2023-07-26T07:23:10.394621  export SHELL=3D/bin/sh
    2023-07-26T07:23:10.415301  #
    2023-07-26T07:23:10.415507  / # export SHELL=3D/bin/sh
    2023-07-26T07:23:12.301174  / # . /lava-989322/environment
    2023-07-26T07:23:15.757788  /lava-989322/bin/lava-test-runner /lava-989=
322/1
    2023-07-26T07:23:15.778570  . /lava-989322/environment
    2023-07-26T07:23:15.778678  / # /lava-989322/bin/lava-test-runner /lava=
-989322/1
    2023-07-26T07:23:15.862895  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:23:15.863111  + cd /lava-989322/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c3ff744cf8e7678ace93

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c3ff744cf8e7678ace96
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T06:57:41.073036  / # #
    2023-07-26T06:57:42.536126  export SHELL=3D/bin/sh
    2023-07-26T06:57:42.556784  #
    2023-07-26T06:57:42.556989  / # export SHELL=3D/bin/sh
    2023-07-26T06:57:44.443076  / # . /lava-989296/environment
    2023-07-26T06:57:47.901806  /lava-989296/bin/lava-test-runner /lava-989=
296/1
    2023-07-26T06:57:47.922613  . /lava-989296/environment
    2023-07-26T06:57:47.922723  / # /lava-989296/bin/lava-test-runner /lava=
-989296/1
    2023-07-26T06:57:47.967010  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T06:57:48.004144  + cd /lava-989296/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c4b59e9d16f0d28acee8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c4b59e9d16f0d28aceeb
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-26T07:00:53.768390  / # #
    2023-07-26T07:00:55.231451  export SHELL=3D/bin/sh
    2023-07-26T07:00:55.252029  #
    2023-07-26T07:00:55.252237  / # export SHELL=3D/bin/sh
    2023-07-26T07:00:57.138477  / # . /lava-989300/environment
    2023-07-26T07:01:00.596715  /lava-989300/bin/lava-test-runner /lava-989=
300/1
    2023-07-26T07:01:00.617503  . /lava-989300/environment
    2023-07-26T07:01:00.617614  / # /lava-989300/bin/lava-test-runner /lava=
-989300/1
    2023-07-26T07:01:00.662042  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:01:00.698898  + cd /lava-989300/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c6432b2a9d19748aceed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c6432b2a9d19748acef0
        failing since 6 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-26T07:07:34.713415  / # #
    2023-07-26T07:07:36.176309  export SHELL=3D/bin/sh
    2023-07-26T07:07:36.196954  #
    2023-07-26T07:07:36.197195  / # export SHELL=3D/bin/sh
    2023-07-26T07:07:38.082507  / # . /lava-989311/environment
    2023-07-26T07:07:41.540182  /lava-989311/bin/lava-test-runner /lava-989=
311/1
    2023-07-26T07:07:41.561039  . /lava-989311/environment
    2023-07-26T07:07:41.561146  / # /lava-989311/bin/lava-test-runner /lava=
-989311/1
    2023-07-26T07:07:41.652365  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:07:41.652581  + cd /lava-989311/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0cd107f773eb1528ace42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0cd107f773eb1528ace45
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-26T07:36:33.088322  / # #
    2023-07-26T07:36:34.550817  export SHELL=3D/bin/sh
    2023-07-26T07:36:34.571391  #
    2023-07-26T07:36:34.571597  / # export SHELL=3D/bin/sh
    2023-07-26T07:36:36.457044  / # . /lava-989333/environment
    2023-07-26T07:36:39.916046  /lava-989333/bin/lava-test-runner /lava-989=
333/1
    2023-07-26T07:36:39.936849  . /lava-989333/environment
    2023-07-26T07:36:39.936959  / # /lava-989333/bin/lava-test-runner /lava=
-989333/1
    2023-07-26T07:36:40.029809  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:36:40.030023  + cd /lava-989333/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0d2385c07c1eee78acef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0d2385c07c1eee78acef9
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-26T07:58:31.388487  / # #
    2023-07-26T07:58:32.848023  export SHELL=3D/bin/sh
    2023-07-26T07:58:32.868522  #
    2023-07-26T07:58:32.868685  / # export SHELL=3D/bin/sh
    2023-07-26T07:58:34.750917  / # . /lava-989352/environment
    2023-07-26T07:58:38.203266  /lava-989352/bin/lava-test-runner /lava-989=
352/1
    2023-07-26T07:58:38.223886  . /lava-989352/environment
    2023-07-26T07:58:38.223994  / # /lava-989352/bin/lava-test-runner /lava=
-989352/1
    2023-07-26T07:58:38.306513  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-26T07:58:38.306662  + cd /lava-989352/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c4d985ef91be148ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c4d985ef91be148ace21
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T07:01:48.290075  / # #

    2023-07-26T07:01:49.369616  export SHELL=3D/bin/sh

    2023-07-26T07:01:49.371581  #

    2023-07-26T07:01:50.862320  / # export SHELL=3D/bin/sh. /lava-11143989/=
environment

    2023-07-26T07:01:50.864230  =


    2023-07-26T07:01:53.579176  / # . /lava-11143989/environment/lava-11143=
989/bin/lava-test-runner /lava-11143989/1

    2023-07-26T07:01:53.580571  =


    2023-07-26T07:01:53.583217  / # /lava-11143989/bin/lava-test-runner /la=
va-11143989/1

    2023-07-26T07:01:53.647795  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:01:53.647870  + cd /lav<8>[   29.492892] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11143989_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c9dc8f608fded38ace43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c9dc8f608fded38ace48
        new failure (last pass: next-20230713)

    2023-07-26T07:22:45.932917  / # #

    2023-07-26T07:22:47.006821  export SHELL=3D/bin/sh

    2023-07-26T07:22:47.008091  #

    2023-07-26T07:22:48.491639  / # export SHELL=3D/bin/sh. /lava-11144198/=
environment

    2023-07-26T07:22:48.492862  =


    2023-07-26T07:22:51.207930  / # . /lava-11144198/environment/lava-11144=
198/bin/lava-test-runner /lava-11144198/1

    2023-07-26T07:22:51.210377  =


    2023-07-26T07:22:51.215437  / # /lava-11144198/bin/lava-test-runner /la=
va-11144198/1

    2023-07-26T07:22:51.280020  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:22:51.280534  + cd /lava-111441<8>[   28.493028] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11144198_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c39b0e14098b538ace44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c39b0e14098b538ace49
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T06:56:24.211668  / # #

    2023-07-26T06:56:25.286777  export SHELL=3D/bin/sh

    2023-07-26T06:56:25.288651  #

    2023-07-26T06:56:26.774355  / # export SHELL=3D/bin/sh. /lava-11143928/=
environment

    2023-07-26T06:56:26.776096  =


    2023-07-26T06:56:29.488781  / # . /lava-11143928/environment/lava-11143=
928/bin/lava-test-runner /lava-11143928/1

    2023-07-26T06:56:29.490162  =


    2023-07-26T06:56:29.492925  / # /lava-11143928/bin/lava-test-runner /la=
va-11143928/1

    2023-07-26T06:56:29.559929  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T06:56:29.560007  + cd /lava-111439<8>[   28.440749] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11143928_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c3d5c111f7c04e8ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c3d5c111f7c04e8ace23
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-26T06:57:17.415062  / # #

    2023-07-26T06:57:18.494989  export SHELL=3D/bin/sh

    2023-07-26T06:57:18.496774  #

    2023-07-26T06:57:19.986407  / # export SHELL=3D/bin/sh. /lava-11143946/=
environment

    2023-07-26T06:57:19.988236  =


    2023-07-26T06:57:22.707106  / # . /lava-11143946/environment/lava-11143=
946/bin/lava-test-runner /lava-11143946/1

    2023-07-26T06:57:22.708476  =


    2023-07-26T06:57:22.708718  / # /lava-11143946/bin/lava-test-runner /la=
va-11143946/1

    2023-07-26T06:57:22.778150  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T06:57:22.778230  + cd /lava-111439<8>[   28.505348] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11143946_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c62f68338307038ace42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c62f68338307038ace47
        failing since 6 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-26T07:07:17.614307  / # #

    2023-07-26T07:07:18.693477  export SHELL=3D/bin/sh

    2023-07-26T07:07:18.695237  #

    2023-07-26T07:07:20.184379  / # export SHELL=3D/bin/sh. /lava-11144061/=
environment

    2023-07-26T07:07:20.186302  =


    2023-07-26T07:07:22.908691  / # . /lava-11144061/environment/lava-11144=
061/bin/lava-test-runner /lava-11144061/1

    2023-07-26T07:07:22.911209  =


    2023-07-26T07:07:22.921556  / # /lava-11144061/bin/lava-test-runner /la=
va-11144061/1

    2023-07-26T07:07:22.962944  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:07:22.980658  + cd /lav<8>[   29.535542] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11144061_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0d22617ed1705a38ace8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0d22617ed1705a38ace92
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-26T07:58:09.250882  / # #

    2023-07-26T07:58:10.330527  export SHELL=3D/bin/sh

    2023-07-26T07:58:10.332370  #

    2023-07-26T07:58:11.822530  / # export SHELL=3D/bin/sh. /lava-11144662/=
environment

    2023-07-26T07:58:11.824460  =


    2023-07-26T07:58:14.547612  / # . /lava-11144662/environment/lava-11144=
662/bin/lava-test-runner /lava-11144662/1

    2023-07-26T07:58:14.549896  =


    2023-07-26T07:58:14.561180  / # /lava-11144662/bin/lava-test-runner /la=
va-11144662/1

    2023-07-26T07:58:14.620179  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:58:14.620681  + cd /lav<8>[   28.589747] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11144662_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c4ccda1982adea8acf64

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c4ccda1982adea8acf69
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T07:02:38.023628  / # #

    2023-07-26T07:02:38.125878  export SHELL=3D/bin/sh

    2023-07-26T07:02:38.126607  #

    2023-07-26T07:02:38.228071  / # export SHELL=3D/bin/sh. /lava-11143993/=
environment

    2023-07-26T07:02:38.228793  =


    2023-07-26T07:02:38.330304  / # . /lava-11143993/environment/lava-11143=
993/bin/lava-test-runner /lava-11143993/1

    2023-07-26T07:02:38.331456  =


    2023-07-26T07:02:38.347830  / # /lava-11143993/bin/lava-test-runner /la=
va-11143993/1

    2023-07-26T07:02:38.425822  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:02:38.426320  + cd /lava-11143993/1/tests/1_boot<8>[   17=
.063746] <LAVA_SIGNAL_STARTRUN 1_bootrr 11143993_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c9c1f0dac7ba918ace8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c9c1f0dac7ba918ace92
        new failure (last pass: next-20230713)

    2023-07-26T07:24:01.968402  / # #

    2023-07-26T07:24:02.070607  export SHELL=3D/bin/sh

    2023-07-26T07:24:02.071343  #

    2023-07-26T07:24:02.172786  / # export SHELL=3D/bin/sh. /lava-11144201/=
environment

    2023-07-26T07:24:02.173555  =


    2023-07-26T07:24:02.275012  / # . /lava-11144201/environment/lava-11144=
201/bin/lava-test-runner /lava-11144201/1

    2023-07-26T07:24:02.276078  =


    2023-07-26T07:24:02.278909  / # /lava-11144201/bin/lava-test-runner /la=
va-11144201/1

    2023-07-26T07:24:02.361711  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:24:02.362218  + cd /lava-11144201/1/tests/1_boot<8>[   17=
.301991] <LAVA_SIGNAL_STARTRUN 1_bootrr 11144201_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c39518c03d98298aceca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c39518c03d98298acecf
        failing since 8 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-26T06:57:36.698024  / # #

    2023-07-26T06:57:36.800179  export SHELL=3D/bin/sh

    2023-07-26T06:57:36.800932  #

    2023-07-26T06:57:36.902396  / # export SHELL=3D/bin/sh. /lava-11143935/=
environment

    2023-07-26T06:57:36.903093  =


    2023-07-26T06:57:37.004342  / # . /lava-11143935/environment/lava-11143=
935/bin/lava-test-runner /lava-11143935/1

    2023-07-26T06:57:37.005498  =


    2023-07-26T06:57:37.022445  / # /lava-11143935/bin/lava-test-runner /la=
va-11143935/1

    2023-07-26T06:57:37.089803  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T06:57:37.089961  + cd /lava-11143935/1/tests/1_boot<8>[   16=
.955973] <LAVA_SIGNAL_STARTRUN 1_bootrr 11143935_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0c3d070bfe5794a8ace31

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0c3d070bfe5794a8ace36
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-26T06:58:39.348316  / # #

    2023-07-26T06:58:39.450463  export SHELL=3D/bin/sh

    2023-07-26T06:58:39.451163  #

    2023-07-26T06:58:39.552617  / # export SHELL=3D/bin/sh. /lava-11143948/=
environment

    2023-07-26T06:58:39.553354  =


    2023-07-26T06:58:39.654858  / # . /lava-11143948/environment/lava-11143=
948/bin/lava-test-runner /lava-11143948/1

    2023-07-26T06:58:39.655979  =


    2023-07-26T06:58:39.673126  / # /lava-11143948/bin/lava-test-runner /la=
va-11143948/1

    2023-07-26T06:58:39.743270  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T06:58:39.743783  + cd /lava-11143948/1/tests/1_boot<8>[   17=
.695692] <LAVA_SIGNAL_STARTRUN 1_bootrr 11143948_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0d20a5c07c1eee78ace97

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230726/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0d20a5c07c1eee78ace9c
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-26T07:59:19.620734  / # #

    2023-07-26T07:59:19.722864  export SHELL=3D/bin/sh

    2023-07-26T07:59:19.723569  #

    2023-07-26T07:59:19.824984  / # export SHELL=3D/bin/sh. /lava-11144665/=
environment

    2023-07-26T07:59:19.825696  =


    2023-07-26T07:59:19.927134  / # . /lava-11144665/environment/lava-11144=
665/bin/lava-test-runner /lava-11144665/1

    2023-07-26T07:59:19.928257  =


    2023-07-26T07:59:19.944901  / # /lava-11144665/bin/lava-test-runner /la=
va-11144665/1

    2023-07-26T07:59:20.013992  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-26T07:59:20.014482  + cd /lava-11144665/1/tests/1_boot<8>[   17=
.063147] <LAVA_SIGNAL_STARTRUN 1_bootrr 11144665_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
