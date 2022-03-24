Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD894E5DBF
	for <lists+linux-next@lfdr.de>; Thu, 24 Mar 2022 05:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236927AbiCXEB5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Mar 2022 00:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiCXEB5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2022 00:01:57 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1D991ACA
        for <linux-next@vger.kernel.org>; Wed, 23 Mar 2022 21:00:25 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id w8so3494258pll.10
        for <linux-next@vger.kernel.org>; Wed, 23 Mar 2022 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PyIzgSqSekoXCDMZLkAB+fzs9A8Jy1zhUDwAs2HG0+w=;
        b=zgDGzOJeIOMVqt3vnDXDsfrGnNhFOPpJ8C0NZnwfR/ACJH3JoA87OumOSk5jSdYw7U
         Hr9HauByJeQHOBKydjUJSkixKIO48bT2qPxxdLpjJuLEwfYVeOvzOW/2SbDHE+5Tisxv
         eENUMIY3tvF5w7y9gDffvgiBNFm0qp0X8rqdCoypRwZKXtT0Tq0UnJwSFitNOQVr4phN
         HZEVteAq/RzBaCG7wOax6WFd/wiWyTMxc5v5UqtKJRI/cIS1ir14gKj/fa3JoNs6BU56
         t+F8VQ8oUNVtsH6s3Ddn4BRk+BdP5tf8CKKWY6W4i0pU/gsFww5e1meDGuL9c1Yy9/NB
         G4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PyIzgSqSekoXCDMZLkAB+fzs9A8Jy1zhUDwAs2HG0+w=;
        b=xnGZwj0mG5WmcAPO17Cq7Y2vxsS7JFgJFeZvnjfF0pX6xXDeaFsGd9OlQCsTxbtH4h
         1EfimDqNIns/2YhBsWtncPGRsW4Fpa98vcsMbsUuW/LAEmxaZPjceuHQxqnOUiE2w1m+
         YILYInPVdX8EON5dq4t22Wrh7Vir4K3UiSWUKT/DWgHalPskF8/ivBngOhUQSS+YJKFR
         Vpywh8jKNb+nyEQsFtU/RJu9v5oVF6lgblBVrgZ+kxcetrOHf3eTLdjiXt2g838MX+pH
         y/VJp+AUodc/4kxOPVXtpLdUn160wpH/H2IKWQroUT2i1Q3spoxCuGmt00C/GuIVkZ59
         lGsw==
X-Gm-Message-State: AOAM531tkiwV2DU/nkUU/G7ezuildkbsPRiKfBjsJP0JoL4yqoVQoEjw
        +bv5gvhQ1qW9p1fjvITJ8Izy/123PlewEEbv/ic=
X-Google-Smtp-Source: ABdhPJxTkoM5n5iJ8H6++jYAX/3VbncFIHauTh96x+KQ4RNkOMBN6hEY/uo85Bb+qfyHHQcS39hU5w==
X-Received: by 2002:a17:90a:1b65:b0:1c6:5bc5:99b4 with SMTP id q92-20020a17090a1b6500b001c65bc599b4mr15827250pjq.177.1648094424767;
        Wed, 23 Mar 2022 21:00:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t26-20020a056a00139a00b004faa13ba384sm1312355pfg.162.2022.03.23.21.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 21:00:24 -0700 (PDT)
Message-ID: <623becd8.1c69fb81.cf1e7.56dd@mx.google.com>
Date:   Wed, 23 Mar 2022 21:00:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-2918-g4fb3edfb1fc4
Subject: next/pending-fixes baseline: 252 runs,
 9 regressions (v5.17-2918-g4fb3edfb1fc4)
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

next/pending-fixes baseline: 252 runs, 9 regressions (v5.17-2918-g4fb3edfb1=
fc4)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+ima         | 1          =

d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig             | 1          =

d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig+c=
rypto             | 1          =

rk3399-gru-kevin          | arm64  | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-2918-g4fb3edfb1fc4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-2918-g4fb3edfb1fc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4fb3edfb1fc49830ba28ea3f7e02ef77c40e58d2 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb57eeb94e24e3277250a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb57eeb94e24e32772=
50b
        failing since 7 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb9a85eb3cc9d0d77257b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb9a85eb3cc9d0d772=
57c
        failing since 8 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb1d895f90b24b7772513

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+ima/gcc-10/lab-clabbe/baseline-d2500c=
c.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+ima/gcc-10/lab-clabbe/baseline-d2500c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb1d895f90b24b7772=
514
        new failure (last pass: v5.17-rc8-149-g382d8f4c46c1f) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb3a47a3483551d77251f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb3a57a3483551d772=
520
        new failure (last pass: v5.17-rc8-149-g382d8f4c46c1f) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb458e4170e1ce1772573

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d25=
00cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d25=
00cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb458e4170e1ce1772=
574
        new failure (last pass: v5.17-rc8-149-g382d8f4c46c1f) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb5d42a8bacfa2877255a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bb5d42a8bacfa28772=
55b
        failing since 7 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623bba2d71fbb339fb77250e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623bba2d71fbb339fb772=
50f
        failing since 8 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb5f7cab91b2a34772621

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/623=
bb5f7cab91b2a34772634
        failing since 1 day (last pass: v5.17-1379-g27610c0a0ca2, first fai=
l: v5.17-2275-g6bcc7ba3ca32)

    2022-03-24T00:05:55.083746  /lava-102327/1/../bin/lava-test-case
    2022-03-24T00:05:55.084036  <8>[   11.340764] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-24T00:05:55.084202  /lava-102327/1/../bin/lava-test-case
    2022-03-24T00:05:55.084362  <8>[   11.360554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-03-24T00:05:55.084505  /lava-102327/1/../bin/lava-test-case
    2022-03-24T00:05:55.084642  <8>[   11.381815] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-03-24T00:05:55.084777  /lava-102327/1/../bin/lava-test-case   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin          | arm64  | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/623bb9814dee8c614a77251d

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2918-=
g4fb3edfb1fc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/623bb9814dee8c614a77253f
        failing since 23 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-24T00:20:59.792386  <8>[   33.008754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-24T00:21:00.821996  /lava-5936167/1/../bin/lava-test-case
    2022-03-24T00:21:00.832977  <8>[   34.049646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
