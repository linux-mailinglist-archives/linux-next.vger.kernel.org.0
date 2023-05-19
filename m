Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A7F708F7B
	for <lists+linux-next@lfdr.de>; Fri, 19 May 2023 07:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjESFfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 May 2023 01:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjESFfm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 May 2023 01:35:42 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C95AE5A
        for <linux-next@vger.kernel.org>; Thu, 18 May 2023 22:35:37 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d24136685so337512b3a.1
        for <linux-next@vger.kernel.org>; Thu, 18 May 2023 22:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684474536; x=1687066536;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MgTp4IgUBFCWGDpao9sBHbl4fOzAytoSJk11ZTp59zA=;
        b=pVbqL5cKTamcZjQDuMFru0E/l9iJTje9k7HCzPBcMOcPjjoTcq3somPkQZHQcHGcLv
         gg13z634EMd/MsjD0A1ip1ohYA5k4F/ZUDPhvmNorPDScUGHJFk6/H6UKcmbm4V/q0jQ
         eQx+hmztPuHCR5UqtfHttBVFgw7i3Jkdk2P+Ha3Z0zogotguiSWhOK4QwzziHNUlxIHJ
         OZMFXJSGB/Bo/V+a77b5brol+3Brg65vzTueOwJxNfQVBlOSH/c2BXjbEejA4HUWqx+w
         SS6nYyC1xECmswZQyWqfN03YK5PmNTqeASaUXaFgXroPLoHhXc1mWoVC0bnnnEpYHtru
         gijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684474536; x=1687066536;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgTp4IgUBFCWGDpao9sBHbl4fOzAytoSJk11ZTp59zA=;
        b=looYDZGp0I2QLCm2CgnocIUjN5YJdOqRFdc/gjezRT6Ye6zohlcWD0C4jujwfkFk1N
         +5C668IH5yFWq1Eks2YrPu3GszEDrBAhpTUUJMQ7c11scxR15TpeVU/xWeWCcIvOiWAv
         TwLe7c/iUDtmR+jul/q1qzRdKG1SWJ1WZrtyvMAguJgPphXBxkNzNDOMpEvYNoceY08m
         cu8q9MHVjUkIZq9lOyghzATEzyOenXrl2nnXEgdgISNqDfkxe8RCsTWeqMUJVYJntYX/
         JKLT6xx6dMllsvqzGrOEJccaebVO21daOxZkH+CobnApZvGDnRav8iLTGqu45C/t10q9
         KbfQ==
X-Gm-Message-State: AC+VfDyaMvPg/mTNVZO+14KY03A12sLiXg1ME5XFN8kKKbxLQkEC8BfR
        kfpQljMuItiIwde3Sg2l3l17QFrbyFVk4ZAhvengeg==
X-Google-Smtp-Source: ACHHUZ5CMCn80fjINuA6SShjNIMgK+RQyzaoahaeGkmKgobXd1O42m4VcaRs51Q3pgZbJ5CytD1fOw==
X-Received: by 2002:a05:6a00:1146:b0:646:f971:b179 with SMTP id b6-20020a056a00114600b00646f971b179mr7725493pfm.16.1684474535014;
        Thu, 18 May 2023 22:35:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78186000000b0063799398eaesm2182427pfi.51.2023.05.18.22.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 22:35:34 -0700 (PDT)
Message-ID: <64670aa6.a70a0220.1d58d.4481@mx.google.com>
Date:   Thu, 18 May 2023 22:35:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc2-486-gf467b1d198e27
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 612 runs,
 58 regressions (v6.4-rc2-486-gf467b1d198e27)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 612 runs, 58 regressions (v6.4-rc2-486-gf467b1=
d198e27)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc2-486-gf467b1d198e27/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc2-486-gf467b1d198e27
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f467b1d198e27304a9bbb410ac68532eb0dd8e1f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6466eb13e32c2fd78f2e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466eb13e32c2fd78f2e8=
5fe
        failing since 221 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf9b5a0ea7c3742e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466cf9b5a0ea7c3742e8618
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:23:31.483931  + set +x

    2023-05-19T01:23:31.490380  <8>[   13.526644] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382301_1.4.2.3.1>

    2023-05-19T01:23:31.599879  =


    2023-05-19T01:23:31.701719  / # #export SHELL=3D/bin/sh

    2023-05-19T01:23:31.702399  =


    2023-05-19T01:23:31.803851  / # export SHELL=3D/bin/sh. /lava-10382301/=
environment

    2023-05-19T01:23:31.804600  =


    2023-05-19T01:23:31.906107  / # . /lava-10382301/environment/lava-10382=
301/bin/lava-test-runner /lava-10382301/1

    2023-05-19T01:23:31.907299  =


    2023-05-19T01:23:31.950011  / # /lava-10382301/bin/lava-test-runner /la=
va-10382301/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1e118c21caf812e869a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1e118c21caf812e869f
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:33:08.987039  <8>[   11.332076] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382539_1.4.2.3.1>

    2023-05-19T01:33:08.990319  + set +x

    2023-05-19T01:33:09.094864  / # #

    2023-05-19T01:33:09.195602  export SHELL=3D/bin/sh

    2023-05-19T01:33:09.195795  #

    2023-05-19T01:33:09.296324  / # export SHELL=3D/bin/sh. /lava-10382539/=
environment

    2023-05-19T01:33:09.296526  =


    2023-05-19T01:33:09.397033  / # . /lava-10382539/environment/lava-10382=
539/bin/lava-test-runner /lava-10382539/1

    2023-05-19T01:33:09.397400  =


    2023-05-19T01:33:09.402934  / # /lava-10382539/bin/lava-test-runner /la=
va-10382539/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d18211c47c58442e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d18211c47c58442e85ec
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:31:38.053059  + set<8>[    9.035428] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10382298_1.4.2.3.1>

    2023-05-19T01:31:38.053205   +x

    2023-05-19T01:31:38.157649  / # #

    2023-05-19T01:31:38.258379  export SHELL=3D/bin/sh

    2023-05-19T01:31:38.258617  #

    2023-05-19T01:31:38.359198  / # export SHELL=3D/bin/sh. /lava-10382298/=
environment

    2023-05-19T01:31:38.359518  =


    2023-05-19T01:31:38.460078  / # . /lava-10382298/environment/lava-10382=
298/bin/lava-test-runner /lava-10382298/1

    2023-05-19T01:31:38.460463  =


    2023-05-19T01:31:38.465426  / # /lava-10382298/bin/lava-test-runner /la=
va-10382298/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1e3f813c9f6c92e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1e3f813c9f6c92e85eb
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:33:02.393312  + set<8>[   11.931056] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10382563_1.4.2.3.1>

    2023-05-19T01:33:02.393402   +x

    2023-05-19T01:33:02.498100  / # #

    2023-05-19T01:33:02.598660  export SHELL=3D/bin/sh

    2023-05-19T01:33:02.598881  #

    2023-05-19T01:33:02.699384  / # export SHELL=3D/bin/sh. /lava-10382563/=
environment

    2023-05-19T01:33:02.699565  =


    2023-05-19T01:33:02.800084  / # . /lava-10382563/environment/lava-10382=
563/bin/lava-test-runner /lava-10382563/1

    2023-05-19T01:33:02.800514  =


    2023-05-19T01:33:02.805073  / # /lava-10382563/bin/lava-test-runner /la=
va-10382563/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf61d38dfb1a792e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466cf61d38dfb1a792e85eb
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:22:19.607774  <8>[   10.955876] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382273_1.4.2.3.1>

    2023-05-19T01:22:19.611342  + set +x

    2023-05-19T01:22:19.712745  #

    2023-05-19T01:22:19.713137  =


    2023-05-19T01:22:19.813892  / # #export SHELL=3D/bin/sh

    2023-05-19T01:22:19.814154  =


    2023-05-19T01:22:19.914781  / # export SHELL=3D/bin/sh. /lava-10382273/=
environment

    2023-05-19T01:22:19.915040  =


    2023-05-19T01:22:20.015712  / # . /lava-10382273/environment/lava-10382=
273/bin/lava-test-runner /lava-10382273/1

    2023-05-19T01:22:20.016135  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1bdcb01577f002e8662

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1bdcb01577f002e8667
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:32:27.898720  <8>[   10.207897] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382565_1.4.2.3.1>

    2023-05-19T01:32:27.901872  + set +x

    2023-05-19T01:32:28.003456  #

    2023-05-19T01:32:28.003751  =


    2023-05-19T01:32:28.104393  / # #export SHELL=3D/bin/sh

    2023-05-19T01:32:28.104641  =


    2023-05-19T01:32:28.205174  / # export SHELL=3D/bin/sh. /lava-10382565/=
environment

    2023-05-19T01:32:28.205420  =


    2023-05-19T01:32:28.306004  / # . /lava-10382565/environment/lava-10382=
565/bin/lava-test-runner /lava-10382565/1

    2023-05-19T01:32:28.306329  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d2a561ba5aedfd2e8608

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d2a561ba5aedfd2e860d
        failing since 127 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-19T01:36:18.868717  / # #

    2023-05-19T01:36:18.969150  export SHELL=3D/bin/sh

    2023-05-19T01:36:18.969270  #

    2023-05-19T01:36:19.069691  / # export SHELL=3D/bin/sh. /lava-10382572/=
environment

    2023-05-19T01:36:19.069863  =


    2023-05-19T01:36:19.170295  / # . /lava-10382572/environment/lava-10382=
572/bin/lava-test-runner /lava-10382572/1

    2023-05-19T01:36:19.170486  =


    2023-05-19T01:36:19.182499  / # /lava-10382572/bin/lava-test-runner /la=
va-10382572/1

    2023-05-19T01:36:19.297299  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-19T01:36:19.297368  + cd /lava-10382572/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d5dba2a1f825352e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d5dba2a1f825352e8=
633
        failing since 81 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d2a8e272f6f53a2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d2a8e272f6f53a2e8=
5f3
        new failure (last pass: v6.4-rc2-426-gdec469ae11955) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d381ac7e4a41db2e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d381ac7e4a41db2e8=
611
        failing since 143 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1f4a874f6c2652e85ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1f4a874f6c2652e8604
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:33:28.680523  + set +x

    2023-05-19T01:33:28.687283  <8>[   10.683649] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382282_1.4.2.3.1>

    2023-05-19T01:33:28.792607  / # #

    2023-05-19T01:33:28.893244  export SHELL=3D/bin/sh

    2023-05-19T01:33:28.893498  #

    2023-05-19T01:33:28.994006  / # export SHELL=3D/bin/sh. /lava-10382282/=
environment

    2023-05-19T01:33:28.994219  =


    2023-05-19T01:33:29.094751  / # . /lava-10382282/environment/lava-10382=
282/bin/lava-test-runner /lava-10382282/1

    2023-05-19T01:33:29.095052  =


    2023-05-19T01:33:29.099750  / # /lava-10382282/bin/lava-test-runner /la=
va-10382282/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d2bec7bc2315f32e8676

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d2bec7bc2315f32e867b
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:36:49.606768  + set +x

    2023-05-19T01:36:49.612970  <8>[   10.565306] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382569_1.4.2.3.1>

    2023-05-19T01:36:49.721176  / # #

    2023-05-19T01:36:49.823530  export SHELL=3D/bin/sh

    2023-05-19T01:36:49.824285  #

    2023-05-19T01:36:49.925812  / # export SHELL=3D/bin/sh. /lava-10382569/=
environment

    2023-05-19T01:36:49.926516  =


    2023-05-19T01:36:50.027924  / # . /lava-10382569/environment/lava-10382=
569/bin/lava-test-runner /lava-10382569/1

    2023-05-19T01:36:50.029056  =


    2023-05-19T01:36:50.034027  / # /lava-10382569/bin/lava-test-runner /la=
va-10382569/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1f4ca0f74a3032e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1f4ca0f74a3032e860b
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:33:23.002999  + set +x

    2023-05-19T01:33:23.009859  <8>[   10.186628] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382261_1.4.2.3.1>

    2023-05-19T01:33:23.113151  =


    2023-05-19T01:33:23.213914  / # #export SHELL=3D/bin/sh

    2023-05-19T01:33:23.214204  =


    2023-05-19T01:33:23.314821  / # export SHELL=3D/bin/sh. /lava-10382261/=
environment

    2023-05-19T01:33:23.315115  =


    2023-05-19T01:33:23.415757  / # . /lava-10382261/environment/lava-10382=
261/bin/lava-test-runner /lava-10382261/1

    2023-05-19T01:33:23.416211  =


    2023-05-19T01:33:23.421109  / # /lava-10382261/bin/lava-test-runner /la=
va-10382261/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d21ed3c52b22322e8610

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d21ed3c52b22322e8615
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:34:09.832409  <8>[   10.336466] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382547_1.4.2.3.1>

    2023-05-19T01:34:09.836045  + set +x

    2023-05-19T01:34:09.942402  #

    2023-05-19T01:34:09.943590  =


    2023-05-19T01:34:10.045460  / # #export SHELL=3D/bin/sh

    2023-05-19T01:34:10.046168  =


    2023-05-19T01:34:10.147969  / # export SHELL=3D/bin/sh. /lava-10382547/=
environment

    2023-05-19T01:34:10.148701  =


    2023-05-19T01:34:10.250121  / # . /lava-10382547/environment/lava-10382=
547/bin/lava-test-runner /lava-10382547/1

    2023-05-19T01:34:10.251282  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf4f7cb6f5f09c2e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466cf4f7cb6f5f09c2e8618
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:22:06.052630  + set<8>[   11.334659] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10382242_1.4.2.3.1>

    2023-05-19T01:22:06.052712   +x

    2023-05-19T01:22:06.157369  / # #

    2023-05-19T01:22:06.258016  export SHELL=3D/bin/sh

    2023-05-19T01:22:06.258192  #

    2023-05-19T01:22:06.358676  / # export SHELL=3D/bin/sh. /lava-10382242/=
environment

    2023-05-19T01:22:06.358842  =


    2023-05-19T01:22:06.459357  / # . /lava-10382242/environment/lava-10382=
242/bin/lava-test-runner /lava-10382242/1

    2023-05-19T01:22:06.459598  =


    2023-05-19T01:22:06.464350  / # /lava-10382242/bin/lava-test-runner /la=
va-10382242/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1bdacd466b5bf2e8677

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1bdacd466b5bf2e867c
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:32:29.923529  + <8>[    8.561683] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10382540_1.4.2.3.1>

    2023-05-19T01:32:29.923638  set +x

    2023-05-19T01:32:30.027688  / # #

    2023-05-19T01:32:30.128356  export SHELL=3D/bin/sh

    2023-05-19T01:32:30.128575  #

    2023-05-19T01:32:30.229095  / # export SHELL=3D/bin/sh. /lava-10382540/=
environment

    2023-05-19T01:32:30.229307  =


    2023-05-19T01:32:30.329845  / # . /lava-10382540/environment/lava-10382=
540/bin/lava-test-runner /lava-10382540/1

    2023-05-19T01:32:30.330191  =


    2023-05-19T01:32:30.334784  / # /lava-10382540/bin/lava-test-runner /la=
va-10382540/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d3b133387a97e02e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-=
kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-=
kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d3b133387a97e02e8=
615
        failing since 4 days (last pass: v6.4-rc1-260-g4cffd190aeed9, first=
 fail: v6.4-rc2-254-g9c207991d387d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf459c5b2ce6c82e8643

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466cf459c5b2ce6c82e8648
        failing since 51 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:21:57.361952  <8>[   11.246650] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382234_1.4.2.3.1>

    2023-05-19T01:21:57.466166  / # #

    2023-05-19T01:21:57.566851  export SHELL=3D/bin/sh

    2023-05-19T01:21:57.567049  #

    2023-05-19T01:21:57.667543  / # export SHELL=3D/bin/sh. /lava-10382234/=
environment

    2023-05-19T01:21:57.667739  =


    2023-05-19T01:21:57.768378  / # . /lava-10382234/environment/lava-10382=
234/bin/lava-test-runner /lava-10382234/1

    2023-05-19T01:21:57.769469  =


    2023-05-19T01:21:57.774736  / # /lava-10382234/bin/lava-test-runner /la=
va-10382234/1

    2023-05-19T01:21:57.780902  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1b684a29e1b902e8638

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d1b784a29e1b902e863d
        failing since 51 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-19T01:32:15.828489  <8>[   11.743593] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382538_1.4.2.3.1>

    2023-05-19T01:32:15.933438  / # #

    2023-05-19T01:32:16.034228  export SHELL=3D/bin/sh

    2023-05-19T01:32:16.034478  #

    2023-05-19T01:32:16.135086  / # export SHELL=3D/bin/sh. /lava-10382538/=
environment

    2023-05-19T01:32:16.135342  =


    2023-05-19T01:32:16.235950  / # . /lava-10382538/environment/lava-10382=
538/bin/lava-test-runner /lava-10382538/1

    2023-05-19T01:32:16.236353  =


    2023-05-19T01:32:16.240829  / # /lava-10382538/bin/lava-test-runner /la=
va-10382538/1

    2023-05-19T01:32:16.247323  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf60d813e844392e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466cf60d813e844392e8=
5eb
        failing since 114 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf593694deb7c12e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466cf593694deb7c12e8=
600
        failing since 100 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d4c57f6141baa62e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d4c57f6141baa62e8=
5fd
        failing since 10 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d655a8c9683d532e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d655a8c9683d532e8=
63b
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf4e7cb6f5f09c2e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466cf4e7cb6f5f09c2e8=
611
        failing since 100 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d4aec52f7d09ac2e8620

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d4aec52f7d09ac2e8=
621
        failing since 10 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d646c8f15b93c12e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d646c8f15b93c12e8=
5f4
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d280d6ee1c260f2e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d280d6ee1c260f2e8=
63b
        failing since 100 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d11d647b6f52fd2e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d11d647b6f52fd2e8=
608
        new failure (last pass: v6.4-rc2-426-gdec469ae11955) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d6b57471b850592e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d6b57471b850592e8=
5fe
        failing since 154 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d5b2ef762fcc492e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d5b2ef762fcc492e8=
5ef
        failing since 154 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf5e3694deb7c12e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466cf5e3694deb7c12e8=
613
        failing since 100 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d3e2ccabecab7c2e85ee

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d3e2ccabeca=
b7c2e8645
        failing since 10 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-19T01:41:22.311363  at virtual address 0000000000000008

    2023-05-19T01:41:22.313704  kern  :alert : Mem abort info:

    2023-05-19T01:41:22.318240  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-19T01:41:22.324297  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-19T01:41:22.326986  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-19T01:41:22.330547  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-19T01:41:22.336072  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-19T01:41:22.338548  kern  :alert : Data abort info:

    2023-05-19T01:41:22.342869  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-19T01:41:22.346230  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d3e2ccabeca=
b7c2e8646
        failing since 10 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-19T01:41:22.306329  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   18.587211] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d5646faf570aa62e8632

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d5646faf570=
aa62e8689
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-19T01:48:00.226794  fo:

    2023-05-19T01:48:00.231105  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-19T01:48:00.237697  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-19T01:48:00.240736  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-19T01:48:00.243919  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-19T01:48:00.249928  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-19T01:48:00.253255  kern  :alert : Data abort info:

    2023-05-19T01:48:00.257422  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-19T01:48:00.260589  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d5646faf570=
aa62e868a
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-19T01:48:00.214204  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-19T01:48:00.226083  kern  :alert : Mem abort in<8>[   20.319615=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6466cfcd4818a2ff632e8669

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466cfce4818a2f=
f632e8670
        failing since 21 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-19T01:24:13.323403  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-19T01:24:13.324700  kern  :emerg : Code: 97fe9d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-19T01:24:13.335066  <8>[   21.702446] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-19T01:24:13.335429  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466cfce4818a2f=
f632e8671
        failing since 21 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-19T01:24:13.296872  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-19T01:24:13.298372  kern  :alert : Mem abort info:
    2023-05-19T01:24:13.298744  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-19T01:24:13.300410  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-19T01:24:13.301996  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-19T01:24:13.302350  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-19T01:24:13.303507  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-19T01:24:13.304996  kern  :alert : Data abort info:
    2023-05-19T01:24:13.305349  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-19T01:24:13.306411  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d15ebb38c56fa22e8610

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d15ebb38c56=
fa22e8617
        failing since 10 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-19T01:30:53.445527  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-19T01:30:53.446975  kern  :emerg : Code: 97fe6910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-19T01:30:53.456272  <8>[   19.327197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-19T01:30:53.456654  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d15ebb38c56=
fa22e8618
        failing since 10 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-19T01:30:53.421221  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-19T01:30:53.422304  kern  :alert : Mem abort info:
    2023-05-19T01:30:53.422676  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-19T01:30:53.423593  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-19T01:30:53.424649  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-19T01:30:53.424998  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-19T01:30:53.425817  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-19T01:30:53.426790  kern  :alert : Data abort info:
    2023-05-19T01:30:53.427137  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-19T01:30:53.428167  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d1fec0fd1468972e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d1fec0fd1468972e8=
5f6
        failing since 21 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/6466d41acc54779a422e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6466d41acc54779a422e85eb
        failing since 7 days (last pass: v6.4-rc1-166-g16fe96af4971, first =
fail: v6.4-rc1-260-g4cffd190aeed9)

    2023-05-19T01:42:34.762113  <8>[   23.976190] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432058_1.5.2.4.1>
    2023-05-19T01:42:34.867737  / # #
    2023-05-19T01:42:34.969796  export SHELL=3D/bin/sh
    2023-05-19T01:42:34.970504  #
    2023-05-19T01:42:35.077571  / # export SHELL=3D/bin/sh. /lava-432058/en=
vironment
    2023-05-19T01:42:35.078274  =

    2023-05-19T01:42:35.187758  / # . /lava-432058/environment/lava-432058/=
bin/lava-test-runner /lava-432058/1
    2023-05-19T01:42:35.188735  =

    2023-05-19T01:42:35.193482  / # /lava-432058/bin/lava-test-runner /lava=
-432058/1
    2023-05-19T01:42:35.244841  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d41acc54779=
a422e85ed
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        2 lines

    2023-05-19T01:42:34.748254  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-19T01:42:34.749551  kern  :emerg : Code: 97fe8d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-19T01:42:34.760388  <8>[   23.973679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-19T01:42:34.760695  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d41acc54779=
a422e85ee
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        12 lines

    2023-05-19T01:42:34.720720  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-19T01:42:34.723116  kern  :alert : Mem abort info:
    2023-05-19T01:42:34.723446  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-19T01:42:34.725413  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-19T01:42:34.727662  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-19T01:42:34.727966  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-19T01:42:34.730032  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-19T01:42:34.732301  kern  :alert : Data abort info:
    2023-05-19T01:42:34.732599  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-19T01:42:34.734555  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d596e61cbd07602e8639

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d596e61cbd0=
7602e8640
        failing since 21 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-19T01:48:53.770248  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-19T01:48:53.771484  kern  :emerg : Code: 97fe5510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-19T01:48:53.784730  <8>[   19.332759] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-19T01:48:53.785105  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d596e61cbd0=
7602e8641
        failing since 21 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-19T01:48:53.742613  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-19T01:48:53.743736  kern  :alert : Mem abort info:
    2023-05-19T01:48:53.744096  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-19T01:48:53.744755  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-19T01:48:53.745987  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-19T01:48:53.746347  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-19T01:48:53.746964  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-19T01:48:53.748200  kern  :alert : Data abort info:
    2023-05-19T01:48:53.748576  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-19T01:48:53.749306  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d88f9175dbe03a2e85f7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d88f9175dbe=
03a2e85fe
        failing since 20 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-19T02:01:33.265599  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-19T02:01:33.265916  kern  :emerg : Code: 97fbcd10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-19T02:01:33.276479  <8>[   19.386186] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-19T02:01:33.276868  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d88f9175dbe=
03a2e85ff
        failing since 20 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-19T02:01:33.242568  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-19T02:01:33.246512  kern  :alert : Mem abort info:
    2023-05-19T02:01:33.246877  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-19T02:01:33.250791  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-19T02:01:33.254902  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-19T02:01:33.255264  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-19T02:01:33.259267  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-19T02:01:33.260263  kern  :alert : Data abort info:
    2023-05-19T02:01:33.260688  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-19T02:01:33.261291  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d00452a987bf072e864f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d00452a987b=
f072e8656
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-19T01:25:06.959241  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-19T01:25:06.959774  kern  :emerg : Code: 97ff3110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-19T01:25:06.960119  <8>[   23.739236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-19T01:25:06.960443  + set +x

    2023-05-19T01:25:06.960754  <8>[   23.741178] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382351_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d00452a987b=
f072e8657
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-19T01:25:06.933113  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-19T01:25:06.933675  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-19T01:25:06.934020  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078c60000

    2023-05-19T01:25:06.934343  kern  :alert : [0000000000000008] pgd=3D080=
0000078c66003, p4d=3D0800000078c66003, pud=3D0800000078c67003, pmd=3D000000=
0000000000

    2023-05-19T01:25:06.934650  <8>[   23.714745] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d5c3ef762fcc492e8656

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d5c3ef762fc=
c492e865d
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-19T01:49:31.439041  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-19T01:49:31.439132  kern  :emerg : Code: 97f92d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-19T01:49:31.439205  <8>[   23.010974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-19T01:49:31.439273  + set +x

    2023-05-19T01:49:31.439338  <8>[   23.013090] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382807_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d5c3ef762fc=
c492e865e
        failing since 22 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-19T01:49:31.413012  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-19T01:49:31.413103  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-19T01:49:31.413175  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078ccd000

    2023-05-19T01:49:31.413243  kern  :alert : [0000000000000008] pgd=3D080=
0000078cd4003, p4d=3D0800000078cd4003, pud=3D0800000078cd5003, pmd=3D000000=
0000000000

    2023-05-19T01:49:31.413315  <8>[   22.986809] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6466d8bb7a8bfc65932e8620

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6466d8bb7a8bfc6=
5932e8627
        failing since 20 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-19T02:02:16.110757  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-19T02:02:16.110936  kern  :emerg : Code: 97fc2110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-19T02:02:16.111040  <8>[   23.850003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-19T02:02:16.111128  + set +x

    2023-05-19T02:02:16.111212  <8>[   23.852068] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10382840_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6466d8bb7a8bfc6=
5932e8628
        failing since 20 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-19T02:02:16.065150  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-19T02:02:16.065344  kern  :alert : Mem abort info:

    2023-05-19T02:02:16.065450  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-19T02:02:16.065537  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-19T02:02:16.065628  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-19T02:02:16.065706  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-19T02:02:16.065793  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-19T02:02:16.065881  kern  :alert : Data abort info:

    2023-05-19T02:02:16.065962  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-19T02:02:16.066031  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6466cf3f9c5b2ce6c82e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466cf3f9c5b2ce6c82e8=
62a
        failing since 100 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d69a3f20e990a42e8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d69a3f20e990a42e8=
661
        new failure (last pass: v6.4-rc2-426-gdec469ae11955) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d9937a2efb40472e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d9937a2efb40472e8=
5fa
        new failure (last pass: v6.4-rc2-426-gdec469ae11955) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6466d4d64c21aad4d42e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc2-48=
6-gf467b1d198e27/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6466d4d64c21aad4d42e8=
5e7
        new failure (last pass: v6.4-rc2-366-g58bd8c0e6d69) =

 =20
