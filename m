Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9425736343
	for <lists+linux-next@lfdr.de>; Tue, 20 Jun 2023 07:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjFTFpI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jun 2023 01:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjFTFpH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2023 01:45:07 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD3110DB
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 22:45:02 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5535efe37b7so1836970a12.3
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687239901; x=1689831901;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kGfF9KfDIUh5abOL2OJk8AkGGyK7UgBp1r5Tdse6FnY=;
        b=G73PikMwSsPu2a5Yosnb990zD7QnhHaBiesvwOPz65Xbi67Cek2rwB07Ce0xNZAmL6
         Rwb084KuuXMV2Vsjw2TfmjN26LpHtZ54nJmtmMI0Ng/n+dte10nS1UL/sga5GEJBCJD7
         HXf6TeFS/ty2Q7++DDUw8llNzjiYzDO9mKadflUqVbpFZ2PPSG4B1aCPyVGB1/eIuwhy
         EK1jv6LqozM3B07ZLfvSQ3LmB4ecHX7A6u0bdDHgHPS3XKqNr29q0KrUx14iIKTP/tPN
         rtoaQ0bEtZ4E4+pBsYm7RfOdJ1d/+OrXaufd5CPLhd4XTRY4BZLchZmBpM3O39m3/Gu/
         xChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687239901; x=1689831901;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGfF9KfDIUh5abOL2OJk8AkGGyK7UgBp1r5Tdse6FnY=;
        b=eylfi4aH4C3faQ0XsLAyno4rP4NojYoZ/7Letg5jpnV1TPCoVuI48zxJa/ScyvIRbm
         U47ybHrWQoW4OcKr/BqVRy9uwukzoC6kYkwyhswrcKTkrVxknFmOCOq7jHij8EaaMpmj
         6h5BCD25NtZbxaP1kG3AG41Ehz00YtqQ9jTA22pDUjyFjQuVrUwT2y04MF4zwxHkNEZ8
         crn95ypG6WnBLPwGuE6grzhPjTwdS7Fyul8vH+soj+HxhyLLyWS8/i6GmsPqUTSGjZVe
         ks3DMxa+eym40OWgFyINyoOabFDn7TjyjVVaVv1xovlzVaUo7Nfbbc+AC2LV2fDZhQne
         3I6g==
X-Gm-Message-State: AC+VfDwvRQaw7cALkuX1OWTlrBIgxbg/jR72CzijXNlskxoSJazs+BmW
        +VS0D0V4mIpfY4eXvYCz6LXrXugFUPnlmmgk0gUSxg==
X-Google-Smtp-Source: ACHHUZ546ZCwhVMAvZ40A7cFocCq8tmYAJ1gUBqR1p6+GMhigxQuO3eoKrtGZBZ/Y3I5qRO4boGOgA==
X-Received: by 2002:a05:6a21:7897:b0:122:9e67:1d77 with SMTP id bf23-20020a056a21789700b001229e671d77mr604014pzc.38.1687239898975;
        Mon, 19 Jun 2023 22:44:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b001b2063d43a7sm691038plg.249.2023.06.19.22.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 22:44:58 -0700 (PDT)
Message-ID: <64913cda.170a0220.b99eb.1e43@mx.google.com>
Date:   Mon, 19 Jun 2023 22:44:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-164-g1f02f25057f7
Subject: next/pending-fixes baseline: 601 runs,
 79 regressions (v6.4-rc7-164-g1f02f25057f7)
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

next/pending-fixes baseline: 601 runs, 79 regressions (v6.4-rc7-164-g1f02f2=
5057f7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-164-g1f02f25057f7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-164-g1f02f25057f7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1f02f25057f7323945122586aa04a453d57cf4f5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64912719d70e438f2f306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64912719d70e438f2f306=
134
        failing since 253 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc69e908638cd330617f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc69e908638cd3306184
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:09:46.546126  + set +x

    2023-06-20T01:09:46.553037  <8>[   10.500368] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823441_1.4.2.3.1>

    2023-06-20T01:09:46.654830  #

    2023-06-20T01:09:46.655111  =


    2023-06-20T01:09:46.755705  / # #export SHELL=3D/bin/sh

    2023-06-20T01:09:46.755923  =


    2023-06-20T01:09:46.856432  / # export SHELL=3D/bin/sh. /lava-10823441/=
environment

    2023-06-20T01:09:46.856653  =


    2023-06-20T01:09:46.957213  / # . /lava-10823441/environment/lava-10823=
441/bin/lava-test-runner /lava-10823441/1

    2023-06-20T01:09:46.957559  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64910048de3a73c0f130613e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910048de3a73c0f1306143
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:26:09.312329  <8>[   13.573609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823857_1.4.2.3.1>

    2023-06-20T01:26:09.315523  + set +x

    2023-06-20T01:26:09.421238  =


    2023-06-20T01:26:09.523105  / # #export SHELL=3D/bin/sh

    2023-06-20T01:26:09.523824  =


    2023-06-20T01:26:09.625123  / # export SHELL=3D/bin/sh. /lava-10823857/=
environment

    2023-06-20T01:26:09.625685  =


    2023-06-20T01:26:09.726741  / # . /lava-10823857/environment/lava-10823=
857/bin/lava-test-runner /lava-10823857/1

    2023-06-20T01:26:09.728225  =


    2023-06-20T01:26:09.733094  / # /lava-10823857/bin/lava-test-runner /la=
va-10823857/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64910074277a537a68306186

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910074277a537a6830618b
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:27:03.060075  <8>[   10.197748] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823942_1.4.2.3.1>

    2023-06-20T01:27:03.063422  + set +x

    2023-06-20T01:27:03.171309  / # #

    2023-06-20T01:27:03.273557  export SHELL=3D/bin/sh

    2023-06-20T01:27:03.274253  #

    2023-06-20T01:27:03.375651  / # export SHELL=3D/bin/sh. /lava-10823942/=
environment

    2023-06-20T01:27:03.376343  =


    2023-06-20T01:27:03.477683  / # . /lava-10823942/environment/lava-10823=
942/bin/lava-test-runner /lava-10823942/1

    2023-06-20T01:27:03.479086  =


    2023-06-20T01:27:03.485046  / # /lava-10823942/bin/lava-test-runner /la=
va-10823942/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc5fe49556e343306162

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc5fe49556e343306167
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:09:26.704106  + <8>[   11.611847] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10823452_1.4.2.3.1>

    2023-06-20T01:09:26.704596  set +x

    2023-06-20T01:09:26.813649  / # #

    2023-06-20T01:09:26.916321  export SHELL=3D/bin/sh

    2023-06-20T01:09:26.916927  #

    2023-06-20T01:09:27.018022  / # export SHELL=3D/bin/sh. /lava-10823452/=
environment

    2023-06-20T01:09:27.018248  =


    2023-06-20T01:09:27.118972  / # . /lava-10823452/environment/lava-10823=
452/bin/lava-test-runner /lava-10823452/1

    2023-06-20T01:09:27.120241  =


    2023-06-20T01:09:27.124963  / # /lava-10823452/bin/lava-test-runner /la=
va-10823452/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6491004a521383927530616c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491004b5213839275306171
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:26:16.979568  + set +x

    2023-06-20T01:26:16.986360  <8>[   15.547151] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823856_1.4.2.3.1>

    2023-06-20T01:26:17.090619  / # #

    2023-06-20T01:26:17.191383  export SHELL=3D/bin/sh

    2023-06-20T01:26:17.192156  #

    2023-06-20T01:26:17.293707  / # export SHELL=3D/bin/sh. /lava-10823856/=
environment

    2023-06-20T01:26:17.294530  =


    2023-06-20T01:26:17.396277  / # . /lava-10823856/environment/lava-10823=
856/bin/lava-test-runner /lava-10823856/1

    2023-06-20T01:26:17.397473  =


    2023-06-20T01:26:17.401947  / # /lava-10823856/bin/lava-test-runner /la=
va-10823856/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6491004b5213839=
275306173
        failing since 4 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef)
        3 lines

    2023-06-20T01:26:16.955273  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-20T01:26:16.962119  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-20T01:26:16.968747  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-20T01:26:16.975143  <8>[   15.530621] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491009606a2a786f4306149

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491009606a2a786f430614e
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:27:32.926295  + set<8>[   11.692791] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10823911_1.4.2.3.1>

    2023-06-20T01:27:32.926739   +x

    2023-06-20T01:27:33.034360  / # #

    2023-06-20T01:27:33.136645  export SHELL=3D/bin/sh

    2023-06-20T01:27:33.137377  #

    2023-06-20T01:27:33.238886  / # export SHELL=3D/bin/sh. /lava-10823911/=
environment

    2023-06-20T01:27:33.239679  =


    2023-06-20T01:27:33.341212  / # . /lava-10823911/environment/lava-10823=
911/bin/lava-test-runner /lava-10823911/1

    2023-06-20T01:27:33.342439  =


    2023-06-20T01:27:33.347321  / # /lava-10823911/bin/lava-test-runner /la=
va-10823911/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc60f3733a1aa7306142

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc60f3733a1aa7306147
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:09:26.193531  <8>[   10.671459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823453_1.4.2.3.1>

    2023-06-20T01:09:26.197788  + set +x

    2023-06-20T01:09:26.303798  #

    2023-06-20T01:09:26.304902  =


    2023-06-20T01:09:26.406839  / # #export SHELL=3D/bin/sh

    2023-06-20T01:09:26.407530  =


    2023-06-20T01:09:26.508907  / # export SHELL=3D/bin/sh. /lava-10823453/=
environment

    2023-06-20T01:09:26.509783  =


    2023-06-20T01:09:26.611190  / # . /lava-10823453/environment/lava-10823=
453/bin/lava-test-runner /lava-10823453/1

    2023-06-20T01:09:26.612262  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6491003a521383927530612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491003a5213839275306134
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:25:55.369769  <8>[   13.476106] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823843_1.4.2.3.1>

    2023-06-20T01:25:55.372982  + set +x

    2023-06-20T01:25:55.478165  #

    2023-06-20T01:25:55.580709  / # #export SHELL=3D/bin/sh

    2023-06-20T01:25:55.581430  =


    2023-06-20T01:25:55.682975  / # export SHELL=3D/bin/sh. /lava-10823843/=
environment

    2023-06-20T01:25:55.683687  =


    2023-06-20T01:25:55.785028  / # . /lava-10823843/environment/lava-10823=
843/bin/lava-test-runner /lava-10823843/1

    2023-06-20T01:25:55.786116  =


    2023-06-20T01:25:55.791518  / # /lava-10823843/bin/lava-test-runner /la=
va-10823843/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491009e06a2a786f43061b9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491009e06a2a786f43061be
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:27:39.973988  <8>[   10.857493] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823953_1.4.2.3.1>

    2023-06-20T01:27:39.977208  + set +x

    2023-06-20T01:27:40.079697  =


    2023-06-20T01:27:40.181357  / # #export SHELL=3D/bin/sh

    2023-06-20T01:27:40.182356  =


    2023-06-20T01:27:40.284084  / # export SHELL=3D/bin/sh. /lava-10823953/=
environment

    2023-06-20T01:27:40.284305  =


    2023-06-20T01:27:40.384867  / # . /lava-10823953/environment/lava-10823=
953/bin/lava-test-runner /lava-10823953/1

    2023-06-20T01:27:40.385163  =


    2023-06-20T01:27:40.389966  / # /lava-10823953/bin/lava-test-runner /la=
va-10823953/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc1b64dce90c4e306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc1c64dce90c4e30613e
        failing since 159 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-20T01:09:34.355348  / # #

    2023-06-20T01:09:34.455808  export SHELL=3D/bin/sh

    2023-06-20T01:09:34.455958  #

    2023-06-20T01:09:34.556397  / # export SHELL=3D/bin/sh. /lava-10823339/=
environment

    2023-06-20T01:09:34.556534  =


    2023-06-20T01:09:34.656955  / # . /lava-10823339/environment/lava-10823=
339/bin/lava-test-runner /lava-10823339/1

    2023-06-20T01:09:34.657148  =


    2023-06-20T01:09:34.668920  / # /lava-10823339/bin/lava-test-runner /la=
va-10823339/1

    2023-06-20T01:09:34.785741  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-20T01:09:34.785831  + cd /lava-10823339/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649102aeab891e79353061ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649102aeab891e7935306=
1af
        failing since 113 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6491073d186df0d3e230623e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491073d186df0d3e2306=
23f
        failing since 12 days (last pass: v6.4-rc5-244-g9d674be53332, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/649104034941a7f824306218

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649104034941a7f824306=
219
        failing since 1 day (last pass: v6.4-rc6-301-ga3b6bb6457ef, first f=
ail: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6491034d7b427382f6306133

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491034d7b427382f6306138
        failing since 153 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-20T01:39:15.468946  <8>[   15.078836] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679315_1.5.2.4.1>
    2023-06-20T01:39:15.581732  / # #
    2023-06-20T01:39:15.684542  export SHELL=3D/bin/sh
    2023-06-20T01:39:15.685083  #
    2023-06-20T01:39:15.786431  / # export SHELL=3D/bin/sh. /lava-3679315/e=
nvironment
    2023-06-20T01:39:15.787346  =

    2023-06-20T01:39:15.788017  / # <3>[   15.328563] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-06-20T01:39:15.890475  . /lava-3679315/environment/lava-3679315/bi=
n/lava-test-runner /lava-3679315/1
    2023-06-20T01:39:15.891902  =

    2023-06-20T01:39:15.896858  / # /lava-3679315/bin/lava-test-runner /lav=
a-3679315/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64910407ec19d46a3b30614c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910407ec19d46a3b306151
        failing since 153 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-20T01:42:13.577152  <8>[   20.697514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-20T01:42:13.577319  + set +x
    2023-06-20T01:42:13.584044  <8>[   20.708423] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679337_1.5.2.4.1>
    2023-06-20T01:42:13.690514  / # #
    2023-06-20T01:42:13.791910  export SHELL=3D/bin/sh
    2023-06-20T01:42:13.792278  #
    2023-06-20T01:42:13.893522  / # export SHELL=3D/bin/sh. /lava-3679337/e=
nvironment
    2023-06-20T01:42:13.894126  =

    2023-06-20T01:42:13.995730  / # . /lava-3679337/environment/lava-367933=
7/bin/lava-test-runner /lava-3679337/1
    2023-06-20T01:42:13.997609   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6491067a9c69a487723061ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491067a9c69a487723061b1
        failing since 153 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-20T01:52:37.625190  <8>[   14.807265] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679430_1.5.2.4.1>
    2023-06-20T01:52:37.737882  / # #
    2023-06-20T01:52:37.840942  export SHELL=3D/bin/sh
    2023-06-20T01:52:37.841751  #
    2023-06-20T01:52:37.943620  / # export SHELL=3D/bin/sh. /lava-3679430/e=
nvironment
    2023-06-20T01:52:37.944560  =

    2023-06-20T01:52:38.048992  / # . /lava-3679430/environment/lava-367943=
0/bin/lava-test-runner /lava-3679430/1
    2023-06-20T01:52:38.050445  =

    2023-06-20T01:52:38.055182  / # /lava-3679430/bin/lava-test-runner /lav=
a-3679430/1
    2023-06-20T01:52:38.136223  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6491071ac4474a7c1b3061ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491071ac4474a7c1b3061b1
        failing since 153 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-20T01:55:14.819973  + set +x<8>[   14.775987] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3679455_1.5.2.4.1>
    2023-06-20T01:55:14.820494  =

    2023-06-20T01:55:14.931238  / # #
    2023-06-20T01:55:15.034202  export SHELL=3D/bin/sh
    2023-06-20T01:55:15.035340  #
    2023-06-20T01:55:15.137279  / # export SHELL=3D/bin/sh. /lava-3679455/e=
nvironment
    2023-06-20T01:55:15.138056  =

    2023-06-20T01:55:15.138463  / # . /lava-3679455/environment<3>[   15.08=
8687] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-06-20T01:55:15.240362  /lava-3679455/bin/lava-test-runner /lava-36=
79455/1
    2023-06-20T01:55:15.242126   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649107b77efb98e2f2306137

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649107b77efb98e2f230613c
        failing since 153 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-20T01:57:59.054733  <8>[   16.748461] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679707_1.5.2.4.1>
    2023-06-20T01:57:59.162093  / # #
    2023-06-20T01:57:59.264464  export SHELL=3D/bin/sh
    2023-06-20T01:57:59.264855  #
    2023-06-20T01:57:59.366149  / # export SHELL=3D/bin/sh. /lava-3679707/e=
nvironment
    2023-06-20T01:57:59.367118  =

    2023-06-20T01:57:59.469370  / # . /lava-3679707/environment/lava-367970=
7/bin/lava-test-runner /lava-3679707/1
    2023-06-20T01:57:59.470262  =

    2023-06-20T01:57:59.474521  / # /lava-3679707/bin/lava-test-runner /lav=
a-3679707/1
    2023-06-20T01:57:59.552580  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6490fe1e373e8f89fb30614e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6490fe1e373e8f8=
9fb306155
        failing since 512 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-20T01:16:59.225431  kern  :alert : 8<--- cut here ---
    2023-06-20T01:16:59.225749  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-20T01:16:59.225952  kern  :alert : [00000060] *pgd=3Dc4ac6831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-20T01:16:59.226130  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-20T01:16:59.226303  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88ec000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-20T01:16:59.228451  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-20T01:16:59.268704  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-20T01:16:59.269013  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4b13200 pointer offset 0 size 512
    2023-06-20T01:16:59.269206  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-06-20T01:16:59.269385  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (2 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6490fe1e373e8f8=
9fb306157
        failing since 109 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-20T01:16:59.271704  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b13200 pointer offset 4 size 512
    2023-06-20T01:16:59.305358  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-20T01:16:59.305757  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-20T01:16:59.306256  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2be000 allocated at load_module+0x6b0/0=
x1954
    2023-06-20T01:16:59.308602  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-20T01:16:59.412701  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-20T01:16:59.412955  kern  :emerg : Process udevd (pid: 74, stac=
k limit =3D 0xed99a60b)
    2023-06-20T01:16:59.413111  kern  :emerg : Stack: (0xc88edcf8 to 0xc88e=
e000)
    2023-06-20T01:16:59.413254  kern  :emerg : dce0:                       =
                                c4b13200 c0777860
    2023-06-20T01:16:59.413370  kern  :emerg : dd00: 00000000 c03afe80 0000=
0000 749f202d 0000005d 749f202d c0777860 bf2be220 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fffd6175c13570306159

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6490fffd6175c13=
57030616c
        new failure (last pass: v6.4-rc7-110-gdab158ce7741)
        1 lines

    2023-06-20T01:25:12.217565  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-20T01:25:12.234930  <8>[   14.189408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649101071c32c12906306176

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649101071c32c1290630617b
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:29:31.785244  + <8>[   10.581621] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10823405_1.4.2.3.1>

    2023-06-20T01:29:31.785698  set +x

    2023-06-20T01:29:31.891180  #

    2023-06-20T01:29:31.994001  / # #export SHELL=3D/bin/sh

    2023-06-20T01:29:31.994782  =


    2023-06-20T01:29:32.096423  / # export SHELL=3D/bin/sh. /lava-10823405/=
environment

    2023-06-20T01:29:32.097148  =


    2023-06-20T01:29:32.198611  / # . /lava-10823405/environment/lava-10823=
405/bin/lava-test-runner /lava-10823405/1

    2023-06-20T01:29:32.199937  =


    2023-06-20T01:29:32.204687  / # /lava-10823405/bin/lava-test-runner /la=
va-10823405/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6491015dccf7ba09013061fb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491015dccf7ba0901306200
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:30:45.362812  + set +x

    2023-06-20T01:30:45.369213  <8>[   16.577584] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823844_1.4.2.3.1>

    2023-06-20T01:30:45.476385  / # #

    2023-06-20T01:30:45.576922  export SHELL=3D/bin/sh

    2023-06-20T01:30:45.577087  #

    2023-06-20T01:30:45.677538  / # export SHELL=3D/bin/sh. /lava-10823844/=
environment

    2023-06-20T01:30:45.677705  =


    2023-06-20T01:30:45.778227  / # . /lava-10823844/environment/lava-10823=
844/bin/lava-test-runner /lava-10823844/1

    2023-06-20T01:30:45.778521  =


    2023-06-20T01:30:45.783292  / # /lava-10823844/bin/lava-test-runner /la=
va-10823844/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491016adcdc60cf64306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491016adcdc60cf64306136
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:31:14.261549  + set +x

    2023-06-20T01:31:14.268273  <8>[   10.483339] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823977_1.4.2.3.1>

    2023-06-20T01:31:14.372832  / # #

    2023-06-20T01:31:14.473478  export SHELL=3D/bin/sh

    2023-06-20T01:31:14.473695  #

    2023-06-20T01:31:14.574252  / # export SHELL=3D/bin/sh. /lava-10823977/=
environment

    2023-06-20T01:31:14.574491  =


    2023-06-20T01:31:14.675066  / # . /lava-10823977/environment/lava-10823=
977/bin/lava-test-runner /lava-10823977/1

    2023-06-20T01:31:14.675387  =


    2023-06-20T01:31:14.680203  / # /lava-10823977/bin/lava-test-runner /la=
va-10823977/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6491001a2cbdcead6630613e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491001a2cbdcead66306143
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:25:27.385189  <8>[   10.337955] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823419_1.4.2.3.1>

    2023-06-20T01:25:27.388733  + set +x

    2023-06-20T01:25:27.490029  #

    2023-06-20T01:25:27.490416  =


    2023-06-20T01:25:27.590988  / # #export SHELL=3D/bin/sh

    2023-06-20T01:25:27.591186  =


    2023-06-20T01:25:27.691662  / # export SHELL=3D/bin/sh. /lava-10823419/=
environment

    2023-06-20T01:25:27.691882  =


    2023-06-20T01:25:27.792426  / # . /lava-10823419/environment/lava-10823=
419/bin/lava-test-runner /lava-10823419/1

    2023-06-20T01:25:27.792699  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6491005548426158ee30613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491005548426158ee306141
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:26:37.359833  + set +x

    2023-06-20T01:26:37.366400  <8>[   14.272198] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823834_1.4.2.3.1>

    2023-06-20T01:26:37.473934  / # #

    2023-06-20T01:26:37.576117  export SHELL=3D/bin/sh

    2023-06-20T01:26:37.576828  #

    2023-06-20T01:26:37.678332  / # export SHELL=3D/bin/sh. /lava-10823834/=
environment

    2023-06-20T01:26:37.679064  =


    2023-06-20T01:26:37.780520  / # . /lava-10823834/environment/lava-10823=
834/bin/lava-test-runner /lava-10823834/1

    2023-06-20T01:26:37.781793  =


    2023-06-20T01:26:37.787154  / # /lava-10823834/bin/lava-test-runner /la=
va-10823834/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491006a277a537a68306162

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491006a277a537a68306167
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:26:54.560242  <8>[   10.734797] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823981_1.4.2.3.1>

    2023-06-20T01:26:54.563211  + set +x

    2023-06-20T01:26:54.664451  #

    2023-06-20T01:26:54.664772  =


    2023-06-20T01:26:54.765392  / # #export SHELL=3D/bin/sh

    2023-06-20T01:26:54.765608  =


    2023-06-20T01:26:54.866168  / # export SHELL=3D/bin/sh. /lava-10823981/=
environment

    2023-06-20T01:26:54.866393  =


    2023-06-20T01:26:54.966930  / # . /lava-10823981/environment/lava-10823=
981/bin/lava-test-runner /lava-10823981/1

    2023-06-20T01:26:54.967310  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc4a9b04d4589c30612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc4a9b04d4589c306133
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:09:18.608587  + set<8>[   11.639767] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10823428_1.4.2.3.1>

    2023-06-20T01:09:18.608686   +x

    2023-06-20T01:09:18.713027  / # #

    2023-06-20T01:09:18.813768  export SHELL=3D/bin/sh

    2023-06-20T01:09:18.814014  #

    2023-06-20T01:09:18.914562  / # export SHELL=3D/bin/sh. /lava-10823428/=
environment

    2023-06-20T01:09:18.914762  =


    2023-06-20T01:09:19.015275  / # . /lava-10823428/environment/lava-10823=
428/bin/lava-test-runner /lava-10823428/1

    2023-06-20T01:09:19.015594  =


    2023-06-20T01:09:19.019872  / # /lava-10823428/bin/lava-test-runner /la=
va-10823428/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6491002136336751b93061b5

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491002136336751b93061ba
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:25:40.445154  + set +x

    2023-06-20T01:25:40.451706  <8>[   14.328491] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10823849_1.4.2.3.1>

    2023-06-20T01:25:40.559472  / # #

    2023-06-20T01:25:40.660376  export SHELL=3D/bin/sh

    2023-06-20T01:25:40.661097  #

    2023-06-20T01:25:40.762512  / # export SHELL=3D/bin/sh. /lava-10823849/=
environment

    2023-06-20T01:25:40.763174  =


    2023-06-20T01:25:40.864694  / # . /lava-10823849/environment/lava-10823=
849/bin/lava-test-runner /lava-10823849/1

    2023-06-20T01:25:40.865918  =


    2023-06-20T01:25:40.871007  / # /lava-10823849/bin/lava-test-runner /la=
va-10823849/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491005b48426158ee306164

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491005b48426158ee306169
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:26:33.304875  + <8>[   11.032274] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10823988_1.4.2.3.1>

    2023-06-20T01:26:33.304972  set +x

    2023-06-20T01:26:33.409464  / # #

    2023-06-20T01:26:33.510054  export SHELL=3D/bin/sh

    2023-06-20T01:26:33.510317  #

    2023-06-20T01:26:33.610815  / # export SHELL=3D/bin/sh. /lava-10823988/=
environment

    2023-06-20T01:26:33.611072  =


    2023-06-20T01:26:33.711611  / # . /lava-10823988/environment/lava-10823=
988/bin/lava-test-runner /lava-10823988/1

    2023-06-20T01:26:33.711988  =


    2023-06-20T01:26:33.716395  / # /lava-10823988/bin/lava-test-runner /la=
va-10823988/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6491000e36336751b930613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491000e36336751b9306140
        failing since 141 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-20T01:25:11.621650  + set +x
    2023-06-20T01:25:11.621937  [   13.153531] <LAVA_SIGNAL_ENDRUN 0_dmesg =
982353_1.5.2.3.1>
    2023-06-20T01:25:11.730008  / # #
    2023-06-20T01:25:11.831642  export SHELL=3D/bin/sh
    2023-06-20T01:25:11.832002  #
    2023-06-20T01:25:11.933224  / # export SHELL=3D/bin/sh. /lava-982353/en=
vironment
    2023-06-20T01:25:11.933924  =

    2023-06-20T01:25:12.035446  / # . /lava-982353/environment/lava-982353/=
bin/lava-test-runner /lava-982353/1
    2023-06-20T01:25:12.036054  =

    2023-06-20T01:25:12.039475  / # /lava-982353/bin/lava-test-runner /lava=
-982353/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6491005e01becc2d4730612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491005e01becc2d47306133
        failing since 141 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-20T01:26:31.544764  + set +x
    2023-06-20T01:26:31.545003  [   14.327965] <LAVA_SIGNAL_ENDRUN 0_dmesg =
982357_1.5.2.3.1>
    2023-06-20T01:26:31.652741  / # #
    2023-06-20T01:26:31.754453  export SHELL=3D/bin/sh
    2023-06-20T01:26:31.754959  #
    2023-06-20T01:26:31.856147  / # export SHELL=3D/bin/sh. /lava-982357/en=
vironment
    2023-06-20T01:26:31.856553  =

    2023-06-20T01:26:31.957762  / # . /lava-982357/environment/lava-982357/=
bin/lava-test-runner /lava-982357/1
    2023-06-20T01:26:31.958340  =

    2023-06-20T01:26:31.961574  / # /lava-982357/bin/lava-test-runner /lava=
-982357/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6491013a571b7895bf30614d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491013a571b7895bf306152
        failing since 141 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-20T01:30:12.167288  + set +x
    2023-06-20T01:30:12.167452  [   12.882289] <LAVA_SIGNAL_ENDRUN 0_dmesg =
982383_1.5.2.3.1>
    2023-06-20T01:30:12.275130  / # #
    2023-06-20T01:30:12.376606  export SHELL=3D/bin/sh
    2023-06-20T01:30:12.376999  #
    2023-06-20T01:30:12.478142  / # export SHELL=3D/bin/sh. /lava-982383/en=
vironment
    2023-06-20T01:30:12.478537  =

    2023-06-20T01:30:12.579491  / # . /lava-982383/environment/lava-982383/=
bin/lava-test-runner /lava-982383/1
    2023-06-20T01:30:12.580185  =

    2023-06-20T01:30:12.583404  / # /lava-982383/bin/lava-test-runner /lava=
-982383/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649101efa83a221fd83061cc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649101efa83a221fd83061d1
        failing since 141 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-20T01:33:13.031659  + set +x
    2023-06-20T01:33:13.031832  [   13.162039] <LAVA_SIGNAL_ENDRUN 0_dmesg =
982395_1.5.2.3.1>
    2023-06-20T01:33:13.138699  / # #
    2023-06-20T01:33:13.240515  export SHELL=3D/bin/sh
    2023-06-20T01:33:13.241058  #
    2023-06-20T01:33:13.342386  / # export SHELL=3D/bin/sh. /lava-982395/en=
vironment
    2023-06-20T01:33:13.343008  =

    2023-06-20T01:33:13.444376  / # . /lava-982395/environment/lava-982395/=
bin/lava-test-runner /lava-982395/1
    2023-06-20T01:33:13.444969  =

    2023-06-20T01:33:13.448653  / # /lava-982395/bin/lava-test-runner /lava=
-982395/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649106c712464cf68b306161

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649106c712464cf68b306166
        failing since 141 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-20T01:53:50.591177  + set +x
    2023-06-20T01:53:50.591328  [   12.167782] <LAVA_SIGNAL_ENDRUN 0_dmesg =
982403_1.5.2.3.1>
    2023-06-20T01:53:50.697878  / # #
    2023-06-20T01:53:50.799357  export SHELL=3D/bin/sh
    2023-06-20T01:53:50.799737  #
    2023-06-20T01:53:50.900889  / # export SHELL=3D/bin/sh. /lava-982403/en=
vironment
    2023-06-20T01:53:50.901474  =

    2023-06-20T01:53:51.002887  / # . /lava-982403/environment/lava-982403/=
bin/lava-test-runner /lava-982403/1
    2023-06-20T01:53:51.003451  =

    2023-06-20T01:53:51.006767  / # /lava-982403/bin/lava-test-runner /lava=
-982403/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649105fe7eedd36d4530615c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649105fe7eedd36d45306=
15d
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64910185e9797093f0306176

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64910185e9797093f0306=
177
        failing since 416 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64910226348647bca9306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910226348647bca9306136
        failing since 54 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-20T01:34:06.468320  <8>[    7.623306] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679271_1.5.2.4.1>
    2023-06-20T01:34:06.586769  / # #
    2023-06-20T01:34:06.688264  export SHELL=3D/bin/sh
    2023-06-20T01:34:06.688815  #
    2023-06-20T01:34:06.790217  / # export SHELL=3D/bin/sh. /lava-3679271/e=
nvironment
    2023-06-20T01:34:06.790703  =

    2023-06-20T01:34:06.892151  / # . /lava-3679271/environment/lava-367927=
1/bin/lava-test-runner /lava-3679271/1
    2023-06-20T01:34:06.893023  =

    2023-06-20T01:34:06.899974  / # /lava-3679271/bin/lava-test-runner /lav=
a-3679271/1
    2023-06-20T01:34:06.945059  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649103b22df187b0e6306188

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649103b22df187b0e630618d
        failing since 52 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-20T01:40:49.798375  <8>[    7.593415] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-20T01:40:49.798852  + set +x
    2023-06-20T01:40:49.799291  <8>[    7.604165] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679566_1.5.2.4.1>
    2023-06-20T01:40:49.907972  / # #
    2023-06-20T01:40:50.013811  export SHELL=3D/bin/sh
    2023-06-20T01:40:50.014282  #
    2023-06-20T01:40:50.118789  / # export SHELL=3D/bin/sh. /lava-3679566/e=
nvironment
    2023-06-20T01:40:50.119256  =

    2023-06-20T01:40:50.222804  / # . /lava-3679566/environment/lava-367956=
6/bin/lava-test-runner /lava-3679566/1
    2023-06-20T01:40:50.223774   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649107e28cd8801918306199

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649107e28cd880191830619e
        failing since 54 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-06-20T01:58:34.448839  + set +x
    2023-06-20T01:58:34.452294  <8>[   19.363648] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3679669_1.5.2.4.1>
    2023-06-20T01:58:34.576503  #
    2023-06-20T01:58:34.681379  / # #export SHELL=3D/bin/sh
    2023-06-20T01:58:34.682527  =

    2023-06-20T01:58:34.785023  / # export SHELL=3D/bin/sh. /lava-3679669/e=
nvironment
    2023-06-20T01:58:34.785918  =

    2023-06-20T01:58:34.887974  / # . /lava-3679669/environment/lava-367966=
9/bin/lava-test-runner /lava-3679669/1
    2023-06-20T01:58:34.889891  =

    2023-06-20T01:58:34.933211  / # /lava-3679669/bin/lava-test-runner /lav=
a-3679669/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fc4f4e5f85db2530613f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6490fc4f4e5f85db25306144
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:09:19.078987  + <8>[   11.347057] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10823448_1.4.2.3.1>

    2023-06-20T01:09:19.079088  set +x

    2023-06-20T01:09:19.183568  / # #

    2023-06-20T01:09:19.284310  export SHELL=3D/bin/sh

    2023-06-20T01:09:19.284562  #

    2023-06-20T01:09:19.385129  / # export SHELL=3D/bin/sh. /lava-10823448/=
environment

    2023-06-20T01:09:19.385378  =


    2023-06-20T01:09:19.486067  / # . /lava-10823448/environment/lava-10823=
448/bin/lava-test-runner /lava-10823448/1

    2023-06-20T01:09:19.487765  =


    2023-06-20T01:09:19.492105  / # /lava-10823448/bin/lava-test-runner /la=
va-10823448/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649100162cbdcead66306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649100162cbdcead66306136
        failing since 81 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-20T01:25:21.384901  + <8>[   13.699076] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10823864_1.4.2.3.1>

    2023-06-20T01:25:21.385356  set +x

    2023-06-20T01:25:21.493545  / # #

    2023-06-20T01:25:21.595715  export SHELL=3D/bin/sh

    2023-06-20T01:25:21.596601  #

    2023-06-20T01:25:21.697895  / # export SHELL=3D/bin/sh. /lava-10823864/=
environment

    2023-06-20T01:25:21.698543  =


    2023-06-20T01:25:21.799924  / # . /lava-10823864/environment/lava-10823=
864/bin/lava-test-runner /lava-10823864/1

    2023-06-20T01:25:21.801051  =


    2023-06-20T01:25:21.805900  / # /lava-10823864/bin/lava-test-runner /la=
va-10823864/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6491005d246410482630614c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491005d2464104826306151
        failing since 83 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-20T01:26:46.987256  + set<8>[   12.009999] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10823926_1.4.2.3.1>

    2023-06-20T01:26:46.987361   +x

    2023-06-20T01:26:47.091331  / # #

    2023-06-20T01:26:47.191970  export SHELL=3D/bin/sh

    2023-06-20T01:26:47.192169  #

    2023-06-20T01:26:47.292697  / # export SHELL=3D/bin/sh. /lava-10823926/=
environment

    2023-06-20T01:26:47.292885  =


    2023-06-20T01:26:47.393420  / # . /lava-10823926/environment/lava-10823=
926/bin/lava-test-runner /lava-10823926/1

    2023-06-20T01:26:47.393695  =


    2023-06-20T01:26:47.398242  / # /lava-10823926/bin/lava-test-runner /la=
va-10823926/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649100d08b4274f68b306195

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649100d08b4274f68b306=
196
        failing since 1 day (last pass: v6.4-rc6-301-ga3b6bb6457ef, first f=
ail: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/649102fde4762a51623061a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649102fde4762a5162306=
1a8
        failing since 40 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649103dd49d0b6746830618a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649103dd49d0b67468306=
18b
        failing since 12 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649107f37ecaa23f0d306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649107f37ecaa23f0d306=
13a
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6491082e9a0fc9e76c306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491082e9a0fc9e76c306=
146
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6491081c93e270730930614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491081c93e2707309306=
14b
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6491076eb8ffe272c630616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491076eb8ffe272c6306=
16c
        failing since 120 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64910b84663480d52330615d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64910b84663480d=
523306164
        new failure (last pass: v6.4-rc7-110-gdab158ce7741)
        2 lines

    2023-06-20T02:13:09.059084  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-06-20T02:13:09.060057  kern  :emerg : Code<8>[   15.657320] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2023-06-20T02:13:09.061106  : d2800028<8>[   15.664160] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 3679544_1.5.2.4.1>
    2023-06-20T02:13:09.062085   d2e02809 f2e00808 17ffffd1 (d4210000) =

    2023-06-20T02:13:09.063079  + set +x   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/64910b84663480d5=
23306166
        new failure (last pass: v6.4-rc7-110-gdab158ce7741)
        1 lines

    2023-06-20T02:13:08.444390  / # =

    2023-06-20T02:13:08.452790  =

    2023-06-20T02:13:08.566084  / # #
    2023-06-20T02:13:08.580669  #
    2023-06-20T02:13:08.684925  / # export SHELL=3D/bin/sh
    2023-06-20T02:13:08.692648  export SHELL=3D/bin/sh
    2023-06-20T02:13:08.795813  / # . /lava-3679544/environment
    2023-06-20T02:13:08.804580  . /lava-3679544/environment
    2023-06-20T02:13:08.907878  / # /lava-3679544/bin/lava-test-runner /lav=
a-3679544/0
    2023-06-20T02:13:08.916564  /lava-3679544/bin/lava-test-runner /lava-36=
79544/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649107e58cd88019183061ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649107e58cd8801918306=
1cb
        failing since 132 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649112a483141bb945306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649112a483141bb945306=
155
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649106fefe0f9e7773306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649106fefe0f9e7773306=
142
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64911b5052d62f9303306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64911b5052d62f9303306=
154
        failing since 141 days (last pass: v6.2-rc5-286-g436294605dc5, firs=
t fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6491060cb22458b828306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491060cb22458b828306=
141
        failing since 42 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64910624fbcba9b080306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64910624fbcba9b080306=
137
        failing since 54 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6491049c7cab9560ff30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491049c7cab9560ff306=
12f
        failing since 42 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64910618458afc7d3730612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64910618458afc7d37306=
130
        failing since 54 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6491089987e38092623061c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/bas=
eline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/bas=
eline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491089987e3809262306=
1c3
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64910f2a950494e6c430615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64910f2a950494e6c4306=
15b
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/649105a244d68e258930616a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649105a244d68e2589306=
16b
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6491057d0e2a3aa98f30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491057d0e2a3aa98f306=
12f
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6490fd484bb7b7df9830629f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6490fd484bb7b7df98306=
2a0
        failing since 1 day (last pass: v6.4-rc6-301-ga3b6bb6457ef, first f=
ail: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6491020c23f6d068b330616d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491020c23f6d068b3306=
16e
        failing since 186 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6491002c6e6cf553d9306159

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491002c6e6cf553d9306=
15a
        failing since 186 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6491002ab81df5fbbb306137

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6491002ab81df5fbbb30613c
        failing since 139 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-20T01:25:39.189618  [   30.056851] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3679297_1.5.2.4.1>
    2023-06-20T01:25:39.294083  =

    2023-06-20T01:25:39.395598  / # #export SHELL=3D/bin/sh
    2023-06-20T01:25:39.396012  =

    2023-06-20T01:25:39.497942  / # export SHELL=3D/bin/sh. /lava-3679297/e=
nvironment
    2023-06-20T01:25:39.498332  =

    2023-06-20T01:25:39.599735  / # . /lava-3679297/environment/lava-367929=
7/bin/lava-test-runner /lava-3679297/1
    2023-06-20T01:25:39.601082  =

    2023-06-20T01:25:39.604293  / # /lava-3679297/bin/lava-test-runner /lav=
a-3679297/1
    2023-06-20T01:25:39.640147  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64910295001ad2b79e306148

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910295001ad2b79e30614d
        failing since 139 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-20T01:35:58.934704  [   28.871820] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3679484_1.5.2.4.1>
    2023-06-20T01:35:59.039199  =

    2023-06-20T01:35:59.141416  / # #export SHELL=3D/bin/sh
    2023-06-20T01:35:59.141800  =

    2023-06-20T01:35:59.243495  / # export SHELL=3D/bin/sh. /lava-3679484/e=
nvironment
    2023-06-20T01:35:59.244037  =

    2023-06-20T01:35:59.345701  / # . /lava-3679484/environment/lava-367948=
4/bin/lava-test-runner /lava-3679484/1
    2023-06-20T01:35:59.346795  =

    2023-06-20T01:35:59.350345  / # /lava-3679484/bin/lava-test-runner /lav=
a-3679484/1
    2023-06-20T01:35:59.388089  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64910385e97a2b6152306161

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64910385e97a2b6152306166
        failing since 139 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-20T01:40:01.024286  [   30.181332] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3679556_1.5.2.4.1>
    2023-06-20T01:40:01.129054  =

    2023-06-20T01:40:01.230601  / # #export SHELL=3D/bin/sh
    2023-06-20T01:40:01.231024  =

    2023-06-20T01:40:01.332338  / # export SHELL=3D/bin/sh. /lava-3679556/e=
nvironment
    2023-06-20T01:40:01.332823  =

    2023-06-20T01:40:01.434073  / # . /lava-3679556/environment/lava-367955=
6/bin/lava-test-runner /lava-3679556/1
    2023-06-20T01:40:01.434836  =

    2023-06-20T01:40:01.438204  / # /lava-3679556/bin/lava-test-runner /lav=
a-3679556/1
    2023-06-20T01:40:01.474432  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649106eda63cb4857b30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649106eda63cb4857b306=
140
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649107cd8cd8801918306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649107cd8cd8801918306=
144
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649100c98b4274f68b30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649100c98b4274f68b306=
130
        failing since 5 days (last pass: v6.4-rc5-294-gda90eaebfb79, first =
fail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/649103431e80c5986030619d

  Results:     40 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/649103431e80c59=
8603061c8
        new failure (last pass: v6.4-rc7-110-gdab158ce7741)
        2 lines

    2023-06-20T01:38:52.483939  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-06-20T01:38:52.489444  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-06-20T01:38:52.489833  kern  :alert : Data abort info:
    2023-06-20T01:38:52.495199  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2023-06-20T01:38:52.495523  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-06-20T01:38:52.504230  kern  :alert : [0030303461316331] address b=
etween user and kernel address ranges
    2023-06-20T01:38:52.519178  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP
    2023-06-20T01:38:52.524649  kern  :emerg : Code: f100805f 540003c8 f100=
405f 540000c3 (a9401c26) =

    2023-06-20T01:38:52.531985  <8>[   19.067638] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/649103431e80c59=
8603061c9
        new failure (last pass: v6.4-rc7-110-gdab158ce7741)
        11 lines

    2023-06-20T01:38:52.456137  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 0030303461316331
    2023-06-20T01:38:52.456453  kern  :alert : Mem abort info:
    2023-06-20T01:38:52.461783  kern  :alert :   ESR =3D 0x0000000096000004
    2023-06-20T01:38:52.467295  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-06-20T01:38:52.478535  kern  :alert :   SET =3D 0, FnV<8>[   19.01=
0814] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D11>
    2023-06-20T01:38:52.478852   =3D 0   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6491077d97b0428239306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6491077d97b0428239306=
135
        failing since 132 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64911c90da567fd89e306179

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-16=
4-g1f02f25057f7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64911c90da567fd89e306=
17a
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =20
