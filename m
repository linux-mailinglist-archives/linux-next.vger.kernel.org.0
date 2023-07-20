Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3727F75ABAF
	for <lists+linux-next@lfdr.de>; Thu, 20 Jul 2023 12:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjGTKLe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Jul 2023 06:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGTKLd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jul 2023 06:11:33 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353D7B7
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 03:11:29 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-267c41ca947so267743a91.1
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689847888; x=1690452688;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wEA7vTgg3FMgtmNcAcbsE4aI6f64iGy3DbdgbGskODk=;
        b=MLYkG9xFSFtTTCXnpo9AiX1vSFAhoiIb+zzLP+MRsJoec8EBkcK1XmVd/N8fAhz+iE
         F5Ve1pUePCUsMYryKP9Yxj5NlodY6EuAOvsQrbRwkAQWoNDSczWf2zA/yoJqWKEmNkPn
         hrYXkq/KXP+nLwmgb3HWq3xQzK/quUaOQMVRzxxY3jek5+r8Dr5wFM0QaEg+tBs6rIVZ
         sEZFOQPVPxf+KO/Y5GfPgpyuOzkQ5YzctRhUfiofti1w3Onkbm19zXLG/qEXBgPlgssp
         TE+Wdw1cwWZoU9rTuE/IUz7i9XPJxfZjqf3ni35ENqD3TgHc7O847Yl6b1SqeYMhu49W
         Bh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689847888; x=1690452688;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEA7vTgg3FMgtmNcAcbsE4aI6f64iGy3DbdgbGskODk=;
        b=YCt3gNADcq4JIb3g48JuKq0JTEY09tox2ePtdvUgUKcttgeJ2TYudz1RVXpRuV4mR4
         qt1fJxu/MWCrCNzpqg1hwFUp9H7KbKci5rGhmwA0RBz0KaOQk5NH4WCDe3yEcet+/VAf
         2GgMb84Up+DRafl49Nt9hueDdzDedtq2P0NoByOJeU1GhQgA6z8IqAvemwEVoQXEsjpK
         vYo6pP7yTaOJpgfvdXX+mW01WXTmrL9qX8UbleQog3G/qX1YB/akLLTe7K5xsdW1EaM1
         EskgxxDK4Pj+RTtxarhspR/YG7nI7Y1fboRzquT2DpsSkpls0Cy54h0aCJGc9LrhfYrr
         auXg==
X-Gm-Message-State: ABy/qLZTTzT8vgzzFGdbdRkA3USdSvoBitN/AlW6i0j1IF7etzy7v55l
        ZCnykNIYpVz4+ANezXy+xxBxiZQ9IBbR19YhMRnzIQ==
X-Google-Smtp-Source: APBJJlGQ71io4pL5E7PjDUsLjFeG0FqxEgTmRuq90w9gPLDx9a/b1TALHfitH94cShTO9d1aqazvMw==
X-Received: by 2002:a17:90a:4dcf:b0:262:ba7f:30cd with SMTP id r15-20020a17090a4dcf00b00262ba7f30cdmr3518654pjl.31.1689847887709;
        Thu, 20 Jul 2023 03:11:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090a011000b00263dab4841dsm756055pjb.30.2023.07.20.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:11:27 -0700 (PDT)
Message-ID: <64b9084f.170a0220.c5c20.100b@mx.google.com>
Date:   Thu, 20 Jul 2023 03:11:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230720
X-Kernelci-Report-Type: test
Subject: next/master baseline: 152 runs, 29 regressions (next-20230720)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 152 runs, 29 regressions (next-20230720)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230720/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230720
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c58c49dd89324b18a812762a2bfa5a0458e4f252 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c955e8416f34218ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c955e8416f34218ac=
e1e
        failing since 6 days (last pass: next-20230712, first fail: next-20=
230713) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c85b78e55fc5638ace1e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c85b78e55fc5638ace23
        failing since 113 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-20T05:38:25.451287  + set +x

    2023-07-20T05:38:25.458238  <8>[   10.379654] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11117209_1.4.2.3.1>

    2023-07-20T05:38:25.566684  #

    2023-07-20T05:38:25.568152  =


    2023-07-20T05:38:25.670161  / # #export SHELL=3D/bin/sh

    2023-07-20T05:38:25.670953  =


    2023-07-20T05:38:25.772641  / # export SHELL=3D/bin/sh. /lava-11117209/=
environment

    2023-07-20T05:38:25.773442  =


    2023-07-20T05:38:25.875226  / # . /lava-11117209/environment/lava-11117=
209/bin/lava-test-runner /lava-11117209/1

    2023-07-20T05:38:25.876584  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c85d1ffbc570228ace1f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c85d1ffbc570228ace24
        failing since 113 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-20T05:38:21.978408  <8>[    9.973832] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11117215_1.4.2.3.1>

    2023-07-20T05:38:21.982041  + set +x

    2023-07-20T05:38:22.088113  =


    2023-07-20T05:38:22.189541  / # #export SHELL=3D/bin/sh

    2023-07-20T05:38:22.190362  =


    2023-07-20T05:38:22.291919  / # export SHELL=3D/bin/sh. /lava-11117215/=
environment

    2023-07-20T05:38:22.292158  =


    2023-07-20T05:38:22.393077  / # . /lava-11117215/environment/lava-11117=
215/bin/lava-test-runner /lava-11117215/1

    2023-07-20T05:38:22.394373  =


    2023-07-20T05:38:22.399751  / # /lava-11117215/bin/lava-test-runner /la=
va-11117215/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c8641ffbc570228ace3f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c8641ffbc570228ace44
        failing since 113 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-20T05:38:55.319187  + set +x

    2023-07-20T05:38:55.326012  <8>[   10.565505] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11117191_1.4.2.3.1>

    2023-07-20T05:38:55.430329  / # #

    2023-07-20T05:38:55.530904  export SHELL=3D/bin/sh

    2023-07-20T05:38:55.531080  #

    2023-07-20T05:38:55.631554  / # export SHELL=3D/bin/sh. /lava-11117191/=
environment

    2023-07-20T05:38:55.631756  =


    2023-07-20T05:38:55.732338  / # . /lava-11117191/environment/lava-11117=
191/bin/lava-test-runner /lava-11117191/1

    2023-07-20T05:38:55.732576  =


    2023-07-20T05:38:55.737693  / # /lava-11117191/bin/lava-test-runner /la=
va-11117191/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c8504fd366a3e78ace2f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c8504fd366a3e78ace34
        failing since 113 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-20T05:38:50.902602  + set<8>[   10.473915] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11117198_1.4.2.3.1>

    2023-07-20T05:38:50.902714   +x

    2023-07-20T05:38:51.004946  #

    2023-07-20T05:38:51.105683  / # #export SHELL=3D/bin/sh

    2023-07-20T05:38:51.105881  =


    2023-07-20T05:38:51.206392  / # export SHELL=3D/bin/sh. /lava-11117198/=
environment

    2023-07-20T05:38:51.206583  =


    2023-07-20T05:38:51.307106  / # . /lava-11117198/environment/lava-11117=
198/bin/lava-test-runner /lava-11117198/1

    2023-07-20T05:38:51.307388  =


    2023-07-20T05:38:51.312490  / # /lava-11117198/bin/lava-test-runner /la=
va-11117198/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d27f1f26cf19798ace35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8d27f1f26cf19798ace3a
        new failure (last pass: next-20230717)

    2023-07-20T06:21:25.610284  + set<8>[   22.635137] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3723706_1.5.2.4.1>
    2023-07-20T06:21:25.611314   +x
    2023-07-20T06:21:25.730685  / # #
    2023-07-20T06:21:26.897221  export SHELL=3D/bin/sh
    2023-07-20T06:21:26.903827  #
    2023-07-20T06:21:28.461455  / # export SHELL=3D/bin/sh. /lava-3723706/e=
nvironment
    2023-07-20T06:21:28.469265  =

    2023-07-20T06:21:31.305965  / # . /lava-3723706/environment/lava-372370=
6/bin/lava-test-runner /lava-3723706/1
    2023-07-20T06:21:31.313772  =

    2023-07-20T06:21:31.314797  / # /lava-3723706/bin/lava<3>[   26.758921]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d15d0ada507e0c8ace48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8d15d0ada507e0c8ac=
e49
        failing since 91 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c86178e55fc5638ace40

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c86178e55fc5638ace45
        failing since 26 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-20T05:38:22.213946  + set +x<8>[   11.925680] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11117225_1.4.2.3.1>

    2023-07-20T05:38:22.214113  =


    2023-07-20T05:38:22.318711  / # #

    2023-07-20T05:38:22.419778  export SHELL=3D/bin/sh

    2023-07-20T05:38:22.420483  #

    2023-07-20T05:38:22.521925  / # export SHELL=3D/bin/sh. /lava-11117225/=
environment

    2023-07-20T05:38:22.522590  =


    2023-07-20T05:38:22.623944  / # . /lava-11117225/environment/lava-11117=
225/bin/lava-test-runner /lava-11117225/1

    2023-07-20T05:38:22.624735  =


    2023-07-20T05:38:22.629514  / # /lava-11117225/bin/lava-test-runner /la=
va-11117225/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c1d3c79dc03f948acf14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c1d3c79dc03f948ac=
f15
        new failure (last pass: next-20230717) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43d849353dde48ace2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43d849353dde48ac=
e2b
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c45716201f8aba8ace3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c45716201f8aba8ac=
e3c
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43d16201f8aba8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43d16201f8aba8ac=
e26
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43c849353dde48ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43c849353dde48ac=
e26
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c455849353dde48ace38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c455849353dde48ac=
e39
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43b16201f8aba8ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43b16201f8aba8ac=
e20
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43b849353dde48ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43b849353dde48ac=
e21
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c45416201f8aba8ace35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c45416201f8aba8ac=
e36
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43a849353dde48ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43a849353dde48ac=
e1d
        failing since 307 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c43e16201f8aba8ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c43e16201f8aba8ac=
e2c
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c458849353dde48ace3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c458849353dde48ac=
e3f
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c44e849353dde48ace32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8c44e849353dde48ac=
e33
        failing since 309 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d20a0d9db34a8e8ace9c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8d20a0d9db34a8e8ace9f
        failing since 2 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-20T06:19:33.391419  / # #
    2023-07-20T06:19:34.854205  export SHELL=3D/bin/sh
    2023-07-20T06:19:34.875434  #
    2023-07-20T06:19:34.875975  / # export SHELL=3D/bin/sh
    2023-07-20T06:19:36.762800  / # . /lava-987781/environment
    2023-07-20T06:19:40.220377  /lava-987781/bin/lava-test-runner /lava-987=
781/1
    2023-07-20T06:19:40.241137  . /lava-987781/environment
    2023-07-20T06:19:40.241250  / # /lava-987781/bin/lava-test-runner /lava=
-987781/1
    2023-07-20T06:19:40.283250  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-20T06:19:40.320314  + cd /lava-987781/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8c1dec6e4a80bae8ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8c1dec6e4a80bae8ace1f
        failing since 2 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-20T05:10:37.492110  / # #
    2023-07-20T05:10:38.954890  export SHELL=3D/bin/sh
    2023-07-20T05:10:38.975554  #
    2023-07-20T05:10:38.975763  / # export SHELL=3D/bin/sh
    2023-07-20T05:10:40.861664  / # . /lava-987770/environment
    2023-07-20T05:10:44.320094  /lava-987770/bin/lava-test-runner /lava-987=
770/1
    2023-07-20T05:10:44.341058  . /lava-987770/environment
    2023-07-20T05:10:44.341169  / # /lava-987770/bin/lava-test-runner /lava=
-987770/1
    2023-07-20T05:10:44.387926  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-20T05:10:44.425953  + cd /lava-987770/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64b8fdf382bb9949c38ace1c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
64b8fdf382bb9949c38ace20
        failing since 147 days (last pass: next-20230214, first fail: next-=
20230222)

    2023-07-20T09:28:42.258858  /lava-11117285/1/../bin/lava-test-case

    2023-07-20T09:28:42.305702  <8>[   22.460011] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-07-20T09:28:42.306220  /lava-11117285/1/../bin/lava-test-case

    2023-07-20T09:28:42.306501  <8>[   22.475494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-07-20T09:28:42.306758  + set +x

    2023-07-20T09:28:42.306990  <8>[   22.488444] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 11117285_1.5.2.4.5>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8fdf382bb9949c38ace21
        failing since 2 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-20T09:28:39.863220  / # #

    2023-07-20T09:28:39.965390  export SHELL=3D/bin/sh

    2023-07-20T09:28:39.966107  #

    2023-07-20T09:28:40.067515  / # export SHELL=3D/bin/sh. /lava-11117285/=
environment

    2023-07-20T09:28:40.068231  =


    2023-07-20T09:28:40.169723  / # . /lava-11117285/environment/lava-11117=
285/bin/lava-test-runner /lava-11117285/1

    2023-07-20T09:28:40.170817  =


    2023-07-20T09:28:40.187204  / # /lava-11117285/bin/lava-test-runner /la=
va-11117285/1

    2023-07-20T09:28:40.239920  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-20T09:28:40.240429  + cd /lav<8>[   20.402671] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11117285_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d1a05272c85c828ace78

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8d1a05272c85c828ace7d
        failing since 2 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-20T06:17:58.743752  / # #

    2023-07-20T06:17:59.822549  export SHELL=3D/bin/sh

    2023-07-20T06:17:59.824333  #

    2023-07-20T06:18:01.312784  / # export SHELL=3D/bin/sh. /lava-11117284/=
environment

    2023-07-20T06:18:01.314561  =


    2023-07-20T06:18:04.038992  / # . /lava-11117284/environment/lava-11117=
284/bin/lava-test-runner /lava-11117284/1

    2023-07-20T06:18:04.041482  =


    2023-07-20T06:18:04.050766  / # /lava-11117284/bin/lava-test-runner /la=
va-11117284/1

    2023-07-20T06:18:04.109930  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-20T06:18:04.110467  + cd /lav<8>[   29.480305] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11117284_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d2835b897e38988ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8d2835b897e38988ac=
e24
        failing since 92 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d2771f26cf19798ace2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b8d2771f26cf19798ac=
e30
        failing since 8 days (last pass: next-20230608, first fail: next-20=
230712) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b8d18b5272c85c828ace33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b8d18b5272c85c828ace38
        failing since 2 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-20T06:19:03.883308  / # #

    2023-07-20T06:19:03.985471  export SHELL=3D/bin/sh

    2023-07-20T06:19:03.986177  #

    2023-07-20T06:19:04.087571  / # export SHELL=3D/bin/sh. /lava-11117287/=
environment

    2023-07-20T06:19:04.088281  =


    2023-07-20T06:19:04.189715  / # . /lava-11117287/environment/lava-11117=
287/bin/lava-test-runner /lava-11117287/1

    2023-07-20T06:19:04.190798  =


    2023-07-20T06:19:04.207553  / # /lava-11117287/bin/lava-test-runner /la=
va-11117287/1

    2023-07-20T06:19:04.281506  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-20T06:19:04.282016  + cd /lava-11117287/1/tests/1_boot<8>[   18=
.451455] <LAVA_SIGNAL_STARTRUN 1_bootrr 11117287_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
