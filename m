Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBAB4757BDA
	for <lists+linux-next@lfdr.de>; Tue, 18 Jul 2023 14:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjGRMbj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Jul 2023 08:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjGRMbi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jul 2023 08:31:38 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E2E10EB
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 05:31:34 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666edfc50deso3483548b3a.0
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 05:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689683493; x=1692275493;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rGgyf27tZ2lL6KZWWo/ZYd7uivIfjHrKdnz0VECr9t4=;
        b=ZU3Mv50+EOGMmeswJaiIBkLdXePxJVVKH7+IRzi8VX2BypN5u136ey8NXgLMTNGOb1
         NUTkNqSSVZsU76WFDK19M3osRn+0rOQILC9AfEgNa8PP++0QZ1Z2XR4VSa5EywCTIIkq
         57uctItl2hsFk4Eul/YjaemhaLOb752AXLjdTOQFN0aVdWm1KcCNtCOjMTPfueG5+i5B
         aLaGuotFpt5WjNynt9RxwsismYbSIcwMtQcKc4vRIeGWhm5rZJHT46vG4ZyCsVbVWI4w
         p5VO8ibZg++FuC8UR8ubp2pId+A574iDFBqiAUJ0KrQRv+rBAZfyFgBLnuA3pKJL+4DG
         +0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689683493; x=1692275493;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGgyf27tZ2lL6KZWWo/ZYd7uivIfjHrKdnz0VECr9t4=;
        b=XyGJQMO7N23XCuN7p6lTu9iP4pbaalqWd0Cr1HALwKO1Dy9rIbfhf3fZDDtvSnU7cH
         xGbckTQYZkG+NS/H6d5BO0P3Eyl3UJxjAP+mg1jl4AYwiYqR7OAugyZBAs+2Gee18mYq
         JKNuUS06dlkhspaGxHx+WjwunJpLxMslTyeuF1H9EBH0WbvcMZSUpPXjccP0dHY+TLS0
         5kEIfSf875uZtmGyLqs4Zf2tb/+7eDOLe5+d1d6GCRt55TC9Y3WWAukM5dND+Guo9vL1
         Boh7OpebhhClwjKnRODQJxGzJ9dTXM8wk49B2DqIKgF0EZYPTVVP7a0yEe8OzVE5sYtK
         t+gg==
X-Gm-Message-State: ABy/qLbph5Nu4PcaopCtgEAOcj262Bb8VpRedqun+Hw91mECE0AYRP56
        Czh2XBZA/MqX7h+fmc6N16SZ2gtcCGL+Muf+z0bZJw==
X-Google-Smtp-Source: APBJJlElP4DO0SqWgT1Y//V1T5rzaoecdLZfNEyGQTw6kO4dlcFj4oZk3cIMg2zPKh4vVaA54KQUPg==
X-Received: by 2002:a05:6a20:12cd:b0:136:5e98:3113 with SMTP id v13-20020a056a2012cd00b001365e983113mr1524174pzg.28.1689683493065;
        Tue, 18 Jul 2023 05:31:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78186000000b0064398fe3451sm1436420pfi.217.2023.07.18.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:31:32 -0700 (PDT)
Message-ID: <64b68624.a70a0220.b96f5.2b7c@mx.google.com>
Date:   Tue, 18 Jul 2023 05:31:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230718
X-Kernelci-Report-Type: test
Subject: next/master baseline: 297 runs, 28 regressions (next-20230718)
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

next/master baseline: 297 runs, 28 regressions (next-20230718)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+kselftest          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | clang-13 | cros://c=
hrome...avour.config | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230718/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230718
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aeba456828b4e47d99ec8ffb01412fbed0f94806 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6529893ce6b89538ace42

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4b6529993ce6b89538ace51
        new failure (last pass: next-20230717)

    2023-07-18T08:51:09.174762  /usr/bin/tpm2_getcap

    2023-07-18T08:51:09.226508  <4>[   10.130009] i2c_designware AMD0010:01=
: timeout in disabling adapter

    2023-07-18T08:51:09.254035  <4>[   10.156978] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-07-18T08:51:09.280623  <4>[   10.183972] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-07-18T08:51:09.287376  <4>[   10.190598] tpm tpm0: i2c transfer fa=
iled (attempt 2/3): -110

    2023-07-18T08:51:09.314901  <4>[   10.217297] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-07-18T08:51:09.320521  <4>[   10.223925] tpm tpm0: i2c transfer fa=
iled (attempt 3/3): -110

    2023-07-18T08:51:09.348237  <4>[   10.251296] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-07-18T08:51:09.376082  <4>[   10.278969] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-07-18T08:51:09.382244  <4>[   10.285595] tpm tpm0: i2c transfer fa=
iled (attempt 2/3): -110
 =

    ... (120 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65c36afa290c8658ace3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65c36afa290c8658ac=
e3c
        failing since 5 days (last pass: next-20230712, first fail: next-20=
230713) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65c16291246fbd98ace4d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65c16291246fbd98ace52
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-18T09:31:56.051774  + set +x

    2023-07-18T09:31:56.058169  <8>[    9.986373] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106785_1.4.2.3.1>

    2023-07-18T09:31:56.162876  / # #

    2023-07-18T09:31:56.263538  export SHELL=3D/bin/sh

    2023-07-18T09:31:56.263711  #

    2023-07-18T09:31:56.364205  / # export SHELL=3D/bin/sh. /lava-11106785/=
environment

    2023-07-18T09:31:56.364404  =


    2023-07-18T09:31:56.464969  / # . /lava-11106785/environment/lava-11106=
785/bin/lava-test-runner /lava-11106785/1

    2023-07-18T09:31:56.465243  =


    2023-07-18T09:31:56.471013  / # /lava-11106785/bin/lava-test-runner /la=
va-11106785/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65c36e7620b4aee8ace44

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65c36e7620b4aee8ace49
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-18T09:32:23.043165  <8>[    9.847569] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106813_1.4.2.3.1>

    2023-07-18T09:32:23.046776  + set +x

    2023-07-18T09:32:23.152154  / #

    2023-07-18T09:32:23.254893  # #export SHELL=3D/bin/sh

    2023-07-18T09:32:23.255659  =


    2023-07-18T09:32:23.357741  / # export SHELL=3D/bin/sh. /lava-11106813/=
environment

    2023-07-18T09:32:23.358531  =


    2023-07-18T09:32:23.460290  / # . /lava-11106813/environment/lava-11106=
813/bin/lava-test-runner /lava-11106813/1

    2023-07-18T09:32:23.461636  =


    2023-07-18T09:32:23.467369  / # /lava-11106813/bin/lava-test-runner /la=
va-11106813/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65de441c5ae92d68ace1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65de441c5ae92d68ace20
        failing since 158 days (last pass: next-20230209, first fail: next-=
20230210)

    2023-07-18T09:39:36.253372  + set +x[   15.530716] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1237286_1.5.2.4.1>
    2023-07-18T09:39:36.253664  =

    2023-07-18T09:39:36.364037  / # #
    2023-07-18T09:39:36.465453  export SHELL=3D/bin/sh
    2023-07-18T09:39:36.465869  #
    2023-07-18T09:39:36.566849  / # export SHELL=3D/bin/sh. /lava-1237286/e=
nvironment
    2023-07-18T09:39:36.567283  =

    2023-07-18T09:39:36.668277  / # . /lava-1237286/environment/lava-123728=
6/bin/lava-test-runner /lava-1237286/1
    2023-07-18T09:39:36.669045  =

    2023-07-18T09:39:36.673445  / # /lava-1237286/bin/lava-test-runner /lav=
a-1237286/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65bf92baa2da9858ace43

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65bf92baa2da9858ace48
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-18T09:31:38.501380  + set +x

    2023-07-18T09:31:38.507735  <8>[   10.436045] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106791_1.4.2.3.1>

    2023-07-18T09:31:38.612784  / # #

    2023-07-18T09:31:38.713519  export SHELL=3D/bin/sh

    2023-07-18T09:31:38.713710  #

    2023-07-18T09:31:38.814239  / # export SHELL=3D/bin/sh. /lava-11106791/=
environment

    2023-07-18T09:31:38.814439  =


    2023-07-18T09:31:38.915047  / # . /lava-11106791/environment/lava-11106=
791/bin/lava-test-runner /lava-11106791/1

    2023-07-18T09:31:38.915363  =


    2023-07-18T09:31:38.919998  / # /lava-11106791/bin/lava-test-runner /la=
va-11106791/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65c18291246fbd98ace71

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65c18291246fbd98ace76
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-18T09:32:01.741874  + set +x

    2023-07-18T09:32:01.748132  <8>[   10.266109] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106806_1.4.2.3.1>

    2023-07-18T09:32:01.855926  =


    2023-07-18T09:32:01.957767  / # #export SHELL=3D/bin/sh

    2023-07-18T09:32:01.958607  =


    2023-07-18T09:32:02.060210  / # export SHELL=3D/bin/sh. /lava-11106806/=
environment

    2023-07-18T09:32:02.060938  =


    2023-07-18T09:32:02.162713  / # . /lava-11106806/environment/lava-11106=
806/bin/lava-test-runner /lava-11106806/1

    2023-07-18T09:32:02.163989  =


    2023-07-18T09:32:02.169480  / # /lava-11106806/bin/lava-test-runner /la=
va-11106806/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65c19afa290c8658ace1f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65c19afa290c8658ace24
        failing since 25 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-18T09:31:46.006442  + <8>[    9.328799] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11106808_1.4.2.3.1>

    2023-07-18T09:31:46.006526  set +x

    2023-07-18T09:31:46.110532  / # #

    2023-07-18T09:31:46.211208  export SHELL=3D/bin/sh

    2023-07-18T09:31:46.211398  #

    2023-07-18T09:31:46.311903  / # export SHELL=3D/bin/sh. /lava-11106808/=
environment

    2023-07-18T09:31:46.312085  =


    2023-07-18T09:31:46.412626  / # . /lava-11106808/environment/lava-11106=
808/bin/lava-test-runner /lava-11106808/1

    2023-07-18T09:31:46.412895  =


    2023-07-18T09:31:46.417454  / # /lava-11106808/bin/lava-test-runner /la=
va-11106808/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65ec3404f5b3dd28ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65ec3404f5b3dd28ac=
e1f
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65ec53c6db49ee68ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65ec53c6db49ee68ac=
e1d
        failing since 174 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e2be6e340a93f8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e2be6e340a93f8ac=
e1d
        failing since 174 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e6030350186468ace32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e6030350186468ac=
e33
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65ef337709fa6568ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65ef337709fa6568ac=
e24
        failing since 162 days (last pass: next-20230203, first fail: next-=
20230206) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65ef237709fa6568ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65ef237709fa6568ac=
e1e
        failing since 161 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e6330350186468ace38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e6330350186468ac=
e39
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65eaf36d3ab5c498ace36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65eaf36d3ab5c498ac=
e37
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e21c4dfbc0ac68ace8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e21c4dfbc0ac68ac=
e8c
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e5edc2d2a13f28ace4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e5edc2d2a13f28ac=
e4d
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6541f19329f7df78ace94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b6541f19329f7df78ac=
e95
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30717) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6546bde927a18598ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b6546bde927a18598ac=
e1e
        new failure (last pass: next-20230717) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65469cb36504d208ace27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b65469cb36504d208ace2a
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30717)

    2023-07-18T08:59:07.704325  / # #
    2023-07-18T08:59:09.167858  export SHELL=3D/bin/sh
    2023-07-18T08:59:09.188431  #
    2023-07-18T08:59:09.188640  / # export SHELL=3D/bin/sh
    2023-07-18T08:59:11.074889  / # . /lava-987160/environment
    2023-07-18T08:59:14.534592  /lava-987160/bin/lava-test-runner /lava-987=
160/1
    2023-07-18T08:59:14.556218  . /lava-987160/environment
    2023-07-18T08:59:14.556579  / # /lava-987160/bin/lava-test-runner /lava=
-987160/1
    2023-07-18T08:59:14.641211  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-18T08:59:14.641595  + cd /lava-987160/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64b654581ec48984718acedd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b654581ec48984718acee2
        failing since 39 days (last pass: next-20221012, first fail: next-2=
0230609)

    2023-07-18T08:58:42.467313  [    5.203382] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3722249_1.5.2.4.1>
    2023-07-18T08:58:42.574747  =

    2023-07-18T08:58:42.676780  / # #export SHELL=3D/bin/sh
    2023-07-18T08:58:42.677434  =

    2023-07-18T08:58:42.779448  / # export SHELL=3D/bin/sh. /lava-3722249/e=
nvironment
    2023-07-18T08:58:42.779930  =

    2023-07-18T08:58:42.881357  / # . /lava-3722249/environment/lava-372224=
9/bin/lava-test-runner /lava-3722249/1
    2023-07-18T08:58:42.882280  =

    2023-07-18T08:58:42.885613  / # /lava-3722249/bin/lava-test-runner /lav=
a-3722249/1
    2023-07-18T08:58:42.945079  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6543b1ec48984718ace26

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-efuse-probed: https://kernelci.org/test/case/i=
d/64b6543b1ec48984718ace4c
        failing since 0 day (last pass: next-20230710, first fail: next-202=
30717)

    2023-07-18T08:58:15.490878  /lava-11106571/1/../bin/lava-test-case

    2023-07-18T08:58:15.504014  <8>[   33.574248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e2a8cade62d098ace4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e2a8cade62d098ac=
e4d
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e29c4dfbc0ac68ace9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e29c4dfbc0ac68ac=
e9f
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e6230350186468ace35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e6230350186468ac=
e36
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e288cade62d098ace46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e288cade62d098ac=
e47
        failing since 161 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b65e3be6e340a93f8ace3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230718/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b65e3be6e340a93f8ac=
e3d
        failing since 40 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
