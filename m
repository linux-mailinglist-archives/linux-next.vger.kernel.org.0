Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130C3695804
	for <lists+linux-next@lfdr.de>; Tue, 14 Feb 2023 05:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjBNEwH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Feb 2023 23:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBNEwG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2023 23:52:06 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90FD2D51
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 20:51:59 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id e1so4691177pgg.9
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 20:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VzDiliY0ZIwktjPy2jd3gRrNAQH5u6zIe8Rn7HWKTyg=;
        b=H34TDQw+KjiVf/XLmDot367cr2Z321SqQEcsB6Ky+w842KwoGfTlMvjxmUI2LBXqpq
         s9LfyDbzFwA5UMSmZn7NPkJ75sX46m4KiAy/mRB19FTINozxswkDAMlSlv9cFle1I2GF
         Lh8A8iZ8rFjsd2B+OyLoUcHktwsPZV+QOzO/q2HgZEm8bzrKvL3SbkzD1XK6YSCkXgFd
         UYg/deQcazNZKl6VNbuNnIp+m6t00EFZfn8obzovvrPZng29SqIJ8G3SlteOsCu/GR88
         9VRP1wk1ucdxRKv9dFm0Rav7GtaBsymoKQoeCreeDeDUkMQP8D2X9R5UhnAD0/0b4fjL
         VFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzDiliY0ZIwktjPy2jd3gRrNAQH5u6zIe8Rn7HWKTyg=;
        b=Ihr7PFSRO4LknltpV2yG+6NoqJU+6IMgps0WyE0ijLWImmBfwsZ8rwN2AaiZVJmUjh
         RTLn4P3STKvba2zX02A20y+bt55QL5f52CrjI1Ss9fxxSkDPFODOhmIKEP2ILuUsoRUR
         B4JY01KmhgFegs8mdoKtEQezfUFfsWC7a4rw2Mbq89Z+RB/mVvrtnTFKHlPJ7HypKKoj
         0cfXVNd/EaummUchu1b9ndd6phkr8wxdwHaQZCUI+uZ5eawbUMQv8OUTIYhu968Q3wiL
         GAcCyzZ3ktVmV5HLmGTL8QVIzCldJsNSsV601sB7U+vnLX93fgYu9YY57R7G7OJrRAZN
         hynA==
X-Gm-Message-State: AO0yUKW5tY/V7wYOe1+n26e1FIcaCQ9HeHIaBxa0TFUWgwUwhN/OnYPl
        rTekibntehz9kpBQO5RGf/15Ko0RhsblGtcy
X-Google-Smtp-Source: AK7set+pcAymsrs8k9Z4KDvsuIxU/HlrtlLPmw/FjWpt/XqcC6g+zmCTyN+9SP0McgUUe6FxP6Zj8Q==
X-Received: by 2002:a62:5f06:0:b0:5a8:ac1b:5b02 with SMTP id t6-20020a625f06000000b005a8ac1b5b02mr807288pfb.3.1676350317630;
        Mon, 13 Feb 2023 20:51:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b8-20020aa78108000000b005a79596c795sm8760980pfi.29.2023.02.13.20.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 20:51:57 -0800 (PST)
Message-ID: <63eb136d.a70a0220.4329.032c@mx.google.com>
Date:   Mon, 13 Feb 2023 20:51:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-rc8-94-g11ce0876aa1c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 652 runs,
 90 regressions (v6.2-rc8-94-g11ce0876aa1c)
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

next/pending-fixes baseline: 652 runs, 90 regressions (v6.2-rc8-94-g11ce087=
6aa1c)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc8-94-g11ce0876aa1c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc8-94-g11ce0876aa1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      11ce0876aa1cb63cf0fdd176eb6bd9643be5ea99 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae183bee96c6cc28c86ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae183bee96c6cc28c8=
6af
        failing since 127 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63ead9e7474f95a1c78c8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rp=
i-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rp=
i-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63ead9e7474f95a1c78c865c
        failing since 1 day (last pass: v6.2-rc7-233-gd885c5e298888, first =
fail: v6.2-rc7-318-g73d40d27ae59c)

    2023-02-14T00:46:06.099510  + set +x
    2023-02-14T00:46:06.103870  <8>[   17.209164] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 8561_1.5.2.4.1>
    2023-02-14T00:46:06.216211  / # #
    2023-02-14T00:46:06.318584  export SHELL=3D/bin/sh
    2023-02-14T00:46:06.319055  #
    2023-02-14T00:46:06.420519  / # export SHELL=3D/bin/sh. /lava-8561/envi=
ronment
    2023-02-14T00:46:06.420966  =

    2023-02-14T00:46:06.522418  / # . /lava-8561/environment/lava-8561/bin/=
lava-test-runner /lava-8561/1
    2023-02-14T00:46:06.523282  =

    2023-02-14T00:46:06.529391  / # /lava-8561/bin/lava-test-runner /lava-8=
561/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63eada12c1823e321f8c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-=
rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-=
rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eada13c1823e321f8c864a
        failing since 33 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-14T00:46:58.434920  / # #

    2023-02-14T00:46:58.538393  export SHELL=3D/bin/sh

    2023-02-14T00:46:58.539338  #

    2023-02-14T00:46:58.641412  / # export SHELL=3D/bin/sh. /lava-9152272/e=
nvironment

    2023-02-14T00:46:58.642347  =


    2023-02-14T00:46:58.744621  / # . /lava-9152272/environment/lava-915227=
2/bin/lava-test-runner /lava-9152272/1

    2023-02-14T00:46:58.746293  =


    2023-02-14T00:46:58.754068  / # /lava-9152272/bin/lava-test-runner /lav=
a-9152272/1

    2023-02-14T00:46:58.870970  + export 'TESTRUN_ID=3D1_bootrr'

    2023-02-14T00:46:58.871502  + cd /lava-9152272/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfa759240b7a9c8c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfa759240b7a9c8c8=
653
        failing since 23 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd0f83a488955c8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd0f83a488955c8c8=
650
        failing since 6 days (last pass: v6.2-rc7-136-g39693c3ba989, first =
fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadcc4a5625c0e158c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eadcc4a5625c0e158c8648
        failing since 27 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-14T00:58:25.957886  <8>[   16.533835] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3334597_1.5.2.4.1>
    2023-02-14T00:58:26.064945  / # #
    2023-02-14T00:58:26.166369  export SHELL=3D/bin/sh
    2023-02-14T00:58:26.166866  #
    2023-02-14T00:58:26.268047  / # export SHELL=3D/bin/sh. /lava-3334597/e=
nvironment
    2023-02-14T00:58:26.268388  =

    2023-02-14T00:58:26.369517  / # . /lava-3334597/environment/lava-333459=
7/bin/lava-test-runner /lava-3334597/1
    2023-02-14T00:58:26.370190  =

    2023-02-14T00:58:26.374766  / # /lava-3334597/bin/lava-test-runner /lav=
a-3334597/1
    2023-02-14T00:58:26.467010  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf16f943ae1a4e8c8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubi=
etruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubi=
etruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eadf16f943ae1a4e8c8660
        failing since 27 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-14T01:08:10.271008  + set +x<8>[   14.594578] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3334680_1.5.2.4.1>
    2023-02-14T01:08:10.271767  =

    2023-02-14T01:08:10.380746  / # #
    2023-02-14T01:08:10.483577  export SHELL=3D/bin/sh
    2023-02-14T01:08:10.483945  <3>[   14.651875] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-02-14T01:08:10.484124  #
    2023-02-14T01:08:10.585306  / # export SHELL=3D/bin/sh. /lava-3334680/e=
nvironment
    2023-02-14T01:08:10.586166  =

    2023-02-14T01:08:10.688147  / # . /lava-3334680/environment/lava-333468=
0/bin/lava-test-runner /lava-3334680/1
    2023-02-14T01:08:10.689859   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf8ef05841f1dd8c8678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eadf8ef05841f1dd8c8680
        failing since 27 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-14T01:10:28.562495  <8>[   14.286932] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3334713_1.5.2.4.1>
    2023-02-14T01:10:28.670561  / # #
    2023-02-14T01:10:28.772206  export SHELL=3D/bin/sh
    2023-02-14T01:10:28.773332  #
    2023-02-14T01:10:28.875492  / # export SHELL=3D/bin/sh. /lava-3334713/e=
nvironment
    2023-02-14T01:10:28.876360  =

    2023-02-14T01:10:28.978393  / # . /lava-3334713/environment/lava-333471=
3/bin/lava-test-runner /lava-3334713/1
    2023-02-14T01:10:28.980171  =

    2023-02-14T01:10:28.984499  / # /lava-3334713/bin/lava-test-runner /lav=
a-3334713/1
    2023-02-14T01:10:29.073793  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae1ef57190f641b8c8643

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-c=
ubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-c=
ubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eae1ef57190f641b8c864c
        failing since 27 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-14T01:20:17.844388  + set +x<8>[   24.576896] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3334779_1.5.2.4.1>
    2023-02-14T01:20:17.844933  =

    2023-02-14T01:20:17.956132  / # #
    2023-02-14T01:20:18.059207  export SHELL=3D/bin/sh
    2023-02-14T01:20:18.060346  #
    2023-02-14T01:20:18.162493  / # export SHELL=3D/bin/sh. /lava-3334779/e=
nvironment
    2023-02-14T01:20:18.163368  =

    2023-02-14T01:20:18.265515  / # . /lava-3334779/environment/lava-333477=
9/bin/lava-test-runner /lava-3334779/1
    2023-02-14T01:20:18.266913  =

    2023-02-14T01:20:18.271418  / # /lava-3334779/bin/lava-test-runner /lav=
a-3334779/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae2753818253a838c8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietru=
ck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietru=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eae2753818253a838c863e
        failing since 27 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-14T01:22:46.401656  + set +x<8>[   13.621472] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3334874_1.5.2.4.1>
    2023-02-14T01:22:46.401997  =

    2023-02-14T01:22:46.508184  / # #
    2023-02-14T01:22:46.611192  export SHELL=3D/bin/sh
    2023-02-14T01:22:46.611591  #
    2023-02-14T01:22:46.611801  / # <3>[   13.771949] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-14T01:22:46.713057  export SHELL=3D/bin/sh. /lava-3334874/envir=
onment
    2023-02-14T01:22:46.714012  =

    2023-02-14T01:22:46.816007  / # . /lava-3334874/environment/lava-333487=
4/bin/lava-test-runner /lava-3334874/1
    2023-02-14T01:22:46.817799   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadb14b4345598738c863d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63eadb14b434559=
8738c8641
        failing since 386 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-02-14T00:51:06.986089  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-02-14T00:51:06.986744  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-02-14T00:51:06.989041  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-02-14T00:51:07.036690  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae20d59b679d2258c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae20d59b679d2258c8=
64f
        failing since 49 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadc88aa5f31703f8c8672

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eadc88aa5f31703f8c867b
        failing since 15 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-14T00:57:22.360740  + set +x
    2023-02-14T00:57:22.360915  [   12.004260] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905157_1.5.2.3.1>
    2023-02-14T00:57:22.467820  / # #
    2023-02-14T00:57:22.569344  export SHELL=3D/bin/sh
    2023-02-14T00:57:22.569717  #
    2023-02-14T00:57:22.670838  / # export SHELL=3D/bin/sh. /lava-905157/en=
vironment
    2023-02-14T00:57:22.671179  =

    2023-02-14T00:57:22.772308  / # . /lava-905157/environment/lava-905157/=
bin/lava-test-runner /lava-905157/1
    2023-02-14T00:57:22.772818  =

    2023-02-14T00:57:22.776023  / # /lava-905157/bin/lava-test-runner /lava=
-905157/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade7bf88f0ddda68c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eade7bf88f0ddda68c864e
        failing since 15 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-14T01:05:43.095808  + set +x
    2023-02-14T01:05:43.096039  [   12.870736] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905170_1.5.2.3.1>
    2023-02-14T01:05:43.204150  / # #
    2023-02-14T01:05:43.305899  export SHELL=3D/bin/sh
    2023-02-14T01:05:43.306346  #
    2023-02-14T01:05:43.407577  / # export SHELL=3D/bin/sh. /lava-905170/en=
vironment
    2023-02-14T01:05:43.408039  =

    2023-02-14T01:05:43.509332  / # . /lava-905170/environment/lava-905170/=
bin/lava-test-runner /lava-905170/1
    2023-02-14T01:05:43.510025  =

    2023-02-14T01:05:43.513944  / # /lava-905170/bin/lava-test-runner /lava=
-905170/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadecb93ea99fb018c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eadecb93ea99fb018c8676
        failing since 15 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-14T01:07:01.015193  + set +x
    2023-02-14T01:07:01.015539  [   12.636883] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905175_1.5.2.3.1>
    2023-02-14T01:07:01.122933  / # #
    2023-02-14T01:07:01.225142  export SHELL=3D/bin/sh
    2023-02-14T01:07:01.225588  #
    2023-02-14T01:07:01.326872  / # export SHELL=3D/bin/sh. /lava-905175/en=
vironment
    2023-02-14T01:07:01.327282  =

    2023-02-14T01:07:01.428579  / # . /lava-905175/environment/lava-905175/=
bin/lava-test-runner /lava-905175/1
    2023-02-14T01:07:01.429146  =

    2023-02-14T01:07:01.432482  / # /lava-905175/bin/lava-test-runner /lava=
-905175/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae137e1a3499e118c865e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eae137e1a3499e118c8667
        failing since 15 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-14T01:17:26.416348  + set +x
    2023-02-14T01:17:26.416706  [   16.119540] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905184_1.5.2.3.1>
    2023-02-14T01:17:26.524765  / # #
    2023-02-14T01:17:26.630288  export SHELL=3D/bin/sh
    2023-02-14T01:17:26.630988  #
    2023-02-14T01:17:26.732879  / # export SHELL=3D/bin/sh. /lava-905184/en=
vironment
    2023-02-14T01:17:26.733559  =

    2023-02-14T01:17:26.834877  / # . /lava-905184/environment/lava-905184/=
bin/lava-test-runner /lava-905184/1
    2023-02-14T01:17:26.835571  =

    2023-02-14T01:17:26.839031  / # /lava-905184/bin/lava-test-runner /lava=
-905184/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae227fc82cb00c48c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eae227fc82cb00c48c8648
        failing since 15 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-14T01:21:25.368515  + set +x
    2023-02-14T01:21:25.368866  [   12.881751] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905202_1.5.2.3.1>
    2023-02-14T01:21:25.477317  / # #
    2023-02-14T01:21:25.578976  export SHELL=3D/bin/sh
    2023-02-14T01:21:25.579482  #
    2023-02-14T01:21:25.680752  / # export SHELL=3D/bin/sh. /lava-905202/en=
vironment
    2023-02-14T01:21:25.681309  =

    2023-02-14T01:21:25.782585  / # . /lava-905202/environment/lava-905202/=
bin/lava-test-runner /lava-905202/1
    2023-02-14T01:21:25.783115  =

    2023-02-14T01:21:25.786562  / # /lava-905202/bin/lava-test-runner /lava=
-905202/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade0d51473057f48c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade0d51473057f48c8=
66f
        failing since 159 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadefed2653bc6bd8c86b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadefed2653bc6bd8c8=
6b7
        failing since 161 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd29d2a33cc2318c86a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd29d2a33cc2318c8=
6aa
        failing since 290 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eada506060a8dbfc8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-=
starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-=
starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eada506060a8dbfc8c8=
655
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf9359240b7a9c8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf9359240b7a9c8c8=
632
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfd1632a98d2528c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfd1632a98d2528c8=
654
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfd9632a98d2528c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfd9632a98d2528c8=
65a
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfc71150661ec08c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfc71150661ec08c8=
63d
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae019eb013321d08c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae019eb013321d08c8=
666
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf9d5714e8bc9a8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf9d5714e8bc9a8c8=
65a
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfe5813417e16c8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfe5813417e16c8c8=
658
        failing since 6 days (last pass: v6.2-rc6-351-gf42837eac380f, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf9f37539baa6e8c86a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf9f37539baa6e8c8=
6a2
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfd6813417e16c8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfd6813417e16c8c8=
643
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfff414a2c45ce8c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfff414a2c45ce8c8=
65f
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae019414a2c45ce8c8679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae019414a2c45ce8c8=
67a
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf9c37539baa6e8c869c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf9c37539baa6e8c8=
69d
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae3ef4f23ba89e68c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae3ef4f23ba89e68c8=
642
        failing since 14 days (last pass: v6.2-rc5-286-g436294605dc5, first=
 fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfce813417e16c8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfce813417e16c8c8=
63e
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf925714e8bc9a8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf925714e8bc9a8c8=
64f
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63eaddd528e38788078c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eaddd528e38788078c8=
640
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadb098179c4ff188c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cl=
oudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cl=
oudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadb098179c4ff188c8=
645
        failing since 124 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae6faa291fd934d8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qc=
om-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qc=
om-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae6faa291fd934d8c8=
64a
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63eaddf79659e94cff8c86ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eaddf79659e94cff8c8=
6ad
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfd7a28e77c9258c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_=
i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_=
i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfd7a28e77c9258c8=
63a
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae0bff3165844b68c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae0bff3165844b68c8=
638
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae4439bb4b86e568c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae4439bb4b86e568c8=
636
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadc3c0bca3f43c28c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bay=
libre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bay=
libre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadc3c0bca3f43c28c8=
640
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadce3366ee762c48c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x8=
6_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x8=
6_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadce3366ee762c48c8=
63c
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd0655a77f33798c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd0655a77f33798c8=
648
        new failure (last pass: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd9bb297e096008c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd9bb297e096008c8=
63e
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eaddaebe259c3aa38c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eaddaebe259c3aa38c8=
65f
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade4eaccf1346b48c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade4eaccf1346b48c8=
64d
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadef0789d2320528c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadef0789d2320528c8=
64d
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadefbd2653bc6bd8c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadefbd2653bc6bd8c8=
649
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd4f8b4da012728c8690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd4f8b4da012728c8=
691
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade026f9f6f52668c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade026f9f6f52668c8=
672
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadeb793ea99fb018c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadeb793ea99fb018c8=
64b
        new failure (last pass: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfbb4ab038d3418c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfbb4ab038d3418c8=
63a
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae033bbe1df00f08c8698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae033bbe1df00f08c8=
699
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae14ca3d07b143f8c867c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae14ca3d07b143f8c8=
67d
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae2c857d72b89898c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae2c857d72b89898c8=
64f
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae2ca8d36d1d6a18c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae2ca8d36d1d6a18c8=
648
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadc8015de7cacd18c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadc8015de7cacd18c8=
63e
        new failure (last pass: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd70161bd928e98c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd70161bd928e98c8=
679
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade61f88f0ddda68c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade61f88f0ddda68c8=
633
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadc3bf8e06b04968c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bay=
libre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bay=
libre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadc3bf8e06b04968c8=
66c
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadce0cd3d3bbb268c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadce0cd3d3bbb268c8=
651
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadce5366ee762c48c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadce5366ee762c48c8=
644
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd79c1cdb30b128c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd79c1cdb30b128c8=
64f
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eaddb0be259c3aa38c8673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eaddb0be259c3aa38c8=
674
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade4caccf1346b48c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade4caccf1346b48c8=
64a
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadeed789d2320528c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadeed789d2320528c8=
63b
        new failure (last pass: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadef108998a6fe78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadef108998a6fe78c8=
630
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadd4e8b4da012728c868d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadd4e8b4da012728c8=
68e
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eaddeebf1e762fe48c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eaddeebf1e762fe48c8=
651
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadeb85a761565118c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadeb85a761565118c8=
633
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfce4ab038d3418c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfce4ab038d3418c8=
641
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfd0a28e77c9258c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfd0a28e77c9258c8=
632
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae14ba3d07b143f8c8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae14ba3d07b143f8c8=
677
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae2c78d36d1d6a18c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae2c78d36d1d6a18c8=
642
        new failure (last pass: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae2ef76774f4d938c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae2ef76774f4d938c8=
654
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadc300d00f6f2728c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadc300d00f6f2728c8=
679
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade6090cc6cc88e8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade6090cc6cc88e8c8=
630
        new failure (last pass: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eade0f3ff80db05f8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eade0f3ff80db05f8c8=
630
        failing since 60 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadcd2a5625c0e158c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadcd2a5625c0e158c8=
65c
        failing since 60 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae005eb013321d08c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae005eb013321d08c8=
645
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadf89f05841f1dd8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadf89f05841f1dd8c8=
64a
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae0673191314bff8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae0673191314bff8c8=
63e
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfb07670f8b05b8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfb07670f8b05b8c8=
633
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eae0b8f3165844b68c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eae0b8f3165844b68c8=
631
        failing since 116 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadfa103ab8e72598c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadfa103ab8e72598c8=
636
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadeafce5bce5d7f8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadeafce5bce5d7f8c8=
642
        failing since 6 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eadec35a761565118c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc8-94=
-g11ce0876aa1c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eadec35a761565118c8=
645
        failing since 60 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
