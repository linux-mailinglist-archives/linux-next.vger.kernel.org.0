Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19647720073
	for <lists+linux-next@lfdr.de>; Fri,  2 Jun 2023 13:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjFBLef (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Jun 2023 07:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjFBLee (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2023 07:34:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FEF18D
        for <linux-next@vger.kernel.org>; Fri,  2 Jun 2023 04:34:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b075e13a5eso16958395ad.3
        for <linux-next@vger.kernel.org>; Fri, 02 Jun 2023 04:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685705668; x=1688297668;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cu87PPB60NTtP4XDPo7ja/wCH/KR+i7UPNQ0LWQj47Q=;
        b=bAXRWLPfYPiRDWdtqFqR7zduMeIqj+BNp37cl4hFZJVHMj/qCutCTb+nfEt1D1TRkx
         Ov2544XMrpoAE4Zp7DLavSev8aTqRWh5JJokM8V+vSiC01DdlWDzocIhEOktHQtNHAuV
         AlMBBZQUSI1Cn0n7GKL+aY7+d1jbF8HfIgrsHv87dvI5DvCtDzC4MceOCIiM5EOrN9AQ
         vXTDjiZPFfus3bCZcGl+Vmmh76CiUYz3pa1h2ifQJwSKcATewzJg59RrRbv75ep01J7Y
         2UJqWg5GL5snoBA1hRHpzmx/GMCiP5JouzPKxPbYFyX37zYDdMc+j9ZmJnU5C+ST/aTj
         3GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685705668; x=1688297668;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu87PPB60NTtP4XDPo7ja/wCH/KR+i7UPNQ0LWQj47Q=;
        b=T7wd+prbAyfNVs5rSHMoK7AbqwJX2SzPemlVLCcmc3TCnstk0aAM8hd/5KjGiVFaWH
         mCJ48s78XwX+WzEjmJTUqMtfnq1bHHYXKLagyML96DeqKsZGTY48XqHR7oaj3uLHGn++
         RsKKnPYVc9HoKcqscz95SAOR8PSWwZWcwilbfpCds67dg/UCjD/PcCohDyr4Fl7cRelG
         SnC3YFachax8z4kHacG5lo3pPyz9SDasPPUlhvAg/zmHHNRy8kkiqBzfARds6TsL/2Gb
         gzrMEcj9sPcQfRl0iZNko4I39RCsaKVX1oovaUycGvmszO9Rj/GiyZqkSK+8ZX9yShCh
         dK6A==
X-Gm-Message-State: AC+VfDxqvW3qDjV71Qal48/p5KhMcUGMLQkzqTJ92jS8OaG4oDEbUqUI
        gNM6Ob1d8gsmZOmTT3+Gs9a1ND++59gGdBSV/InAlw==
X-Google-Smtp-Source: ACHHUZ7yx0luXEy3c/nSRaaSNeUPok4ZCPjMklurfMiKyljm2OcfePqHspT8YwzVB6XF8J/PjSIMZg==
X-Received: by 2002:a17:902:8306:b0:1b1:b111:dfe8 with SMTP id bd6-20020a170902830600b001b1b111dfe8mr1928750plb.66.1685705666998;
        Fri, 02 Jun 2023 04:34:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903244300b001ac937171e4sm1128097pls.254.2023.06.02.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:34:26 -0700 (PDT)
Message-ID: <6479d3c2.170a0220.ebbd8.1bda@mx.google.com>
Date:   Fri, 02 Jun 2023 04:34:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-rc4-407-g4cdb5de9397d
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 697 runs,
 73 regressions (v6.4-rc4-407-g4cdb5de9397d)
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

next/pending-fixes baseline: 697 runs, 73 regressions (v6.4-rc4-407-g4cdb5d=
e9397d)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc4-407-g4cdb5de9397d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc4-407-g4cdb5de9397d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4cdb5de9397ded8c13f16ec4d0d341c6e6b64016 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bc49b04af50aef5de6a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4799bc49b04af50aef5de7d
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b)

    2023-06-02T07:35:13.457855  /usr/bin/tpm2_getcap

    2023-06-02T07:35:23.675623  /lava-10559738/1/../bin/lava-test-case

    2023-06-02T07:35:23.682987  <8>[   21.792339] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d0815e9c33527f5de37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799d0815e9c33527f5d=
e38
        failing since 235 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bd6cb86746e3af5de53

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bd6cb86746e3af5de5c
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:31.386975  <8>[   10.708969] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10559759_1.4.2.3.1>

    2023-06-02T07:35:31.390020  + set +x

    2023-06-02T07:35:31.494523  / # #

    2023-06-02T07:35:31.595168  export SHELL=3D/bin/sh

    2023-06-02T07:35:31.595397  #

    2023-06-02T07:35:31.695995  / # export SHELL=3D/bin/sh. /lava-10559759/=
environment

    2023-06-02T07:35:31.696292  =


    2023-06-02T07:35:31.796881  / # . /lava-10559759/environment/lava-10559=
759/bin/lava-test-runner /lava-10559759/1

    2023-06-02T07:35:31.797174  =


    2023-06-02T07:35:31.803373  / # /lava-10559759/bin/lava-test-runner /la=
va-10559759/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799defaf60cc8bd6f5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799defaf60cc8bd6f5de2e
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:27.065767  <8>[   10.382837] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560049_1.4.2.3.1>

    2023-06-02T07:44:27.068953  + set +x

    2023-06-02T07:44:27.173588  / # #

    2023-06-02T07:44:27.274240  export SHELL=3D/bin/sh

    2023-06-02T07:44:27.274436  #

    2023-06-02T07:44:27.374945  / # export SHELL=3D/bin/sh. /lava-10560049/=
environment

    2023-06-02T07:44:27.375144  =


    2023-06-02T07:44:27.475667  / # . /lava-10560049/environment/lava-10560=
049/bin/lava-test-runner /lava-10560049/1

    2023-06-02T07:44:27.475938  =


    2023-06-02T07:44:27.481455  / # /lava-10560049/bin/lava-test-runner /la=
va-10560049/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0845a21333c67f5de3f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a0845a21333c67f5de48
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T07:55:20.564302  + set +x

    2023-06-02T07:55:20.570390  <8>[   17.240191] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560240_1.4.2.3.1>

    2023-06-02T07:55:20.679457  / # #

    2023-06-02T07:55:20.781586  export SHELL=3D/bin/sh

    2023-06-02T07:55:20.782265  #

    2023-06-02T07:55:20.883561  / # export SHELL=3D/bin/sh. /lava-10560240/=
environment

    2023-06-02T07:55:20.884414  =


    2023-06-02T07:55:20.986045  / # . /lava-10560240/environment/lava-10560=
240/bin/lava-test-runner /lava-10560240/1

    2023-06-02T07:55:20.987454  =


    2023-06-02T07:55:20.993050  / # /lava-10560240/bin/lava-test-runner /la=
va-10560240/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bc69b04af50aef5dea3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bc69b04af50aef5deac
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:28.941443  + set<8>[   11.430701] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10559741_1.4.2.3.1>

    2023-06-02T07:35:28.941526   +x

    2023-06-02T07:35:29.045452  / # #

    2023-06-02T07:35:29.146056  export SHELL=3D/bin/sh

    2023-06-02T07:35:29.146198  #

    2023-06-02T07:35:29.246734  / # export SHELL=3D/bin/sh. /lava-10559741/=
environment

    2023-06-02T07:35:29.246872  =


    2023-06-02T07:35:29.347455  / # . /lava-10559741/environment/lava-10559=
741/bin/lava-test-runner /lava-10559741/1

    2023-06-02T07:35:29.347712  =


    2023-06-02T07:35:29.352746  / # /lava-10559741/bin/lava-test-runner /la=
va-10559741/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799dfa00a7c40897f5de52

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799dfa00a7c40897f5de5b
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:32.597625  + <8>[   11.915718] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10559992_1.4.2.3.1>

    2023-06-02T07:44:32.597709  set +x

    2023-06-02T07:44:32.701601  / # #

    2023-06-02T07:44:32.802348  export SHELL=3D/bin/sh

    2023-06-02T07:44:32.802505  #

    2023-06-02T07:44:32.903296  / # export SHELL=3D/bin/sh. /lava-10559992/=
environment

    2023-06-02T07:44:32.904056  =


    2023-06-02T07:44:33.005524  / # . /lava-10559992/environment/lava-10559=
992/bin/lava-test-runner /lava-10559992/1

    2023-06-02T07:44:33.006614  =


    2023-06-02T07:44:33.012174  / # /lava-10559992/bin/lava-test-runner /la=
va-10559992/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6479a1917bcd7e95e6f5de32

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6479a1917bcd7e9=
5e6f5de35
        failing since 23 days (last pass: v6.4-rc1-141-gb95366eba58e, first=
 fail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-06-02T08:00:10.689674  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a1917bcd7e95e6f5de3b
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T08:00:10.706386  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector<8>[   13.430475] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-06-02T08:00:10.706878  =


    2023-06-02T08:00:10.709553  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-02T08:00:10.716434  <8>[   13.441147] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560222_1.4.2.3.1>

    2023-06-02T08:00:10.716905  + set +x

    2023-06-02T08:00:10.824346  / # #

    2023-06-02T08:00:10.926397  export SHELL=3D/bin/sh

    2023-06-02T08:00:10.926583  #

    2023-06-02T08:00:11.027120  / # export SHELL=3D/bin/sh. /lava-10560222/=
environment

    2023-06-02T08:00:11.027409  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bc79b04af50aef5deae

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bc79b04af50aef5deb7
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:14.580980  <8>[    9.989644] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10559764_1.4.2.3.1>

    2023-06-02T07:35:14.584194  + set +x

    2023-06-02T07:35:14.685499  #

    2023-06-02T07:35:14.685835  =


    2023-06-02T07:35:14.786475  / # #export SHELL=3D/bin/sh

    2023-06-02T07:35:14.786692  =


    2023-06-02T07:35:14.887250  / # export SHELL=3D/bin/sh. /lava-10559764/=
environment

    2023-06-02T07:35:14.887497  =


    2023-06-02T07:35:14.988146  / # . /lava-10559764/environment/lava-10559=
764/bin/lava-test-runner /lava-10559764/1

    2023-06-02T07:35:14.988496  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799df500a7c40897f5de26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799df500a7c40897f5de2f
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:28.940715  <8>[   10.082136] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10559979_1.4.2.3.1>

    2023-06-02T07:44:28.944403  + set +x

    2023-06-02T07:44:29.050047  =


    2023-06-02T07:44:29.151714  / # #export SHELL=3D/bin/sh

    2023-06-02T07:44:29.152435  =


    2023-06-02T07:44:29.253849  / # export SHELL=3D/bin/sh. /lava-10559979/=
environment

    2023-06-02T07:44:29.254683  =


    2023-06-02T07:44:29.356142  / # . /lava-10559979/environment/lava-10559=
979/bin/lava-test-runner /lava-10559979/1

    2023-06-02T07:44:29.357554  =


    2023-06-02T07:44:29.362847  / # /lava-10559979/bin/lava-test-runner /la=
va-10559979/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0829f8a83732af5de2b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a0829f8a83732af5de34
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T07:55:12.013766  <8>[   16.951879] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560210_1.4.2.3.1>

    2023-06-02T07:55:12.017568  + set +x

    2023-06-02T07:55:12.118880  #

    2023-06-02T07:55:12.119279  =


    2023-06-02T07:55:12.219929  / # #export SHELL=3D/bin/sh

    2023-06-02T07:55:12.220134  =


    2023-06-02T07:55:12.320670  / # export SHELL=3D/bin/sh. /lava-10560210/=
environment

    2023-06-02T07:55:12.321420  =


    2023-06-02T07:55:12.423034  / # . /lava-10560210/environment/lava-10560=
210/bin/lava-test-runner /lava-10560210/1

    2023-06-02T07:55:12.424279  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64799f505a4d0aceaef5e095

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799f505a4d0aceaef5e09e
        failing since 141 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-02T07:50:16.096082  / # #

    2023-06-02T07:50:16.198243  export SHELL=3D/bin/sh

    2023-06-02T07:50:16.198949  #

    2023-06-02T07:50:16.300352  / # export SHELL=3D/bin/sh. /lava-10559966/=
environment

    2023-06-02T07:50:16.301077  =


    2023-06-02T07:50:16.402529  / # . /lava-10559966/environment/lava-10559=
966/bin/lava-test-runner /lava-10559966/1

    2023-06-02T07:50:16.403607  =


    2023-06-02T07:50:16.420412  / # /lava-10559966/bin/lava-test-runner /la=
va-10559966/1

    2023-06-02T07:50:16.529287  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-02T07:50:16.529821  + cd /lava-10559966/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799e21cf5c334e53f5de45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799e21cf5c334e53f5d=
e46
        failing since 95 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799f8e6d7cc1ec05f5dec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799f8e6d7cc1ec05f5d=
ec6
        failing since 131 days (last pass: v6.2-rc4-412-g665ddd640630, firs=
t fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64799dc337281037edf5debd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799dc337281037edf5d=
ebe
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64799c207dd3daa77ef5de72

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799c207dd3daa77ef5de7b
        failing since 135 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-02T07:36:42.608645  <8>[   15.194568] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636032_1.5.2.4.1>
    2023-06-02T07:36:42.720550  / # #
    2023-06-02T07:36:42.824509  export SHELL=3D/bin/sh
    2023-06-02T07:36:42.825568  #
    2023-06-02T07:36:42.826150  / # <3>[   15.330258] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-06-02T07:36:42.928672  export SHELL=3D/bin/sh. /lava-3636032/envir=
onment
    2023-06-02T07:36:42.929894  =

    2023-06-02T07:36:43.032692  / # . /lava-3636032/environment/lava-363603=
2/bin/lava-test-runner /lava-3636032/1
    2023-06-02T07:36:43.034594  =

    2023-06-02T07:36:43.039466  / # /lava-3636032/bin/lava-test-runner /lav=
a-3636032/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64799cac72741d0ca8f5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799cac72741d0ca8f5de2e
        failing since 135 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-02T07:39:06.331498  <8>[   21.106910] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636065_1.5.2.4.1>
    2023-06-02T07:39:06.443740  / # #
    2023-06-02T07:39:06.547547  export SHELL=3D/bin/sh
    2023-06-02T07:39:06.548729  #
    2023-06-02T07:39:06.651146  / # export SHELL=3D/bin/sh. /lava-3636065/e=
nvironment
    2023-06-02T07:39:06.652259  =

    2023-06-02T07:39:06.754782  / # . /lava-3636065/environment/lava-363606=
5/bin/lava-test-runner /lava-3636065/1
    2023-06-02T07:39:06.756634  =

    2023-06-02T07:39:06.762001  / # /lava-3636065/bin/lava-test-runner /lav=
a-3636065/1
    2023-06-02T07:39:06.860860  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d37670bf7b710f5deb5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799d37670bf7b710f5debe
        failing since 135 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-02T07:41:30.657730  <8>[   16.888745] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636095_1.5.2.4.1>
    2023-06-02T07:41:30.767201  / # #
    2023-06-02T07:41:30.870542  export SHELL=3D/bin/sh
    2023-06-02T07:41:30.871440  #
    2023-06-02T07:41:30.973185  / # export SHELL=3D/bin/sh. /lava-3636095/e=
nvironment
    2023-06-02T07:41:30.974488  =

    2023-06-02T07:41:31.076733  / # . /lava-3636095/environment/lava-363609=
5/bin/lava-test-runner /lava-3636095/1
    2023-06-02T07:41:31.078231  =

    2023-06-02T07:41:31.082858  / # /lava-3636095/bin/lava-test-runner /lav=
a-3636095/1
    2023-06-02T07:41:31.156721  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799daf7f68ec0b52f5de80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799daf7f68ec0b52f5de89
        failing since 135 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-02T07:43:33.297193  <8>[   14.691890] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636111_1.5.2.4.1>
    2023-06-02T07:43:33.407572  / # #
    2023-06-02T07:43:33.511345  export SHELL=3D/bin/sh
    2023-06-02T07:43:33.512251  #
    2023-06-02T07:43:33.614334  / # export SHELL=3D/bin/sh. /lava-3636111/e=
nvironment
    2023-06-02T07:43:33.615526  =

    2023-06-02T07:43:33.717827  / # . /lava-3636111/environment/lava-363611=
1/bin/lava-test-runner /lava-3636111/1
    2023-06-02T07:43:33.719341  =

    2023-06-02T07:43:33.724180  / # /lava-3636111/bin/lava-test-runner /lav=
a-3636111/1
    2023-06-02T07:43:33.767351  <3>[   15.163743] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64799e3af55379fecef5de7f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799e3af55379fecef5de88
        failing since 135 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-02T07:45:37.427748  <8>[   15.355369] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636138_1.5.2.4.1>
    2023-06-02T07:45:37.539501  / # #
    2023-06-02T07:45:37.642727  export SHELL=3D/bin/sh
    2023-06-02T07:45:37.643575  #
    2023-06-02T07:45:37.745549  / # export SHELL=3D/bin/sh. /lava-3636138/e=
nvironment
    2023-06-02T07:45:37.746687  =

    2023-06-02T07:45:37.848780  / # . /lava-3636138/environment/lava-363613=
8/bin/lava-test-runner /lava-3636138/1
    2023-06-02T07:45:37.850435  =

    2023-06-02T07:45:37.855219  / # /lava-3636138/bin/lava-test-runner /lav=
a-3636138/1
    2023-06-02T07:45:37.882196  <3>[   15.810157] Bluetooth: hci0: command =
0xfc18 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1f0dcdaaec5e8f5de41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1f0dcdaaec5e8f5d=
e42
        failing since 158 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799baa9b04af50aef5de2c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799baa9b04af50aef5de35
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:00.677064  + set +x

    2023-06-02T07:35:00.683351  <8>[   34.082101] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10559762_1.4.2.3.1>

    2023-06-02T07:35:00.788259  / # #

    2023-06-02T07:35:00.888937  export SHELL=3D/bin/sh

    2023-06-02T07:35:00.889125  #

    2023-06-02T07:35:00.989687  / # export SHELL=3D/bin/sh. /lava-10559762/=
environment

    2023-06-02T07:35:00.989893  =


    2023-06-02T07:35:01.090453  / # . /lava-10559762/environment/lava-10559=
762/bin/lava-test-runner /lava-10559762/1

    2023-06-02T07:35:01.090859  =


    2023-06-02T07:35:01.095575  / # /lava-10559762/bin/lava-test-runner /la=
va-10559762/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799dec283e11afc4f5de97

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799dec283e11afc4f5dea0
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:21.602648  + set +x

    2023-06-02T07:44:21.609227  <8>[   10.420984] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560029_1.4.2.3.1>

    2023-06-02T07:44:21.713861  / # #

    2023-06-02T07:44:21.814592  export SHELL=3D/bin/sh

    2023-06-02T07:44:21.814854  #

    2023-06-02T07:44:21.915345  / # export SHELL=3D/bin/sh. /lava-10560029/=
environment

    2023-06-02T07:44:21.915542  =


    2023-06-02T07:44:22.016024  / # . /lava-10560029/environment/lava-10560=
029/bin/lava-test-runner /lava-10560029/1

    2023-06-02T07:44:22.016317  =


    2023-06-02T07:44:22.021018  / # /lava-10560029/bin/lava-test-runner /la=
va-10560029/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a31f9a94e9b307f5dea9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a31f9a94e9b307f5deb2
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T08:06:32.960142  + set +x

    2023-06-02T08:06:32.966663  <8>[   17.399325] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560263_1.4.2.3.1>

    2023-06-02T08:06:33.072972  / # #

    2023-06-02T08:06:33.173656  export SHELL=3D/bin/sh

    2023-06-02T08:06:33.173868  #

    2023-06-02T08:06:33.274398  / # export SHELL=3D/bin/sh. /lava-10560263/=
environment

    2023-06-02T08:06:33.274642  =


    2023-06-02T08:06:33.375192  / # . /lava-10560263/environment/lava-10560=
263/bin/lava-test-runner /lava-10560263/1

    2023-06-02T08:06:33.375497  =


    2023-06-02T08:06:33.380113  / # /lava-10560263/bin/lava-test-runner /la=
va-10560263/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bb09b04af50aef5de37

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bb09b04af50aef5de40
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:00.218369  <8>[   10.655776] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10559743_1.4.2.3.1>

    2023-06-02T07:35:00.221395  + set +x

    2023-06-02T07:35:00.322487  #

    2023-06-02T07:35:00.423249  / # #export SHELL=3D/bin/sh

    2023-06-02T07:35:00.423411  =


    2023-06-02T07:35:00.523868  / # export SHELL=3D/bin/sh. /lava-10559743/=
environment

    2023-06-02T07:35:00.524080  =


    2023-06-02T07:35:00.624602  / # . /lava-10559743/environment/lava-10559=
743/bin/lava-test-runner /lava-10559743/1

    2023-06-02T07:35:00.624865  =


    2023-06-02T07:35:00.629656  / # /lava-10559743/bin/lava-test-runner /la=
va-10559743/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799de6eb8c53c443f5de55

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799de6eb8c53c443f5de5e
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:25.692213  + set +x

    2023-06-02T07:44:25.698786  <8>[   10.359590] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560038_1.4.2.3.1>

    2023-06-02T07:44:25.803478  / # #

    2023-06-02T07:44:25.904346  export SHELL=3D/bin/sh

    2023-06-02T07:44:25.904625  #

    2023-06-02T07:44:26.005251  / # export SHELL=3D/bin/sh. /lava-10560038/=
environment

    2023-06-02T07:44:26.005532  =


    2023-06-02T07:44:26.106174  / # . /lava-10560038/environment/lava-10560=
038/bin/lava-test-runner /lava-10560038/1

    2023-06-02T07:44:26.106620  =


    2023-06-02T07:44:26.111754  / # /lava-10560038/bin/lava-test-runner /la=
va-10560038/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a21e219803b566f5de44

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a21e219803b566f5de4d
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T08:02:32.249339  + set +x

    2023-06-02T08:02:32.255798  <8>[   14.879430] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560243_1.4.2.3.1>

    2023-06-02T08:02:32.360864  / # #

    2023-06-02T08:02:32.461805  export SHELL=3D/bin/sh

    2023-06-02T08:02:32.462132  #

    2023-06-02T08:02:32.562789  / # export SHELL=3D/bin/sh. /lava-10560243/=
environment

    2023-06-02T08:02:32.563118  =


    2023-06-02T08:02:32.663790  / # . /lava-10560243/environment/lava-10560=
243/bin/lava-test-runner /lava-10560243/1

    2023-06-02T08:02:32.664280  =


    2023-06-02T08:02:32.669651  / # /lava-10560243/bin/lava-test-runner /la=
va-10560243/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bc8235d76d560f5de27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bc8235d76d560f5de30
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:21.573883  + set<8>[   11.553682] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10559734_1.4.2.3.1>

    2023-06-02T07:35:21.573970   +x

    2023-06-02T07:35:21.678246  / # #

    2023-06-02T07:35:21.778889  export SHELL=3D/bin/sh

    2023-06-02T07:35:21.779085  #

    2023-06-02T07:35:21.879637  / # export SHELL=3D/bin/sh. /lava-10559734/=
environment

    2023-06-02T07:35:21.879846  =


    2023-06-02T07:35:21.980373  / # . /lava-10559734/environment/lava-10559=
734/bin/lava-test-runner /lava-10559734/1

    2023-06-02T07:35:21.980665  =


    2023-06-02T07:35:21.985285  / # /lava-10559734/bin/lava-test-runner /la=
va-10559734/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799df900a7c40897f5de3e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799df900a7c40897f5de47
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:42.170374  + set +x<8>[   11.538661] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10560013_1.4.2.3.1>

    2023-06-02T07:44:42.170458  =


    2023-06-02T07:44:42.274755  / # #

    2023-06-02T07:44:42.375458  export SHELL=3D/bin/sh

    2023-06-02T07:44:42.375693  #

    2023-06-02T07:44:42.476238  / # export SHELL=3D/bin/sh. /lava-10560013/=
environment

    2023-06-02T07:44:42.476507  =


    2023-06-02T07:44:42.577051  / # . /lava-10560013/environment/lava-10560=
013/bin/lava-test-runner /lava-10560013/1

    2023-06-02T07:44:42.577442  =


    2023-06-02T07:44:42.582417  / # /lava-10560013/bin/lava-test-runner /la=
va-10560013/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0777ca0f4802cf5de65

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a0777ca0f4802cf5de6e
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T07:55:15.220493  + set +x

    2023-06-02T07:55:15.227318  <8>[   14.388765] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10560244_1.4.2.3.1>

    2023-06-02T07:55:15.331544  / # #

    2023-06-02T07:55:15.432073  export SHELL=3D/bin/sh

    2023-06-02T07:55:15.432230  #

    2023-06-02T07:55:15.532690  / # export SHELL=3D/bin/sh. /lava-10560244/=
environment

    2023-06-02T07:55:15.532890  =


    2023-06-02T07:55:15.633436  / # . /lava-10560244/environment/lava-10560=
244/bin/lava-test-runner /lava-10560244/1

    2023-06-02T07:55:15.633705  =


    2023-06-02T07:55:15.638601  / # /lava-10560244/bin/lava-test-runner /la=
va-10560244/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bf81cbda05efdf5de8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bf81cbda05efdf5de93
        failing since 123 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-02T07:36:03.315224  + set +x
    2023-06-02T07:36:03.315544  [   13.190278] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965098_1.5.2.3.1>
    2023-06-02T07:36:03.422728  / # #
    2023-06-02T07:36:03.524495  export SHELL=3D/bin/sh
    2023-06-02T07:36:03.525038  #
    2023-06-02T07:36:03.626248  / # export SHELL=3D/bin/sh. /lava-965098/en=
vironment
    2023-06-02T07:36:03.626710  =

    2023-06-02T07:36:03.728029  / # . /lava-965098/environment/lava-965098/=
bin/lava-test-runner /lava-965098/1
    2023-06-02T07:36:03.728610  =

    2023-06-02T07:36:03.732208  / # /lava-965098/bin/lava-test-runner /lava=
-965098/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64799c488354b522f7f5de4c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799c488354b522f7f5de55
        failing since 123 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-02T07:37:21.958730  + set +x
    2023-06-02T07:37:21.958899  [   14.382624] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965105_1.5.2.3.1>
    2023-06-02T07:37:22.065873  / # #
    2023-06-02T07:37:22.167485  export SHELL=3D/bin/sh
    2023-06-02T07:37:22.168007  #
    2023-06-02T07:37:22.269570  / # export SHELL=3D/bin/sh. /lava-965105/en=
vironment
    2023-06-02T07:37:22.270032  =

    2023-06-02T07:37:22.371270  / # . /lava-965105/environment/lava-965105/=
bin/lava-test-runner /lava-965105/1
    2023-06-02T07:37:22.371809  =

    2023-06-02T07:37:22.375384  / # /lava-965105/bin/lava-test-runner /lava=
-965105/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d24670bf7b710f5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799d24670bf7b710f5de2e
        failing since 123 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-02T07:40:59.300984  + set +x
    2023-06-02T07:40:59.301169  [   12.138320] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965110_1.5.2.3.1>
    2023-06-02T07:40:59.407804  / # #
    2023-06-02T07:40:59.509384  export SHELL=3D/bin/sh
    2023-06-02T07:40:59.509829  #
    2023-06-02T07:40:59.611027  / # export SHELL=3D/bin/sh. /lava-965110/en=
vironment
    2023-06-02T07:40:59.611481  =

    2023-06-02T07:40:59.712730  / # . /lava-965110/environment/lava-965110/=
bin/lava-test-runner /lava-965110/1
    2023-06-02T07:40:59.713322  =

    2023-06-02T07:40:59.716394  / # /lava-965110/bin/lava-test-runner /lava=
-965110/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d74433eed3f69f5de5c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799d74433eed3f69f5de65
        failing since 123 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-02T07:42:20.335330  + set +x
    2023-06-02T07:42:20.335547  [   12.855787] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965120_1.5.2.3.1>
    2023-06-02T07:42:20.443446  / # #
    2023-06-02T07:42:20.544993  export SHELL=3D/bin/sh
    2023-06-02T07:42:20.545498  #
    2023-06-02T07:42:20.646896  / # export SHELL=3D/bin/sh. /lava-965120/en=
vironment
    2023-06-02T07:42:20.647433  =

    2023-06-02T07:42:20.748864  / # . /lava-965120/environment/lava-965120/=
bin/lava-test-runner /lava-965120/1
    2023-06-02T07:42:20.749629  =

    2023-06-02T07:42:20.752727  / # /lava-965120/bin/lava-test-runner /lava=
-965120/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64799dc437281037edf5dec0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799dc437281037edf5dec9
        failing since 123 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-02T07:43:41.813816  + set +x
    2023-06-02T07:43:41.813996  [   13.153606] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965130_1.5.2.3.1>
    2023-06-02T07:43:41.921879  / # #
    2023-06-02T07:43:42.023596  export SHELL=3D/bin/sh
    2023-06-02T07:43:42.024177  #
    2023-06-02T07:43:42.125427  / # export SHELL=3D/bin/sh. /lava-965130/en=
vironment
    2023-06-02T07:43:42.125918  =

    2023-06-02T07:43:42.227250  / # . /lava-965130/environment/lava-965130/=
bin/lava-test-runner /lava-965130/1
    2023-06-02T07:43:42.227875  =

    2023-06-02T07:43:42.231283  / # /lava-965130/bin/lava-test-runner /lava=
-965130/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64799db07f68ec0b52f5de8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799db07f68ec0b52f5de94
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b)

    2023-06-02T07:43:21.116541  + set[   15.138539] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 965129_1.5.2.3.1>
    2023-06-02T07:43:21.116780   +x
    2023-06-02T07:43:21.222740  / # #
    2023-06-02T07:43:21.324573  export SHELL=3D/bin/sh
    2023-06-02T07:43:21.325136  #
    2023-06-02T07:43:21.426436  / # export SHELL=3D/bin/sh. /lava-965129/en=
vironment
    2023-06-02T07:43:21.426907  =

    2023-06-02T07:43:21.528236  / # . /lava-965129/environment/lava-965129/=
bin/lava-test-runner /lava-965129/1
    2023-06-02T07:43:21.529186  =

    2023-06-02T07:43:21.531867  / # /lava-965129/bin/lava-test-runner /lava=
-965129/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0411e7f0543c3f5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a0411e7f0543c3f5d=
e2a
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64799e3cf55379fecef5de93

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799e3cf55379fecef5de9c
        failing since 36 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-02T07:45:51.558469  <8>[    7.700197] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636169_1.5.2.4.1>
    2023-06-02T07:45:51.669374  / # #
    2023-06-02T07:45:51.773457  export SHELL=3D/bin/sh
    2023-06-02T07:45:51.774664  #
    2023-06-02T07:45:51.877229  / # export SHELL=3D/bin/sh. /lava-3636169/e=
nvironment
    2023-06-02T07:45:51.878365  =

    2023-06-02T07:45:51.981030  / # . /lava-3636169/environment/lava-363616=
9/bin/lava-test-runner /lava-3636169/1
    2023-06-02T07:45:51.983042  =

    2023-06-02T07:45:52.024158  / # /lava-3636169/bin/lava-test-runner /lav=
a-3636169/1
    2023-06-02T07:45:52.035459  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1ad6cc17afd59f5de43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a1ad6cc17afd59f5de4c
        failing since 22 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.4-rc1-166-g16fe96af4971)

    2023-06-02T08:00:36.146203  <8>[   11.410569] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636301_1.5.2.4.1>
    2023-06-02T08:00:36.269135  / # #
    2023-06-02T08:00:36.372914  export SHELL=3D/bin/sh
    2023-06-02T08:00:36.373882  #
    2023-06-02T08:00:36.476099  / # export SHELL=3D/bin/sh. /lava-3636301/e=
nvironment
    2023-06-02T08:00:36.477235  =

    2023-06-02T08:00:36.579644  / # . /lava-3636301/environment/lava-363630=
1/bin/lava-test-runner /lava-3636301/1
    2023-06-02T08:00:36.581101  =

    2023-06-02T08:00:36.594135  / # /lava-3636301/bin/lava-test-runner /lav=
a-3636301/1
    2023-06-02T08:00:36.639346  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a20fa6af3a6cb8f5de62

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a20fa6af3a6cb8f5de6b
        failing since 34 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-02T08:02:05.674521  <8>[    7.649176] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3636309_1.5.2.4.1>
    2023-06-02T08:02:05.777038  / # #
    2023-06-02T08:02:05.880083  export SHELL=3D/bin/sh
    2023-06-02T08:02:05.880946  #
    2023-06-02T08:02:05.982836  / # export SHELL=3D/bin/sh. /lava-3636309/e=
nvironment
    2023-06-02T08:02:05.983697  =

    2023-06-02T08:02:06.085803  / # . /lava-3636309/environment/lava-363630=
9/bin/lava-test-runner /lava-3636309/1
    2023-06-02T08:02:06.087621  =

    2023-06-02T08:02:06.106911  / # /lava-3636309/bin/lava-test-runner /lav=
a-3636309/1
    2023-06-02T08:02:06.147241  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/64799e117ab2134daff5de6a

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799e117ab2134daff5de71
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d)

    2023-06-02T07:44:55.098156  / # #
    2023-06-02T07:44:55.200654  export SHELL=3D/bin/sh
    2023-06-02T07:44:55.201336  #
    2023-06-02T07:44:55.303215  / # export SHELL=3D/bin/sh. /lava-348587/en=
vironment
    2023-06-02T07:44:55.304029  =

    2023-06-02T07:44:55.406054  / # . /lava-348587/environment/lava-348587/=
bin/lava-test-runner /lava-348587/1
    2023-06-02T07:44:55.407394  =

    2023-06-02T07:44:55.424461  / # /lava-348587/bin/lava-test-runner /lava=
-348587/1
    2023-06-02T07:44:55.479376  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-02T07:44:55.479880  + cd /lava-348587/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/647=
99e117ab2134daff5de81
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d)

    2023-06-02T07:44:57.871442  /lava-348587/1/../bin/lava-test-case
    2023-06-02T07:44:57.871920  <8>[   17.998242] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-02T07:44:57.872262  /lava-348587/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64799bc9235d76d560f5de35

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799bc9235d76d560f5de3e
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:35:17.193697  + set<8>[   12.739976] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10559732_1.4.2.3.1>

    2023-06-02T07:35:17.193791   +x

    2023-06-02T07:35:17.298319  / # #

    2023-06-02T07:35:17.399022  export SHELL=3D/bin/sh

    2023-06-02T07:35:17.399221  #

    2023-06-02T07:35:17.499771  / # export SHELL=3D/bin/sh. /lava-10559732/=
environment

    2023-06-02T07:35:17.499976  =


    2023-06-02T07:35:17.600515  / # . /lava-10559732/environment/lava-10559=
732/bin/lava-test-runner /lava-10559732/1

    2023-06-02T07:35:17.600832  =


    2023-06-02T07:35:17.605055  / # /lava-10559732/bin/lava-test-runner /la=
va-10559732/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64799de6eb8c53c443f5de4a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64799de6eb8c53c443f5de53
        failing since 65 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-02T07:44:28.518026  + set<8>[   11.615608] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10559983_1.4.2.3.1>

    2023-06-02T07:44:28.518124   +x

    2023-06-02T07:44:28.622802  / # #

    2023-06-02T07:44:28.723468  export SHELL=3D/bin/sh

    2023-06-02T07:44:28.723678  #

    2023-06-02T07:44:28.824218  / # export SHELL=3D/bin/sh. /lava-10559983/=
environment

    2023-06-02T07:44:28.824442  =


    2023-06-02T07:44:28.924981  / # . /lava-10559983/environment/lava-10559=
983/bin/lava-test-runner /lava-10559983/1

    2023-06-02T07:44:28.925355  =


    2023-06-02T07:44:28.930016  / # /lava-10559983/bin/lava-test-runner /la=
va-10559983/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0657ca0f4802cf5de31

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a0657ca0f4802cf5de3a
        failing since 63 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-02T07:54:55.250450  + <8>[   14.572389] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10560229_1.4.2.3.1>

    2023-06-02T07:54:55.253732  set +x

    2023-06-02T07:54:55.358400  / # #

    2023-06-02T07:54:55.460763  export SHELL=3D/bin/sh

    2023-06-02T07:54:55.461488  #

    2023-06-02T07:54:55.562854  / # export SHELL=3D/bin/sh. /lava-10560229/=
environment

    2023-06-02T07:54:55.563590  =


    2023-06-02T07:54:55.665266  / # . /lava-10560229/environment/lava-10560=
229/bin/lava-test-runner /lava-10560229/1

    2023-06-02T07:54:55.666572  =


    2023-06-02T07:54:55.671643  / # /lava-10560229/bin/lava-test-runner /la=
va-10560229/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d235e2790dd18f5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799d235e2790dd18f5d=
e2a
        failing since 36 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d9d9b4628f5d2f5de83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799d9d9b4628f5d2f5d=
e84
        failing since 22 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1d359a77928a4f5de45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1d359a77928a4f5d=
e46
        failing since 22 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0411e7f0543c3f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a0411e7f0543c3f5d=
e27
        failing since 129 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d1e8c09bfa5ecf5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799d1e8c09bfa5ecf5d=
e30
        failing since 24 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a179d6a7550357f5de28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a179d6a7550357f5d=
e29
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a41306c900e4b7f5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a41306c900e4b7f5d=
e30
        failing since 36 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64799d0571e97d5347f5de5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799d0571e97d5347f5d=
e5d
        failing since 24 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a03c6ebda74265f5de33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a03c6ebda74265f5d=
e34
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a41106c900e4b7f5de2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a41106c900e4b7f5d=
e2d
        failing since 36 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a566756058c2b5f5de2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a566756058c2b5f5d=
e2c
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a156659c754810f5de61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a156659c754810f5d=
e62
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a161a4c0b19a57f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a161a4c0b19a57f5d=
e26
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1e4c0431ee98bf5de38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1e4c0431ee98bf5d=
e39
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1b28f01e01d88f5de58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1b28f01e01d88f5d=
e59
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1fa9d287626aaf5dec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1fa9d287626aaf5d=
ec7
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1d979302e435ef5de3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1d979302e435ef5d=
e3c
        new failure (last pass: v6.4-rc4-279-g33e2f287e32d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64799b17c0303f4058f5de3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799b17c0303f4058f5d=
e3d
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799f603d1fc9a517f5de2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799f603d1fc9a517f5d=
e2c
        failing since 169 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64799e34357a7292c3f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64799e34357a7292c3f5d=
e26
        failing since 168 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1f4954000d003f5de30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1f4954000d003f5d=
e31
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a24a33c9f76c7ff5de54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479a24a33c9f76c7ff5de5d
        failing since 21 days (last pass: v6.4-rc1-166-g16fe96af4971, first=
 fail: v6.4-rc1-260-g4cffd190aeed9)

    2023-06-02T08:03:09.651586  <8>[   25.796614] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 435742_1.5.2.4.1>
    2023-06-02T08:03:09.758360  / # #
    2023-06-02T08:03:09.860971  export SHELL=3D/bin/sh
    2023-06-02T08:03:09.861507  #
    2023-06-02T08:03:09.963026  / # export SHELL=3D/bin/sh. /lava-435742/en=
vironment
    2023-06-02T08:03:09.963627  =

    2023-06-02T08:03:10.065208  / # . /lava-435742/environment/lava-435742/=
bin/lava-test-runner /lava-435742/1
    2023-06-02T08:03:10.066118  =

    2023-06-02T08:03:10.070849  / # /lava-435742/bin/lava-test-runner /lava=
-435742/1
    2023-06-02T08:03:10.116797  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a0284cde3ffa86f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a0284cde3ffa86f5d=
e27
        failing since 115 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a324bd14124496f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a324bd14124496f5d=
e27
        failing since 10 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.4-rc3-246-g48bfaadff1906) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479a1c16195ea1087f5de8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479a1c16195ea1087f5d=
e8c
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647999a011b1122000f5de53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647999a011b1122000f5de5c
        failing since 91 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-06-02T07:25:56.700202  <8>[    9.848357] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3635973_1.5.2.4.1>
    2023-06-02T07:25:56.819693  / # #
    2023-06-02T07:25:56.925294  export SHELL=3D/bin/sh
    2023-06-02T07:25:56.926798  #
    2023-06-02T07:25:57.030177  / # export SHELL=3D/bin/sh. /lava-3635973/e=
nvironment
    2023-06-02T07:25:57.031761  =

    2023-06-02T07:25:57.135121  / # . /lava-3635973/environment/lava-363597=
3/bin/lava-test-runner /lava-3635973/1
    2023-06-02T07:25:57.137853  =

    2023-06-02T07:25:57.145315  / # /lava-3635973/bin/lava-test-runner /lav=
a-3635973/1
    2023-06-02T07:25:57.241263  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647999eb384d03df1bf5de32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc4-40=
7-g4cdb5de9397d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647999eb384d03df1bf5d=
e33
        new failure (last pass: v6.4-rc4-316-g2ef1da21bb4b) =

 =20
