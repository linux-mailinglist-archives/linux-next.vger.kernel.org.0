Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C001270D404
	for <lists+linux-next@lfdr.de>; Tue, 23 May 2023 08:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjEWGaV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 May 2023 02:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbjEWGaO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2023 02:30:14 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E616E120
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 23:30:09 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1afa6afcf4fso23339545ad.0
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684823409; x=1687415409;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YnipIcq2Nip53uMJ9MFUWbnrMn+Q+Mv8rRmZIroSyYk=;
        b=NjsqZbaDyhWOcnPXPqi9mbq7vdvKCoW+qbUAs3o6HHjd6tJshCLKyq7UBF1xyuTWtv
         kRoDQKOIzMB+gCxjK/S9gsHO1IDpI8MwGQC81JhwJPCBWUCaSi6tDWixqi3CkIZvp9bg
         l6oQYrXw7PKIm51N+Lpxem/hj8WZiA9V/r7CrlNYbB2VRP3sIN3qqodxWrngIlaPbmXs
         kJOIE5yJy6qg3aQymtQMUcHBBtvm12RzsYHwWnpU0V4hLrOTX39K1QbV7ydAW35mzrEU
         6Gv302FxWjwzipjfkiMUOItfy0qts5O9EObN79V1ht1uEVvRXluwsKRoK3vQpxhr8tzi
         mbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684823409; x=1687415409;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnipIcq2Nip53uMJ9MFUWbnrMn+Q+Mv8rRmZIroSyYk=;
        b=WBs9EHOX3vx34XW76VfsWAfTGF3SRVVau6k7haI0IM8yk7/9ZElSK6ddPxJpPabSTF
         WCVYQVwq9x9bwd7yOP/znO10bGpij1I90OwuTynV++AurGEYooON/gyk+oaOgyciHEbX
         AGq9nzj1YMwYastrf7tWobMORHL2prNE0p9XTcVXxVyBGP5S5VDHffKVDy22MhQ1TJi5
         MX4shQIQgFyODnHXORPOW3+4cRlwxLahYlC+w9pKMw8BrKUj+q+wNFcGPKHkJVxCX9wX
         jCiig8LKZfZ9/z5QLXKbyqnTnUkB/vHvzMtRvL01kk5tnGOGENtNoCxKwthZ6RP/hUJt
         FQ8g==
X-Gm-Message-State: AC+VfDwbE9PSSanWGAHA3ybB2JBdEbFStFgYtKFciuqqj62YgBHPxsDd
        IpogrkA602XEgaupByB456pxtrkkCoWbDgrL1FsAvw==
X-Google-Smtp-Source: ACHHUZ6w0CSqG/GxroUt7o9PRY9WgTgr+n1fqhuMLZUrVINSrr/0s4o/LpAg3PcdsZ+XWF/4QBCUXA==
X-Received: by 2002:a17:902:ce83:b0:1aa:d545:462e with SMTP id f3-20020a170902ce8300b001aad545462emr18059248plg.13.1684823407761;
        Mon, 22 May 2023 23:30:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j21-20020a170902c3d500b001ae6e270d8bsm5870384plj.131.2023.05.22.23.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 23:30:07 -0700 (PDT)
Message-ID: <646c5d6f.170a0220.ad9f5.aa5d@mx.google.com>
Date:   Mon, 22 May 2023 23:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc3-246-g48bfaadff1906
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 586 runs,
 74 regressions (v6.4-rc3-246-g48bfaadff1906)
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

next/pending-fixes baseline: 586 runs, 74 regressions (v6.4-rc3-246-g48bfaa=
dff1906)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

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

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

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

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc3-246-g48bfaadff1906/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc3-246-g48bfaadff1906
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      48bfaadff190661215048dec65019b6bd9dad4b2 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c3d36ec9eb5f14f2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c3d36ec9eb5f14f2e8=
5f3
        failing since 223 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c215bef9ea973272e864e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c215bef9ea973272e8653
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:26.285917  + set +x

    2023-05-23T02:13:26.292065  <8>[   10.705304] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420050_1.4.2.3.1>

    2023-05-23T02:13:26.395492  =


    2023-05-23T02:13:26.497463  / # #export SHELL=3D/bin/sh

    2023-05-23T02:13:26.497733  =


    2023-05-23T02:13:26.598317  / # export SHELL=3D/bin/sh. /lava-10420050/=
environment

    2023-05-23T02:13:26.598563  =


    2023-05-23T02:13:26.699159  / # . /lava-10420050/environment/lava-10420=
050/bin/lava-test-runner /lava-10420050/1

    2023-05-23T02:13:26.699547  =


    2023-05-23T02:13:26.705775  / # /lava-10420050/bin/lava-test-runner /la=
va-10420050/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c23280d51f23c092e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c23280d51f23c092e85f9
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:21:17.430251  + set +x

    2023-05-23T02:21:17.436709  <8>[   10.980343] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420222_1.4.2.3.1>

    2023-05-23T02:21:17.538566  #

    2023-05-23T02:21:17.538818  =


    2023-05-23T02:21:17.639490  / # #export SHELL=3D/bin/sh

    2023-05-23T02:21:17.639681  =


    2023-05-23T02:21:17.740207  / # export SHELL=3D/bin/sh. /lava-10420222/=
environment

    2023-05-23T02:21:17.740520  =


    2023-05-23T02:21:17.841204  / # . /lava-10420222/environment/lava-10420=
222/bin/lava-test-runner /lava-10420222/1

    2023-05-23T02:21:17.841578  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c215b6b6316dcd22e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c215b6b6316dcd22e8606
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:23.543506  + set<8>[   11.726908] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10420039_1.4.2.3.1>

    2023-05-23T02:13:23.543942   +x

    2023-05-23T02:13:23.651510  / # #

    2023-05-23T02:13:23.752375  export SHELL=3D/bin/sh

    2023-05-23T02:13:23.753072  #

    2023-05-23T02:13:23.854506  / # export SHELL=3D/bin/sh. /lava-10420039/=
environment

    2023-05-23T02:13:23.854722  =


    2023-05-23T02:13:23.955255  / # . /lava-10420039/environment/lava-10420=
039/bin/lava-test-runner /lava-10420039/1

    2023-05-23T02:13:23.955580  =


    2023-05-23T02:13:23.960280  / # /lava-10420039/bin/lava-test-runner /la=
va-10420039/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c232dbde55145bd2e862a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c232dbde55145bd2e862f
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:21:19.523062  + <8>[   11.358125] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10420217_1.4.2.3.1>

    2023-05-23T02:21:19.523137  set +x

    2023-05-23T02:21:19.626939  / # #

    2023-05-23T02:21:19.727572  export SHELL=3D/bin/sh

    2023-05-23T02:21:19.727742  #

    2023-05-23T02:21:19.828201  / # export SHELL=3D/bin/sh. /lava-10420217/=
environment

    2023-05-23T02:21:19.828399  =


    2023-05-23T02:21:19.928931  / # . /lava-10420217/environment/lava-10420=
217/bin/lava-test-runner /lava-10420217/1

    2023-05-23T02:21:19.929212  =


    2023-05-23T02:21:19.933980  / # /lava-10420217/bin/lava-test-runner /la=
va-10420217/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c214843460366ba2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c214843460366ba2e85eb
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:20.926370  <8>[   10.077287] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420055_1.4.2.3.1>

    2023-05-23T02:13:20.929626  + set +x

    2023-05-23T02:13:21.034124  #

    2023-05-23T02:13:21.034397  =


    2023-05-23T02:13:21.135157  / # #export SHELL=3D/bin/sh

    2023-05-23T02:13:21.135863  =


    2023-05-23T02:13:21.237363  / # export SHELL=3D/bin/sh. /lava-10420055/=
environment

    2023-05-23T02:13:21.238125  =


    2023-05-23T02:13:21.339651  / # . /lava-10420055/environment/lava-10420=
055/bin/lava-test-runner /lava-10420055/1

    2023-05-23T02:13:21.340787  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c232cf3e8b1e94d2e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c232cf3e8b1e94d2e85fc
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:21:16.236778  <8>[    8.669780] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420254_1.4.2.3.1>

    2023-05-23T02:21:16.240066  + set +x

    2023-05-23T02:21:16.343815  #

    2023-05-23T02:21:16.345095  =


    2023-05-23T02:21:16.447023  / # #export SHELL=3D/bin/sh

    2023-05-23T02:21:16.448086  =


    2023-05-23T02:21:16.549509  / # export SHELL=3D/bin/sh. /lava-10420254/=
environment

    2023-05-23T02:21:16.550230  =


    2023-05-23T02:21:16.651880  / # . /lava-10420254/environment/lava-10420=
254/bin/lava-test-runner /lava-10420254/1

    2023-05-23T02:21:16.652969  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/646c21430e26f92a762e8678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c21430e26f92a762e867d
        failing since 131 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-23T02:13:06.727690  / # #

    2023-05-23T02:13:06.828623  export SHELL=3D/bin/sh

    2023-05-23T02:13:06.829331  #

    2023-05-23T02:13:06.930744  / # export SHELL=3D/bin/sh. /lava-10419982/=
environment

    2023-05-23T02:13:06.931492  =


    2023-05-23T02:13:07.032932  / # . /lava-10419982/environment/lava-10419=
982/bin/lava-test-runner /lava-10419982/1

    2023-05-23T02:13:07.034126  =


    2023-05-23T02:13:07.035698  / # /lava-10419982/bin/lava-test-runner /la=
va-10419982/1

    2023-05-23T02:13:07.159880  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-23T02:13:07.160416  + cd /lava-10419982/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c20b766698547a42e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c20b766698547a42e8=
5ea
        failing since 85 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b70aea541184f2e867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b70aea541184f2e8=
67b
        failing since 147 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c21339711235c2c2e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c21339711235c2c2e85fc
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:00.450026  + set +x

    2023-05-23T02:13:00.456253  <8>[   10.142273] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10419990_1.4.2.3.1>

    2023-05-23T02:13:00.561311  / # #

    2023-05-23T02:13:00.662052  export SHELL=3D/bin/sh

    2023-05-23T02:13:00.662288  #

    2023-05-23T02:13:00.762836  / # export SHELL=3D/bin/sh. /lava-10419990/=
environment

    2023-05-23T02:13:00.763069  =


    2023-05-23T02:13:00.863625  / # . /lava-10419990/environment/lava-10419=
990/bin/lava-test-runner /lava-10419990/1

    2023-05-23T02:13:00.863916  =


    2023-05-23T02:13:00.868128  / # /lava-10419990/bin/lava-test-runner /la=
va-10419990/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2312aa53bd36f82e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c2312aa53bd36f82e861b
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:21:00.464763  + set +x

    2023-05-23T02:21:00.470938  <8>[   10.141085] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420240_1.4.2.3.1>

    2023-05-23T02:21:00.575729  / # #

    2023-05-23T02:21:00.676543  export SHELL=3D/bin/sh

    2023-05-23T02:21:00.676745  #

    2023-05-23T02:21:00.777250  / # export SHELL=3D/bin/sh. /lava-10420240/=
environment

    2023-05-23T02:21:00.777458  =


    2023-05-23T02:21:00.877968  / # . /lava-10420240/environment/lava-10420=
240/bin/lava-test-runner /lava-10420240/1

    2023-05-23T02:21:00.878343  =


    2023-05-23T02:21:00.883234  / # /lava-10420240/bin/lava-test-runner /la=
va-10420240/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2149eeef6fad432e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c2149eeef6fad432e85f9
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:06.899215  + set +x

    2023-05-23T02:13:06.905759  <8>[    9.721670] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420033_1.4.2.3.1>

    2023-05-23T02:13:07.007661  #

    2023-05-23T02:13:07.008000  =


    2023-05-23T02:13:07.108628  / # #export SHELL=3D/bin/sh

    2023-05-23T02:13:07.108843  =


    2023-05-23T02:13:07.209381  / # export SHELL=3D/bin/sh. /lava-10420033/=
environment

    2023-05-23T02:13:07.209610  =


    2023-05-23T02:13:07.310164  / # . /lava-10420033/environment/lava-10420=
033/bin/lava-test-runner /lava-10420033/1

    2023-05-23T02:13:07.310503  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2312be4b75b6fb2e85ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c2312be4b75b6fb2e85f4
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:20:57.082454  <8>[   10.720926] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420236_1.4.2.3.1>

    2023-05-23T02:20:57.086379  + set +x

    2023-05-23T02:20:57.193965  / # #

    2023-05-23T02:20:57.296776  export SHELL=3D/bin/sh

    2023-05-23T02:20:57.297849  #

    2023-05-23T02:20:57.399599  / # export SHELL=3D/bin/sh. /lava-10420236/=
environment

    2023-05-23T02:20:57.400523  =


    2023-05-23T02:20:57.502117  / # . /lava-10420236/environment/lava-10420=
236/bin/lava-test-runner /lava-10420236/1

    2023-05-23T02:20:57.503527  =


    2023-05-23T02:20:57.508867  / # /lava-10420236/bin/lava-test-runner /la=
va-10420236/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c214959a041eead2e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c214959a041eead2e861b
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:13:23.684720  + <8>[   10.981482] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10420044_1.4.2.3.1>

    2023-05-23T02:13:23.684814  set +x

    2023-05-23T02:13:23.788859  / # #

    2023-05-23T02:13:23.889553  export SHELL=3D/bin/sh

    2023-05-23T02:13:23.889750  #

    2023-05-23T02:13:23.990296  / # export SHELL=3D/bin/sh. /lava-10420044/=
environment

    2023-05-23T02:13:23.990485  =


    2023-05-23T02:13:24.091071  / # . /lava-10420044/environment/lava-10420=
044/bin/lava-test-runner /lava-10420044/1

    2023-05-23T02:13:24.091445  =


    2023-05-23T02:13:24.096049  / # /lava-10420044/bin/lava-test-runner /la=
va-10420044/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c23270d51f23c092e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c23270d51f23c092e85ed
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:21:08.108032  + set<8>[   11.417229] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10420241_1.4.2.3.1>

    2023-05-23T02:21:08.108182   +x

    2023-05-23T02:21:08.213080  / # #

    2023-05-23T02:21:08.315064  export SHELL=3D/bin/sh

    2023-05-23T02:21:08.315232  #

    2023-05-23T02:21:08.415718  / # export SHELL=3D/bin/sh. /lava-10420241/=
environment

    2023-05-23T02:21:08.416048  =


    2023-05-23T02:21:08.516894  / # . /lava-10420241/environment/lava-10420=
241/bin/lava-test-runner /lava-10420241/1

    2023-05-23T02:21:08.518064  =


    2023-05-23T02:21:08.522703  / # /lava-10420241/bin/lava-test-runner /la=
va-10420241/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c20b2d87af5cc582e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c20b2d87af5cc582e8623
        failing since 113 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-23T02:10:35.444598  + set +x
    2023-05-23T02:10:35.444772  [   12.863318] <LAVA_SIGNAL_ENDRUN 0_dmesg =
957165_1.5.2.3.1>
    2023-05-23T02:10:35.552069  / # #
    2023-05-23T02:10:35.653833  export SHELL=3D/bin/sh
    2023-05-23T02:10:35.654310  #
    2023-05-23T02:10:35.755653  / # export SHELL=3D/bin/sh. /lava-957165/en=
vironment
    2023-05-23T02:10:35.756141  =

    2023-05-23T02:10:35.857492  / # . /lava-957165/environment/lava-957165/=
bin/lava-test-runner /lava-957165/1
    2023-05-23T02:10:35.858131  =

    2023-05-23T02:10:35.861181  / # /lava-957165/bin/lava-test-runner /lava=
-957165/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/646c231ea79cc0904c2e85fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c231ea79cc0904c2e8601
        failing since 113 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-23T02:20:55.581936  + set +x
    2023-05-23T02:20:55.582105  [   14.350371] <LAVA_SIGNAL_ENDRUN 0_dmesg =
957180_1.5.2.3.1>
    2023-05-23T02:20:55.690186  / # #
    2023-05-23T02:20:55.791662  export SHELL=3D/bin/sh
    2023-05-23T02:20:55.792099  #
    2023-05-23T02:20:55.893259  / # export SHELL=3D/bin/sh. /lava-957180/en=
vironment
    2023-05-23T02:20:55.893636  =

    2023-05-23T02:20:55.994836  / # . /lava-957180/environment/lava-957180/=
bin/lava-test-runner /lava-957180/1
    2023-05-23T02:20:55.995565  =

    2023-05-23T02:20:55.998575  / # /lava-957180/bin/lava-test-runner /lava=
-957180/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646c23e69a90a2bc512e86dd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c23e69a90a2bc512e86e2
        failing since 113 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-23T02:24:14.395244  + set +x
    2023-05-23T02:24:14.395392  [   12.378746] <LAVA_SIGNAL_ENDRUN 0_dmesg =
957190_1.5.2.3.1>
    2023-05-23T02:24:14.501950  / # #
    2023-05-23T02:24:14.603450  export SHELL=3D/bin/sh
    2023-05-23T02:24:14.603890  #
    2023-05-23T02:24:14.705076  / # export SHELL=3D/bin/sh. /lava-957190/en=
vironment
    2023-05-23T02:24:14.705531  =

    2023-05-23T02:24:14.806781  / # . /lava-957190/environment/lava-957190/=
bin/lava-test-runner /lava-957190/1
    2023-05-23T02:24:14.807372  =

    2023-05-23T02:24:14.810451  / # /lava-957190/bin/lava-test-runner /lava=
-957190/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646c261678c20b09b62e8600

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c261678c20b09b62e8605
        failing since 113 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-23T02:33:34.761564  + set +x
    2023-05-23T02:33:34.761742  [   13.210289] <LAVA_SIGNAL_ENDRUN 0_dmesg =
957212_1.5.2.3.1>
    2023-05-23T02:33:34.868552  / # #
    2023-05-23T02:33:34.970286  export SHELL=3D/bin/sh
    2023-05-23T02:33:34.970826  #
    2023-05-23T02:33:35.072146  / # export SHELL=3D/bin/sh. /lava-957212/en=
vironment
    2023-05-23T02:33:35.072744  =

    2023-05-23T02:33:35.174211  / # . /lava-957212/environment/lava-957212/=
bin/lava-test-runner /lava-957212/1
    2023-05-23T02:33:35.174909  =

    2023-05-23T02:33:35.178183  / # /lava-957212/bin/lava-test-runner /lava=
-957212/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/646c27f6a41c25e3d62e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c27f6a41c25e3d62e85fb
        failing since 113 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-23T02:41:34.782323  + set +x
    2023-05-23T02:41:34.782473  [   13.127121] <LAVA_SIGNAL_ENDRUN 0_dmesg =
957221_1.5.2.3.1>
    2023-05-23T02:41:34.889131  / # #
    2023-05-23T02:41:34.990472  export SHELL=3D/bin/sh
    2023-05-23T02:41:34.990945  #
    2023-05-23T02:41:35.092249  / # export SHELL=3D/bin/sh. /lava-957221/en=
vironment
    2023-05-23T02:41:35.092624  =

    2023-05-23T02:41:35.193770  / # . /lava-957221/environment/lava-957221/=
bin/lava-test-runner /lava-957221/1
    2023-05-23T02:41:35.194321  =

    2023-05-23T02:41:35.197600  / # /lava-957221/bin/lava-test-runner /lava=
-957221/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2d1eb9a24530e32e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2d1eb9a24530e32e8=
5f8
        failing since 197 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2cba917fabf21c2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2cba917fabf21c2e8=
5fb
        failing since 249 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c25f2c4e418da132e861e

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
646c25f2c4e418da132e8665
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27)

    2023-05-23T02:33:08.192223  /lava-342445/1/../bin/lava-test-case
    2023-05-23T02:33:08.192765  <8>[   18.343332] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>
    2023-05-23T02:33:08.193158  /lava-342445/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2a4be03834093a2e8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2a4be03834093a2e8=
651
        new failure (last pass: v6.4-rc3-205-ge885abc8cc39d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646c213159a041eead2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c213159a041eead2e85eb
        failing since 55 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:12:56.533372  <8>[   11.647351] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10419995_1.4.2.3.1>

    2023-05-23T02:12:56.638012  / # #

    2023-05-23T02:12:56.738701  export SHELL=3D/bin/sh

    2023-05-23T02:12:56.738944  #

    2023-05-23T02:12:56.839456  / # export SHELL=3D/bin/sh. /lava-10419995/=
environment

    2023-05-23T02:12:56.839669  =


    2023-05-23T02:12:56.940225  / # . /lava-10419995/environment/lava-10419=
995/bin/lava-test-runner /lava-10419995/1

    2023-05-23T02:12:56.940499  =


    2023-05-23T02:12:56.945538  / # /lava-10419995/bin/lava-test-runner /la=
va-10419995/1

    2023-05-23T02:12:56.951864  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2313a79cc0904c2e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c2313a79cc0904c2e85f0
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-23T02:20:55.453178  <8>[   12.149403] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420237_1.4.2.3.1>

    2023-05-23T02:20:55.557390  / # #

    2023-05-23T02:20:55.658142  export SHELL=3D/bin/sh

    2023-05-23T02:20:55.658532  #

    2023-05-23T02:20:55.759208  / # export SHELL=3D/bin/sh. /lava-10420237/=
environment

    2023-05-23T02:20:55.759598  =


    2023-05-23T02:20:55.860601  / # . /lava-10420237/environment/lava-10420=
237/bin/lava-test-runner /lava-10420237/1

    2023-05-23T02:20:55.860860  =


    2023-05-23T02:20:55.865113  / # /lava-10420237/bin/lava-test-runner /la=
va-10420237/1

    2023-05-23T02:20:55.872163  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c23f59a90a2bc512e8705

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c23f59a90a2bc512e8=
706
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22c3e9abe638252e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22c3e9abe638252e8=
5ed
        failing since 92 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22ded22582497a2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22ded22582497a2e8=
5fb
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2358678efb1bef2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2358678efb1bef2e8=
5e7
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22dbf193dd08162e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22dbf193dd08162e8=
5ed
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22c21c8a0f75852e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22c21c8a0f75852e8=
5e8
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22e09b95562f752e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22e09b95562f752e8=
5f2
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646c237635d350a1ac2e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c237635d350a1ac2e8=
61f
        failing since 26 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2363c2b29aa2d92e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2363c2b29aa2d92e8=
5ed
        failing since 26 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c27023abad0ab1f2e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c27023abad0ab1f2e8=
60c
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b0ed1cab651072e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b0ed1cab651072e8=
5ea
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c02012c550bee2e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c02012c550bee2e8=
61c
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c9a8c5eae99c12e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c9a8c5eae99c12e8=
5ea
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b0fd1cab651072e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b0fd1cab651072e8=
5ee
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c2a62867546ad2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c2a62867546ad2e8=
5ef
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c9bda9b5bd32a2e8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c9bda9b5bd32a2e8=
657
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b0cd1cab651072e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b0cd1cab651072e8=
5e7
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2befabb61ed15f2e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2befabb61ed15f2e8=
5ed
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c9bdda7241b672e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c9bdda7241b672e8=
5ff
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b0b8844056aaa2e8677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b0b8844056aaa2e8=
678
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2beeb8803abb602e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2beeb8803abb602e8=
62d
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2c9af41e8110a12e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2c9af41e8110a12e8=
5f4
        failing since 222 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b3201cf9102d82e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b3201cf9102d82e8=
5f4
        failing since 1 day (last pass: v6.4-rc2-486-gf467b1d198e27, first =
fail: v6.4-rc3-205-ge885abc8cc39d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2b49446323d2582e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2b49446323d2582e8=
5f8
        failing since 1 day (last pass: v6.4-rc2-486-gf467b1d198e27, first =
fail: v6.4-rc3-205-ge885abc8cc39d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2270c88c702aca2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2270c88c702aca2e8=
5e8
        new failure (last pass: v6.4-rc3-205-ge885abc8cc39d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646c21601b7db76baa2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c21601b7db76baa2e8=
5ea
        failing since 4 days (last pass: v6.4-rc2-426-gdec469ae11955, first=
 fail: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c226f72c8245f362e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c226f72c8245f362e8=
5fa
        failing since 158 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c216b1b7db76baa2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c216b1b7db76baa2e8=
5f1
        failing since 158 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/646c22872c84caf0f12e85f8

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646c22872c84caf=
0f12e864f
        failing since 26 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-23T02:18:21.118235  kern  :alert : Mem abort in<8>[   19.469225=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-23T02:18:21.118336  fo:

    2023-05-23T02:18:21.122526  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-23T02:18:21.130236  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-23T02:18:21.134571  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-23T02:18:21.137884  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-23T02:18:21.142992  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-23T02:18:21.145734  kern  :alert : Data abort info:

    2023-05-23T02:18:21.149900  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-23T02:18:21.154284  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646c22872c84caf=
0f12e8650
        failing since 26 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-23T02:18:21.105836  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22b3fa6c9017562e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22b3fa6c9017562e8=
637
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/646c249328dd87aa232e8637

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646c249328dd87aa232e863c
        failing since 11 days (last pass: v6.4-rc1-166-g16fe96af4971, first=
 fail: v6.4-rc1-260-g4cffd190aeed9)

    2023-05-23T02:27:19.662924  <8>[   25.842535] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432986_1.5.2.4.1>
    2023-05-23T02:27:19.769444  / # #
    2023-05-23T02:27:19.871570  export SHELL=3D/bin/sh
    2023-05-23T02:27:19.872083  #
    2023-05-23T02:27:19.973628  / # export SHELL=3D/bin/sh. /lava-432986/en=
vironment
    2023-05-23T02:27:19.974174  =

    2023-05-23T02:27:20.075816  / # . /lava-432986/environment/lava-432986/=
bin/lava-test-runner /lava-432986/1
    2023-05-23T02:27:20.076807  =

    2023-05-23T02:27:20.081445  / # /lava-432986/bin/lava-test-runner /lava=
-432986/1
    2023-05-23T02:27:20.135181  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646c249328dd87a=
a232e863e
        failing since 17 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        2 lines

    2023-05-23T02:27:19.648036  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-23T02:27:19.649435  kern  :emerg : Code: 97fda510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-23T02:27:19.660942  <8>[   25.839848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-23T02:27:19.661310  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646c249328dd87a=
a232e863f
        failing since 17 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        12 lines

    2023-05-23T02:27:19.626971  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-23T02:27:19.630234  kern  :alert : Mem abort info:
    2023-05-23T02:27:19.630631  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-23T02:27:19.631829  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-23T02:27:19.632440  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-23T02:27:19.632777  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-23T02:27:19.633328  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-23T02:27:19.634287  kern  :alert : Data abort info:
    2023-05-23T02:27:19.634615  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-23T02:27:19.635240  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646c24f7339c7a70982e8601

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646c24f7339c7a7=
0982e8608
        failing since 24 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-23T02:28:50.491583  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-23T02:28:50.492890  kern  :emerg : Code: 97fe2510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-23T02:28:50.507393  <8>[   19.307126] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-23T02:28:50.507776  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646c24f7339c7a7=
0982e8609
        failing since 24 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-23T02:28:50.465732  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-23T02:28:50.467234  kern  :alert : Mem abort info:
    2023-05-23T02:28:50.467572  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-23T02:28:50.468728  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-23T02:28:50.470255  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-23T02:28:50.470589  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-23T02:28:50.472185  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-23T02:28:50.473645  kern  :alert : Data abort info:
    2023-05-23T02:28:50.473985  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-23T02:28:50.475118  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646c26251b6510d2932e8621

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646c26251b6510d=
2932e8628
        failing since 25 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-23T02:33:51.132677  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-23T02:33:51.133965  kern  :emerg : Code: 97fe3d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-23T02:33:51.143755  <8>[   19.258985] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-23T02:33:51.144120  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646c26251b6510d=
2932e8629
        failing since 25 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-23T02:33:51.108290  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-23T02:33:51.110083  kern  :alert : Mem abort info:
    2023-05-23T02:33:51.110446  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-23T02:33:51.111481  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-23T02:33:51.112716  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-23T02:33:51.113076  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-23T02:33:51.114244  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-23T02:33:51.115777  kern  :alert : Data abort info:
    2023-05-23T02:33:51.116134  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-23T02:33:51.117307  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2a224ab8aa4b282e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2a224ab8aa4b282e8=
60d
        failing since 25 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22c9c21ecd1fef2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22c9c21ecd1fef2e8=
5ea
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646c24d2309e940aa52e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646c24d2309e940=
aa52e85f3
        failing since 24 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-23T02:28:15.967551  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-23T02:28:15.967651  kern  :emerg : Code: 97fa8d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-23T02:28:15.967728  <8>[   22.997851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-23T02:28:15.967800  + set +x

    2023-05-23T02:28:15.967868  <8>[   22.999600] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10420325_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646c24d2309e940=
aa52e85f4
        failing since 24 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-23T02:28:15.941719  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-23T02:28:15.941813  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-23T02:28:15.941888  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000794fd000

    2023-05-23T02:28:15.941963  kern  :alert : [0000000000000008] pgd=3D080=
0000079483003, p4d=3D0800000079483003, pud=3D0800000079482003, pmd=3D000000=
0000000000

    2023-05-23T02:28:15.942035  <8>[   22.973917] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646c26fb2333bd68db2e8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c26fb2333bd68db2e8=
676
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2359a40ab10ae22e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2359a40ab10ae22e8=
5e7
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/646c22b9cd1edd5c722e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c22b9cd1edd5c722e8=
5fa
        failing since 104 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/646c2485c8483f4b3e2e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c2485c8483f4b3e2e8=
5fa
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/646c256fd4056172c72e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-24=
6-g48bfaadff1906/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646c256fd4056172c72e8=
5f6
        failing since 4 days (last pass: v6.4-rc2-426-gdec469ae11955, first=
 fail: v6.4-rc2-486-gf467b1d198e27) =

 =20
