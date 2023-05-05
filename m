Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B206F88ED
	for <lists+linux-next@lfdr.de>; Fri,  5 May 2023 20:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233191AbjEESsm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 May 2023 14:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjEESsl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 May 2023 14:48:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C991E9B3
        for <linux-next@vger.kernel.org>; Fri,  5 May 2023 11:48:34 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso15266925ad.2
        for <linux-next@vger.kernel.org>; Fri, 05 May 2023 11:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683312513; x=1685904513;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IR6xYcHI32/T/tdy3yK2VMHtxMnANBr6f0T2D7m6A9A=;
        b=B36CC83hpWDABgp4yCq5wK5Cl2TlbBtzg20ozdGPQIvPWVEJ9Fj3qFZmrd48E59EFT
         BR7JOjM6OaphvMBH/cOHxCVmXPWCqKhwVQWgUxnmuaJJ4iEvAyuZ+rav01EPqDZ6/Xn+
         MGzwyiyQ4A6qzrCZMJlv02tJHKYPkCEcu7ssbss44dLMqIesK1XDMRaED8Y41GPkhdXH
         YUBPVa3ebLCIZQ1ynt+GJMalV08WiLyW5m5SX+LsZ/Iy03W/LOOsGBQHFw3VyQRPvJyR
         ty+XkhuJuMb7WjTOQiIE0G93q+YpvpFfxESitlai04l5IqXGcAC1fHnFF1yoX7zODehF
         AfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312513; x=1685904513;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IR6xYcHI32/T/tdy3yK2VMHtxMnANBr6f0T2D7m6A9A=;
        b=WvqgMAnSWs43cbbe4KcXBtfcm4XR8++3mXBSwO/Bk8lo3Xi/wjImcyHyI19Dk3KYSI
         bnt0MfVE/7Q0fgeHr4nxLLbqM/ko7SZ1qp0RBH1ZK2TYEIev7qsEChpcYI6S0bSSKUV+
         Yg1B4M4JpIGcLt58cFdutwm14mNlZFmMwYl73atyCGe+EvccI1rJpMuCmo+EqRZ1XDwl
         X8c3+lUWOwZkavJpcXmIVvRMK/2F/w499zeo/2tOtAjIJp1FqbVRQQmbz2jgdA3MotFv
         FuWaolJbB0UGLwWQmjPkUtIl6u2g0tRu98S7p5kUocItef1isWp8FoneE2EmM4yjHM9n
         xZ8w==
X-Gm-Message-State: AC+VfDzaHSUDP9V04LIVnRn1gNymyMQxN7oZowPsFCCG+ijYyuNasxcU
        eKqFMzJqd4LU8ROJmX52FpnQoi0nyxiSX8nyThN7JA==
X-Google-Smtp-Source: ACHHUZ4wjP4XgZN0e9BUWrIOOIfgoQPyzsXsSLuN2C0J7MZ8O2Oi+Qw4/8n88YjsX0S3GvTbMynwkw==
X-Received: by 2002:a17:903:2656:b0:1ab:8f4:af2b with SMTP id je22-20020a170903265600b001ab08f4af2bmr2128824plb.38.1683312511801;
        Fri, 05 May 2023 11:48:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709029b8e00b001a687c505e6sm2098185plp.232.2023.05.05.11.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:48:31 -0700 (PDT)
Message-ID: <64554f7f.170a0220.99dca.3a2e@mx.google.com>
Date:   Fri, 05 May 2023 11:48:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-13708-gfd7527bf42e6
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 469 runs,
 74 regressions (v6.3-13708-gfd7527bf42e6)
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

next/pending-fixes baseline: 469 runs, 74 regressions (v6.3-13708-gfd7527bf=
42e6)

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
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-13708-gfd7527bf42e6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-13708-gfd7527bf42e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fd7527bf42e6c5ba90f02ffb2eee4222e76e297f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645517781af014c5582e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645517781af014c5582e8=
605
        failing since 207 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6455142d5b8133e67b2e8623

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6455142d5b8133e67b2e8628
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:35:12.297700  <8>[   10.752009] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206540_1.4.2.3.1>

    2023-05-05T14:35:12.297786  + set +x

    2023-05-05T14:35:12.402185  / # #

    2023-05-05T14:35:12.502815  export SHELL=3D/bin/sh

    2023-05-05T14:35:12.503063  #

    2023-05-05T14:35:12.603560  / # export SHELL=3D/bin/sh. /lava-10206540/=
environment

    2023-05-05T14:35:12.603849  =


    2023-05-05T14:35:12.704364  / # . /lava-10206540/environment/lava-10206=
540/bin/lava-test-runner /lava-10206540/1

    2023-05-05T14:35:12.704651  =


    2023-05-05T14:35:12.710271  / # /lava-10206540/bin/lava-test-runner /la=
va-10206540/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515e6bc275f08682e8638

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515e6bc275f08682e863d
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:23.251227  + set +x

    2023-05-05T14:42:23.258082  <8>[   17.882920] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206926_1.4.2.3.1>

    2023-05-05T14:42:23.362454  / # #

    2023-05-05T14:42:23.463075  export SHELL=3D/bin/sh

    2023-05-05T14:42:23.463300  #

    2023-05-05T14:42:23.564048  / # export SHELL=3D/bin/sh. /lava-10206926/=
environment

    2023-05-05T14:42:23.564949  =


    2023-05-05T14:42:23.666574  / # . /lava-10206926/environment/lava-10206=
926/bin/lava-test-runner /lava-10206926/1

    2023-05-05T14:42:23.668207  =


    2023-05-05T14:42:23.674184  / # /lava-10206926/bin/lava-test-runner /la=
va-10206926/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645519949adab55fb62e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519949adab55fb62e862a
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:18.002753  + set +x

    2023-05-05T14:58:18.009343  <8>[   10.531229] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207439_1.4.2.3.1>

    2023-05-05T14:58:18.110916  #

    2023-05-05T14:58:18.111145  =


    2023-05-05T14:58:18.211668  / # #export SHELL=3D/bin/sh

    2023-05-05T14:58:18.211859  =


    2023-05-05T14:58:18.312370  / # export SHELL=3D/bin/sh. /lava-10207439/=
environment

    2023-05-05T14:58:18.312560  =


    2023-05-05T14:58:18.413087  / # . /lava-10207439/environment/lava-10207=
439/bin/lava-test-runner /lava-10207439/1

    2023-05-05T14:58:18.413386  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6455142c5b8133e67b2e8618

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6455142c5b8133e67b2e861d
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:35:10.733104  + set +x<8>[    9.343539] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10206547_1.4.2.3.1>

    2023-05-05T14:35:10.733201  =


    2023-05-05T14:35:10.838005  / # #

    2023-05-05T14:35:10.938916  export SHELL=3D/bin/sh

    2023-05-05T14:35:10.939215  #

    2023-05-05T14:35:11.039849  / # export SHELL=3D/bin/sh. /lava-10206547/=
environment

    2023-05-05T14:35:11.040059  =


    2023-05-05T14:35:11.140618  / # . /lava-10206547/environment/lava-10206=
547/bin/lava-test-runner /lava-10206547/1

    2023-05-05T14:35:11.141070  =


    2023-05-05T14:35:11.145355  / # /lava-10206547/bin/lava-test-runner /la=
va-10206547/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/645515e2e40c2f37b32e860d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515e2e40c2f37b32e8612
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:28.864406  + <8>[   15.446220] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10206919_1.4.2.3.1>

    2023-05-05T14:42:28.867482  set +x

    2023-05-05T14:42:28.972406  /#

    2023-05-05T14:42:29.075244   # #export SHELL=3D/bin/sh

    2023-05-05T14:42:29.076031  =


    2023-05-05T14:42:29.177644  / # export SHELL=3D/bin/sh. /lava-10206919/=
environment

    2023-05-05T14:42:29.178491  =


    2023-05-05T14:42:29.280239  / # . /lava-10206919/environment/lava-10206=
919/bin/lava-test-runner /lava-10206919/1

    2023-05-05T14:42:29.281473  =


    2023-05-05T14:42:29.287111  / # /lava-10206919/bin/lava-test-runner /la=
va-10206919/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645515e2e40c2f3=
7b32e8614
        failing since 13 days (last pass: v6.3-rc7-210-g884374c58391a, firs=
t fail: v6.3-rc7-226-gf05a2341f2478)
        3 lines

    2023-05-05T14:42:28.836700  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-05T14:42:28.842831  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-05T14:42:28.850114  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-05T14:42:28.856192  <8>[   15.429531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6455199e149baff0352e8661

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6455199e149baff0352e8666
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:20.576214  + <8>[   11.170226] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10207443_1.4.2.3.1>

    2023-05-05T14:58:20.576692  set +x

    2023-05-05T14:58:20.685187  / # #

    2023-05-05T14:58:20.787508  export SHELL=3D/bin/sh

    2023-05-05T14:58:20.788256  #

    2023-05-05T14:58:20.889791  / # export SHELL=3D/bin/sh. /lava-10207443/=
environment

    2023-05-05T14:58:20.890717  =


    2023-05-05T14:58:20.992414  / # . /lava-10207443/environment/lava-10207=
443/bin/lava-test-runner /lava-10207443/1

    2023-05-05T14:58:20.993834  =


    2023-05-05T14:58:20.998758  / # /lava-10207443/bin/lava-test-runner /la=
va-10207443/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551421b13a90eb692e864a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551421b13a90eb692e864f
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:34:57.042973  <8>[   10.577639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206563_1.4.2.3.1>

    2023-05-05T14:34:57.046277  + set +x

    2023-05-05T14:34:57.148036  =


    2023-05-05T14:34:57.248661  / # #export SHELL=3D/bin/sh

    2023-05-05T14:34:57.248913  =


    2023-05-05T14:34:57.349475  / # export SHELL=3D/bin/sh. /lava-10206563/=
environment

    2023-05-05T14:34:57.349656  =


    2023-05-05T14:34:57.450203  / # . /lava-10206563/environment/lava-10206=
563/bin/lava-test-runner /lava-10206563/1

    2023-05-05T14:34:57.450490  =


    2023-05-05T14:34:57.455911  / # /lava-10206563/bin/lava-test-runner /la=
va-10206563/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515de3bea2ce2e12e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515de3bea2ce2e12e860c
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:22.631064  <8>[   14.057054] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206917_1.4.2.3.1>

    2023-05-05T14:42:22.634656  + set +x

    2023-05-05T14:42:22.738674  / # #

    2023-05-05T14:42:22.839396  export SHELL=3D/bin/sh

    2023-05-05T14:42:22.839606  #

    2023-05-05T14:42:22.940116  / # export SHELL=3D/bin/sh. /lava-10206917/=
environment

    2023-05-05T14:42:22.940346  =


    2023-05-05T14:42:23.040868  / # . /lava-10206917/environment/lava-10206=
917/bin/lava-test-runner /lava-10206917/1

    2023-05-05T14:42:23.041228  =


    2023-05-05T14:42:23.045948  / # /lava-10206917/bin/lava-test-runner /la=
va-10206917/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645519961e6e7ba5ca2e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519961e6e7ba5ca2e85fb
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:13.205269  <8>[   10.325335] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207429_1.4.2.3.1>

    2023-05-05T14:58:13.208541  + set +x

    2023-05-05T14:58:13.310000  =


    2023-05-05T14:58:13.410686  / # #export SHELL=3D/bin/sh

    2023-05-05T14:58:13.411429  =


    2023-05-05T14:58:13.512836  / # export SHELL=3D/bin/sh. /lava-10207429/=
environment

    2023-05-05T14:58:13.513183  =


    2023-05-05T14:58:13.614137  / # . /lava-10207429/environment/lava-10207=
429/bin/lava-test-runner /lava-10207429/1

    2023-05-05T14:58:13.615331  =


    2023-05-05T14:58:13.620677  / # /lava-10207429/bin/lava-test-runner /la=
va-10207429/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64551d088d4a3e18d42e85fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551d088d4a3e18d42e8600
        failing since 113 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-05T15:12:51.616061  / # #

    2023-05-05T15:12:51.718221  export SHELL=3D/bin/sh

    2023-05-05T15:12:51.718926  #

    2023-05-05T15:12:51.820295  / # export SHELL=3D/bin/sh. /lava-10207650/=
environment

    2023-05-05T15:12:51.821000  =


    2023-05-05T15:12:51.922495  / # . /lava-10207650/environment/lava-10207=
650/bin/lava-test-runner /lava-10207650/1

    2023-05-05T15:12:51.923569  =


    2023-05-05T15:12:51.940418  / # /lava-10207650/bin/lava-test-runner /la=
va-10207650/1

    2023-05-05T15:12:52.050125  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-05T15:12:52.050635  + cd /lava-10207650/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645516770f4c9ac1392e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645516770f4c9ac1392e8=
5fc
        failing since 67 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645516552c40cbecbb2e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645516552c40cbecbb2e8=
5fc
        failing since 103 days (last pass: v6.2-rc4-412-g665ddd640630, firs=
t fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64551657076c5a559d2e8624

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551657076c5a559d2e8629
        failing since 108 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-05T14:44:29.333755  <8>[   14.630196] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3553506_1.5.2.4.1>
    2023-05-05T14:44:29.445293  / # #
    2023-05-05T14:44:29.549423  export SHELL=3D/bin/sh
    2023-05-05T14:44:29.550713  #
    2023-05-05T14:44:29.653251  / # export SHELL=3D/bin/sh. /lava-3553506/e=
nvironment
    2023-05-05T14:44:29.654945  =

    2023-05-05T14:44:29.655875  / # . /lava-3553506/environment<3>[   14.91=
8810] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-05-05T14:44:29.759091  /lava-3553506/bin/lava-test-runner /lava-35=
53506/1
    2023-05-05T14:44:29.760909  =

    2023-05-05T14:44:29.765837  / # /lava-3553506/bin/lava-test-runner /lav=
a-3553506/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645517e43107ffe95e2e860b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645517e43107ffe95e2e8610
        failing since 108 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-05T14:50:52.921612  <8>[   16.898539] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3553537_1.5.2.4.1>
    2023-05-05T14:50:53.032743  / # #
    2023-05-05T14:50:53.137084  export SHELL=3D/bin/sh
    2023-05-05T14:50:53.138502  #
    2023-05-05T14:50:53.241217  / # export SHELL=3D/bin/sh. /lava-3553537/e=
nvironment
    2023-05-05T14:50:53.242555  =

    2023-05-05T14:50:53.345313  / # . /lava-3553537/environment/lava-355353=
7/bin/lava-test-runner /lava-3553537/1
    2023-05-05T14:50:53.347371  =

    2023-05-05T14:50:53.351847  / # /lava-3553537/bin/lava-test-runner /lav=
a-3553537/1
    2023-05-05T14:50:53.447107  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645519c6edf7ccca452e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519c6edf7ccca452e85f8
        failing since 108 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-05T14:58:54.010426  <8>[   21.331309] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3553597_1.5.2.4.1>
    2023-05-05T14:58:54.124693  / # #
    2023-05-05T14:58:54.229758  export SHELL=3D/bin/sh
    2023-05-05T14:58:54.231091  #
    2023-05-05T14:58:54.333513  / # export SHELL=3D/bin/sh. /lava-3553597/e=
nvironment
    2023-05-05T14:58:54.334722  =

    2023-05-05T14:58:54.437201  / # . /lava-3553597/environment/lava-355359=
7/bin/lava-test-runner /lava-3553597/1
    2023-05-05T14:58:54.439338  =

    2023-05-05T14:58:54.444598  / # /lava-3553597/bin/lava-test-runner /lav=
a-3553597/1
    2023-05-05T14:58:54.541884  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64551a3c97b2ac501f2e860e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551a3c97b2ac501f2e8613
        failing since 108 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-05T15:01:06.279417  <8>[   14.986182] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3553620_1.5.2.4.1>
    2023-05-05T15:01:06.385891  / # #
    2023-05-05T15:01:06.487353  export SHELL=3D/bin/sh
    2023-05-05T15:01:06.487710  #
    2023-05-05T15:01:06.588875  / # export SHELL=3D/bin/sh. /lava-3553620/e=
nvironment
    2023-05-05T15:01:06.589261  =

    2023-05-05T15:01:06.589437  / # <3>[   15.234033] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-05-05T15:01:06.690560  . /lava-3553620/environment/lava-3553620/bi=
n/lava-test-runner /lava-3553620/1
    2023-05-05T15:01:06.691110  =

    2023-05-05T15:01:06.696181  / # /lava-3553620/bin/lava-test-runner /lav=
a-3553620/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64551adc457926f20c2e85fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551adc457926f20c2e85ff
        failing since 108 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-05T15:03:31.406794  + set +x<8>[   14.066992] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3553637_1.5.2.4.1>
    2023-05-05T15:03:31.407641  =

    2023-05-05T15:03:31.518233  / # #
    2023-05-05T15:03:31.621836  export SHELL=3D/bin/sh
    2023-05-05T15:03:31.623189  <3>[   14.113587] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-05-05T15:03:31.623841  #
    2023-05-05T15:03:31.726480  / # export SHELL=3D/bin/sh. /lava-3553637/e=
nvironment
    2023-05-05T15:03:31.727659  =

    2023-05-05T15:03:31.830218  / # . /lava-3553637/environment/lava-355363=
7/bin/lava-test-runner /lava-3553637/1
    2023-05-05T15:03:31.832222   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6455140df4287098b42e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6455140df4287098b42e8606
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:34:47.132446  + set +x

    2023-05-05T14:34:47.138804  <8>[   13.738287] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206516_1.4.2.3.1>

    2023-05-05T14:34:47.243070  / # #

    2023-05-05T14:34:47.343663  export SHELL=3D/bin/sh

    2023-05-05T14:34:47.343851  #

    2023-05-05T14:34:47.444363  / # export SHELL=3D/bin/sh. /lava-10206516/=
environment

    2023-05-05T14:34:47.444536  =


    2023-05-05T14:34:47.545035  / # . /lava-10206516/environment/lava-10206=
516/bin/lava-test-runner /lava-10206516/1

    2023-05-05T14:34:47.545348  =


    2023-05-05T14:34:47.550208  / # /lava-10206516/bin/lava-test-runner /la=
va-10206516/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515efe40c2f37b32e8632

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515efe40c2f37b32e8637
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:29.710443  + set +x

    2023-05-05T14:42:29.716923  <8>[   21.141108] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206877_1.4.2.3.1>

    2023-05-05T14:42:29.823156  / # #

    2023-05-05T14:42:29.923721  export SHELL=3D/bin/sh

    2023-05-05T14:42:29.923890  #

    2023-05-05T14:42:30.024472  / # export SHELL=3D/bin/sh. /lava-10206877/=
environment

    2023-05-05T14:42:30.024657  =


    2023-05-05T14:42:30.125259  / # . /lava-10206877/environment/lava-10206=
877/bin/lava-test-runner /lava-10206877/1

    2023-05-05T14:42:30.125546  =


    2023-05-05T14:42:30.131002  / # /lava-10206877/bin/lava-test-runner /la=
va-10206877/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645519a5006dbf88892e864b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519a5006dbf88892e8650
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:29.727202  + set +x

    2023-05-05T14:58:29.733996  <8>[   11.785999] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207458_1.4.2.3.1>

    2023-05-05T14:58:29.842622  / # #

    2023-05-05T14:58:29.945089  export SHELL=3D/bin/sh

    2023-05-05T14:58:29.945858  #

    2023-05-05T14:58:30.047264  / # export SHELL=3D/bin/sh. /lava-10207458/=
environment

    2023-05-05T14:58:30.047783  =


    2023-05-05T14:58:30.148963  / # . /lava-10207458/environment/lava-10207=
458/bin/lava-test-runner /lava-10207458/1

    2023-05-05T14:58:30.150204  =


    2023-05-05T14:58:30.154998  / # /lava-10207458/bin/lava-test-runner /la=
va-10207458/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551407f4287098b42e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551407f4287098b42e85f0
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:34:33.496742  + set +x

    2023-05-05T14:34:33.503590  <8>[   10.403712] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206506_1.4.2.3.1>

    2023-05-05T14:34:33.605676  =


    2023-05-05T14:34:33.706221  / # #export SHELL=3D/bin/sh

    2023-05-05T14:34:33.706450  =


    2023-05-05T14:34:33.806983  / # export SHELL=3D/bin/sh. /lava-10206506/=
environment

    2023-05-05T14:34:33.807168  =


    2023-05-05T14:34:33.907657  / # . /lava-10206506/environment/lava-10206=
506/bin/lava-test-runner /lava-10206506/1

    2023-05-05T14:34:33.907976  =


    2023-05-05T14:34:33.913051  / # /lava-10206506/bin/lava-test-runner /la=
va-10206506/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515be422f1e6bda2e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515be422f1e6bda2e860c
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:41:53.332703  + set +x<8>[   14.501753] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10206921_1.4.2.3.1>

    2023-05-05T14:41:53.332812  =


    2023-05-05T14:41:53.437174  / # #

    2023-05-05T14:41:53.537755  export SHELL=3D/bin/sh

    2023-05-05T14:41:53.537981  #

    2023-05-05T14:41:53.638532  / # export SHELL=3D/bin/sh. /lava-10206921/=
environment

    2023-05-05T14:41:53.638738  =


    2023-05-05T14:41:53.739290  / # . /lava-10206921/environment/lava-10206=
921/bin/lava-test-runner /lava-10206921/1

    2023-05-05T14:41:53.739693  =


    2023-05-05T14:41:53.745016  / # /lava-10206921/bin/lava-test-runner /la=
va-10206921/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64551996f085b4ac282e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551996f085b4ac282e85eb
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:09.811410  <8>[   10.432131] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207474_1.4.2.3.1>

    2023-05-05T14:58:09.814624  + set +x

    2023-05-05T14:58:09.916184  =


    2023-05-05T14:58:10.016696  / # #export SHELL=3D/bin/sh

    2023-05-05T14:58:10.016951  =


    2023-05-05T14:58:10.117506  / # export SHELL=3D/bin/sh. /lava-10207474/=
environment

    2023-05-05T14:58:10.117737  =


    2023-05-05T14:58:10.218293  / # . /lava-10207474/environment/lava-10207=
474/bin/lava-test-runner /lava-10207474/1

    2023-05-05T14:58:10.218580  =


    2023-05-05T14:58:10.223503  / # /lava-10207474/bin/lava-test-runner /la=
va-10207474/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551428a8d2ad01b72e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551428a8d2ad01b72e85f6
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:35:00.120550  + <8>[   11.195459] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10206558_1.4.2.3.1>

    2023-05-05T14:35:00.120986  set +x

    2023-05-05T14:35:00.229257  / # #

    2023-05-05T14:35:00.331326  export SHELL=3D/bin/sh

    2023-05-05T14:35:00.332077  #

    2023-05-05T14:35:00.433545  / # export SHELL=3D/bin/sh. /lava-10206558/=
environment

    2023-05-05T14:35:00.434424  =


    2023-05-05T14:35:00.535931  / # . /lava-10206558/environment/lava-10206=
558/bin/lava-test-runner /lava-10206558/1

    2023-05-05T14:35:00.537297  =


    2023-05-05T14:35:00.541730  / # /lava-10206558/bin/lava-test-runner /la=
va-10206558/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515dd3bea2ce2e12e85fc

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515dd3bea2ce2e12e8601
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:23.061940  + set +x

    2023-05-05T14:42:23.068440  <8>[   11.959677] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206894_1.4.2.3.1>

    2023-05-05T14:42:23.172892  / # #

    2023-05-05T14:42:23.273555  export SHELL=3D/bin/sh

    2023-05-05T14:42:23.273739  #

    2023-05-05T14:42:23.374210  / # export SHELL=3D/bin/sh. /lava-10206894/=
environment

    2023-05-05T14:42:23.374440  =


    2023-05-05T14:42:23.475030  / # . /lava-10206894/environment/lava-10206=
894/bin/lava-test-runner /lava-10206894/1

    2023-05-05T14:42:23.475385  =


    2023-05-05T14:42:23.479748  / # /lava-10206894/bin/lava-test-runner /la=
va-10206894/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64551999149baff0352e8653

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551999149baff0352e8658
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:58:15.777924  + set<8>[    8.618424] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10207448_1.4.2.3.1>

    2023-05-05T14:58:15.778421   +x

    2023-05-05T14:58:15.886923  / # #

    2023-05-05T14:58:15.989466  export SHELL=3D/bin/sh

    2023-05-05T14:58:15.990282  #

    2023-05-05T14:58:16.091791  / # export SHELL=3D/bin/sh. /lava-10207448/=
environment

    2023-05-05T14:58:16.092756  =


    2023-05-05T14:58:16.194257  / # . /lava-10207448/environment/lava-10207=
448/bin/lava-test-runner /lava-10207448/1

    2023-05-05T14:58:16.195562  =


    2023-05-05T14:58:16.200416  / # /lava-10207448/bin/lava-test-runner /la=
va-10207448/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645519981e6e7ba5ca2e861b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519981e6e7ba5ca2e861e
        failing since 120 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-05T14:57:45.196659  + set<8>[   30.474307] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1214270_1.5.2.4.1>
    2023-05-05T14:57:45.196911   +x
    2023-05-05T14:57:45.302440  / # #
    2023-05-05T14:57:46.462708  export SHELL=3D/bin/sh
    2023-05-05T14:57:46.468415  #
    2023-05-05T14:57:48.016311  / # export SHELL=3D/bin/sh. /lava-1214270/e=
nvironment
    2023-05-05T14:57:48.022010  =

    2023-05-05T14:57:50.844171  / # . /lava-1214270/environment/lava-121427=
0/bin/lava-test-runner /lava-1214270/1
    2023-05-05T14:57:50.850246  =

    2023-05-05T14:57:50.855193  / # /lava-1214270/bin/lava-test-runner /lav=
a-1214270/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645519b4d54effe32f2e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519b4d54effe32f2e85fd
        failing since 120 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-05T14:58:36.484088  + set +x<8>[   56.364057] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1214272_1.5.2.4.1>
    2023-05-05T14:58:36.484266  =

    2023-05-05T14:58:36.591981  / # #
    2023-05-05T14:58:37.751418  export SHELL=3D/bin/sh
    2023-05-05T14:58:37.756848  #
    2023-05-05T14:58:37.757011  / # export SHELL=3D/bin/sh
    2023-05-05T14:58:39.303380  / # . /lava-1214272/environment
    2023-05-05T14:58:42.130845  /lava-1214272/bin/lava-test-runner /lava-12=
14272/1
    2023-05-05T14:58:42.136934  . /lava-1214272/environment
    2023-05-05T14:58:42.137226  / # /lava-1214272/bin/lava-test-runner /lav=
a-1214272/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551416f4287098b42e860e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551416f4287098b42e8613
        failing since 37 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:34:47.851465  <8>[   11.912653] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206510_1.4.2.3.1>

    2023-05-05T14:34:47.956003  / # #

    2023-05-05T14:34:48.056604  export SHELL=3D/bin/sh

    2023-05-05T14:34:48.056816  #

    2023-05-05T14:34:48.157333  / # export SHELL=3D/bin/sh. /lava-10206510/=
environment

    2023-05-05T14:34:48.157511  =


    2023-05-05T14:34:48.258051  / # . /lava-10206510/environment/lava-10206=
510/bin/lava-test-runner /lava-10206510/1

    2023-05-05T14:34:48.258420  =


    2023-05-05T14:34:48.262757  / # /lava-10206510/bin/lava-test-runner /la=
va-10206510/1

    2023-05-05T14:34:48.269361  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645515c1422f1e6bda2e8620

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645515c1422f1e6bda2e8625
        failing since 35 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-05T14:42:00.332335  + <8>[   13.463012] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10206896_1.4.2.3.1>

    2023-05-05T14:42:00.332430  set +x

    2023-05-05T14:42:00.437165  / # #

    2023-05-05T14:42:00.537775  export SHELL=3D/bin/sh

    2023-05-05T14:42:00.537983  #

    2023-05-05T14:42:00.638513  / # export SHELL=3D/bin/sh. /lava-10206896/=
environment

    2023-05-05T14:42:00.638735  =


    2023-05-05T14:42:00.739269  / # . /lava-10206896/environment/lava-10206=
896/bin/lava-test-runner /lava-10206896/1

    2023-05-05T14:42:00.739624  =


    2023-05-05T14:42:00.744833  / # /lava-10206896/bin/lava-test-runner /la=
va-10206896/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645519823f58cb216b2e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645519823f58cb216b2e8605
        failing since 38 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-05T14:57:59.184758  + <8>[   11.662948] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10207438_1.4.2.3.1>

    2023-05-05T14:57:59.184886  set +x

    2023-05-05T14:57:59.289516  / # #

    2023-05-05T14:57:59.390274  export SHELL=3D/bin/sh

    2023-05-05T14:57:59.390532  #

    2023-05-05T14:57:59.491113  / # export SHELL=3D/bin/sh. /lava-10207438/=
environment

    2023-05-05T14:57:59.491374  =


    2023-05-05T14:57:59.591974  / # . /lava-10207438/environment/lava-10207=
438/bin/lava-test-runner /lava-10207438/1

    2023-05-05T14:57:59.592366  =


    2023-05-05T14:57:59.597239  / # /lava-10207438/bin/lava-test-runner /la=
va-10207438/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551ed5c352a203572e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551ed5c352a203572e8=
5e7
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6455202a4465232a3a2e862e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455202a4465232a3a2e8=
62f
        failing since 74 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551ee0c352a203572e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551ee0c352a203572e8=
602
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645522809e33adf5302e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645522809e33adf5302e8=
606
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551ee2c352a203572e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551ee2c352a203572e8=
625
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6455202c161c2f89b92e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455202c161c2f89b92e8=
5ed
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f212d31d6c2f72e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551f212d31d6c2f72e8=
5ea
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551ee4c352a203572e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551ee4c352a203572e8=
628
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551a2788977b419a2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551a2788977b419a2e8=
5ea
        failing since 101 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6455193348b48505462e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455193348b48505462e8=
5f5
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645519f71ea0ec72412e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645519f71ea0ec72412e8=
603
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64551937fe725b35c12e86ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551937fe725b35c12e8=
6ac
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551a069aa88f10982e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551a069aa88f10982e8=
603
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64551da5046bd7749e2e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-linaro-l=
kft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-linaro-l=
kft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551da5046bd7749e2e8=
611
        new failure (last pass: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645522ce6664f1fd662e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-=
lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-=
lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645522ce6664f1fd662e8=
5f1
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64552ca8e4719f495a2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552ca8e4719f495a2e8=
5f3
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645516188ce88e45252e860e

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645516188ce88e4=
5252e8616
        new failure (last pass: v6.3-10703-gb3f869e79cdf)
        1 lines

    2023-05-05T14:43:13.098407  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00037488, epc =3D=3D 80201500, ra =3D=
=3D 802014f4
    2023-05-05T14:43:13.098630  =


    2023-05-05T14:43:13.131800  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-05-05T14:43:13.131980  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6455171305d4e1c3762e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455171305d4e1c3762e8=
5ff
        failing since 6 days (last pass: v6.3-8745-gc94d3163e00b, first fai=
l: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645518e5c6f0ae9ba42e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645518e5c6f0ae9ba42e8=
5e9
        failing since 141 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645517e042f565f06b2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645517e042f565f06b2e8=
5f9
        failing since 141 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645513e30391d947592e8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645513e30391d947592e863d
        failing since 93 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-05-05T14:33:57.303280  [   29.934388] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3553447_1.5.2.4.1>
    2023-05-05T14:33:57.407793  =

    2023-05-05T14:33:57.509811  / # #export SHELL=3D/bin/sh
    2023-05-05T14:33:57.510214  =

    2023-05-05T14:33:57.611565  / # export SHELL=3D/bin/sh. /lava-3553447/e=
nvironment
    2023-05-05T14:33:57.612294  =

    2023-05-05T14:33:57.714189  / # . /lava-3553447/environment/lava-355344=
7/bin/lava-test-runner /lava-3553447/1
    2023-05-05T14:33:57.715465  =

    2023-05-05T14:33:57.718724  / # /lava-3553447/bin/lava-test-runner /lav=
a-3553447/1
    2023-05-05T14:33:57.754654  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64551bdc20539042242e86ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551bdc20539042242e86b2
        failing since 93 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-05-05T15:07:58.048072  [   32.163811] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3553703_1.5.2.4.1>
    2023-05-05T15:07:58.152896  =

    2023-05-05T15:07:58.254487  / # #export SHELL=3D/bin/sh
    2023-05-05T15:07:58.255142  =

    2023-05-05T15:07:58.356901  / # export SHELL=3D/bin/sh. /lava-3553703/e=
nvironment
    2023-05-05T15:07:58.357357  =

    2023-05-05T15:07:58.458857  / # . /lava-3553703/environment/lava-355370=
3/bin/lava-test-runner /lava-3553703/1
    2023-05-05T15:07:58.460288  =

    2023-05-05T15:07:58.463755  / # /lava-3553703/bin/lava-test-runner /lav=
a-3553703/1
    2023-05-05T15:07:58.499613  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/6455184a472693c0462e85fb

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6455184a472693c=
0462e8652
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-05T14:52:34.370285  fo:

    2023-05-05T14:52:34.374096  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-05T14:52:34.379166  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T14:52:34.382129  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T14:52:34.386287  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T14:52:34.391549  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-05T14:52:34.394224  kern  :alert : Data abort info:

    2023-05-05T14:52:34.398777  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-05T14:52:34.408805  kern  :<8>[   18.648556] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6455184a472693c=
0462e8653
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-05T14:52:34.318333  <8>[   18.558507] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-05T14:52:34.356361  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-05T14:52:34.368181  kern  :alert : Mem abort in<8>[   18.603873=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551a3c054e3eaf5e2e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551a3c054e3eaf5e2e8=
601
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645513cf24931052c42e85eb

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645513cf2493105=
2c42e85f2
        failing since 8 days (last pass: v6.3-rc6-249-g122e82851461, first =
fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-05T14:33:40.482702  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-05T14:33:40.484004  kern  :emerg : Code: 97fe3d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-05T14:33:40.493886  <8>[   21.658173] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645513cf2493105=
2c42e85f3
        failing since 8 days (last pass: v6.3-rc6-249-g122e82851461, first =
fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-05T14:33:40.459198  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-05T14:33:40.460099  kern  :alert : Mem abort info:
    2023-05-05T14:33:40.460458  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-05T14:33:40.461075  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-05T14:33:40.461645  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-05T14:33:40.461961  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-05T14:33:40.462557  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-05T14:33:40.463126  kern  :alert : Data abort info:
    2023-05-05T14:33:40.463427  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-05T14:33:40.463987  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/64551bc820539042242e8683

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64551bc82053904=
2242e868a
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        2 lines

    2023-05-05T15:07:41.861325  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-05T15:07:41.862639  kern  :emerg : Code: 97feed10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-05T15:07:41.873302  <8>[   25.716217] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-05T15:07:41.873688  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64551bc82053904=
2242e868b
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        12 lines

    2023-05-05T15:07:41.803212  + KERNELCI_LAVA=3Dy /bin/sh /opt/kernelci/d=
mesg.sh
    2023-05-05T15:07:41.831428  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-05T15:07:41.832099  kern  :alert : Mem abort info:
    2023-05-05T15:07:41.832426  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-05T15:07:41.832834  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-05T15:07:41.833400  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-05T15:07:41.833722  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-05T15:07:41.834291  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-05T15:07:41.834866  kern  :alert : Data abort info:
    2023-05-05T15:07:41.835175  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551fed85858588692e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551fed85858588692e8=
5ec
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645513f21a63fcb4782e8677

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645513f21a63fcb=
4782e867e
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-05T14:34:14.295162  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-05T14:34:14.295243  kern  :emerg : Code: 97f87110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-05T14:34:14.295307  <8>[   23.955974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-05T14:34:14.295369  + set +x

    2023-05-05T14:34:14.295426  <8>[   23.958401] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10206493_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645513f21a63fcb=
4782e867f
        failing since 8 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-05T14:34:14.247915  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-05T14:34:14.247996  kern  :alert : Mem abort info:

    2023-05-05T14:34:14.248060  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-05T14:34:14.248119  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T14:34:14.248177  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T14:34:14.248232  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T14:34:14.248287  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-05T14:34:14.248341  kern  :alert : Data abort info:

    2023-05-05T14:34:14.248394  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-05T14:34:14.248446  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/64551beba6f2e6def42e8612

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64551beba6f2e6d=
ef42e8619
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd)
        2 lines

    2023-05-05T15:08:10.345796  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-05T15:08:10.346330  kern  :emerg : Code: 97fd8d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-05T15:08:10.346672  <8>[   24.644208] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-05T15:08:10.346994  + set +x

    2023-05-05T15:08:10.347300  <8>[   24.646314] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207658_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64551beba6f2e6d=
ef42e861a
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd)
        12 lines

    2023-05-05T15:08:10.300610  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-05T15:08:10.301144  kern  :alert : Mem abort info:

    2023-05-05T15:08:10.301513  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-05T15:08:10.301833  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T15:08:10.302138  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T15:08:10.302433  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T15:08:10.302721  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-05T15:08:10.303008  kern  :alert : Data abort info:

    2023-05-05T15:08:10.303289  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-05T15:08:10.303569  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64551edbcc3346479e2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551edbcc3346479e2e8=
5ef
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645519f99aa88f10982e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645519f99aa88f10982e8=
5f8
        failing since 87 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64551996f085b4ac282e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551996f085b4ac282e8=
5f9
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645515a562130a56052e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645515a562130a56052e8=
5f2
        new failure (last pass: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64551cdc31686cbf3c2e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551cdc31686cbf3c2e8=
60a
        new failure (last pass: v6.2-6789-g74c3b2e0a611) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645514d379896202012e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645514d379896202012e8=
5e9
        new failure (last pass: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645514d479896202012e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-13708-=
gfd7527bf42e6/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645514d479896202012e8=
5ef
        failing since 7 days (last pass: v6.3-5614-gbe56a31d3d65, first fai=
l: v6.3-8745-gc94d3163e00b) =

 =20
