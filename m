Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82AEF6A1567
	for <lists+linux-next@lfdr.de>; Fri, 24 Feb 2023 04:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjBXDd2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Feb 2023 22:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBXDd1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2023 22:33:27 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149996A75
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 19:33:23 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id z20-20020a17090a8b9400b002372d7f823eso1434593pjn.4
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 19:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iEmr+SOXO14PHIi2jXGdQ6mTEB8PP58SOKlrG3Z4GUw=;
        b=QlpCK/Uxl7+2D77tKRHkGmTIUwANW8q5MyahfwAwXSvdL/O50Nbaw493L8mjxLr2nW
         9G1fLOPqMAfcdiozswx19/9BIwNIPnSFRyghiSvvcjEgSE1Z4/F+hkm9MsWgHmXFH9jI
         a8u5RIBJkysLiMxi03xNih4Sc+0bWu2GNmsmieDUw5w4qI8AL5XAOKaylV4CCF9FlgGB
         xLx1cYemb66b6pVUKL5r6ezOl+dMaeC9SJVXAc4+OEQsIpLt7MbTu2bYNER8oJldx0il
         3CmPpRFOOptWrOgKPDZIXchMJLwDr4D5mk+i+RhiquthCucaBa66VC79He0Gckju1DWL
         EJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEmr+SOXO14PHIi2jXGdQ6mTEB8PP58SOKlrG3Z4GUw=;
        b=ClhFmShTxFkvOXe1ge/5yhrm5Ukgjx3n5iZtDRqKZaAktdwnsmDlkNHcQcrFQ5BtGs
         27dt+Ggf9FPQUGwBP3mFRssiUd9jqVofarkuZCoYegiMmeqNhHH7KUO6Wko2RmrdJx+0
         7pOJ47DKDOdSy807HxfFljEEHxn+gHyP/QkEVAMNQ95LKbAxoIuyPZWNEOKQAHZupxTn
         99hxWjWFDzR5bIxikaEL8YzrXIObO/cGTiXJMRjT4kcTEMBW28IlfAkSR7zzcNS9veG2
         St2DF/CygIaIa5Y8tYymvzhxRrxlfBD+y+BDcIV73ByP3rA2HLUNQpR3/KVUaqdKup/r
         fxZg==
X-Gm-Message-State: AO0yUKXb5jPHyArYqkDWNmckoN0WH1lBm4ABXPYSONx1maB+bKdL5jzb
        o6yXB3GKNmExAnJBVG15ndi3vabyKxuQdNWW6g4=
X-Google-Smtp-Source: AK7set8E6ZowA3K336awseIBtsmUJrF0kJySb7PZR3UgE88pLVyC4iD/eeSCPUwPsUjAf46GZJMumg==
X-Received: by 2002:a17:903:2289:b0:19b:33c0:409e with SMTP id b9-20020a170903228900b0019b33c0409emr18652454plh.50.1677209600950;
        Thu, 23 Feb 2023 19:33:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ix3-20020a170902f80300b0019ac5d3ee9dsm4901689plb.157.2023.02.23.19.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 19:33:20 -0800 (PST)
Message-ID: <63f83000.170a0220.2e088.a6e2@mx.google.com>
Date:   Thu, 23 Feb 2023 19:33:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-8700-gab98cc06b683
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 516 runs,
 98 regressions (v6.2-8700-gab98cc06b683)
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

next/pending-fixes baseline: 516 runs, 98 regressions (v6.2-8700-gab98cc06b=
683)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-8700-gab98cc06b683/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-8700-gab98cc06b683
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ab98cc06b6836ebf9707a06c75bab739786d1f7b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f8104ac50500d2638c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f8104ac50500d2638c8=
65e
        failing since 137 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7faf29a80f346428c8631

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63f7faf29a80f34=
6428c8634
        new failure (last pass: v6.2-3304-g34939120e353)
        3 lines

    2023-02-23T23:46:30.228004  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-02-23T23:46:30.234648  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-02-23T23:46:30.241428  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-02-23T23:46:30.252112  <8>[   15.916341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f534815fb01f8d8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f534815fb01f8d8c8639
        failing since 43 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-23T23:22:07.476114  / # #

    2023-02-23T23:22:07.579832  export SHELL=3D/bin/sh

    2023-02-23T23:22:07.581034  #

    2023-02-23T23:22:07.683133  / # export SHELL=3D/bin/sh. /lava-9306540/e=
nvironment

    2023-02-23T23:22:07.684242  =


    2023-02-23T23:22:07.786013  / # . /lava-9306540/environment/lava-930654=
0/bin/lava-test-runner /lava-9306540/1

    2023-02-23T23:22:07.787479  =


    2023-02-23T23:22:07.796754  / # /lava-9306540/bin/lava-test-runner /lav=
a-9306540/1

    2023-02-23T23:22:07.913860  + export 'TESTRUN_ID=3D1_bootrr'

    2023-02-23T23:22:07.914296  + cd /lava-9306540/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f30b14aaf85bd18c8687

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3f7f30b14aaf85bd18c8696
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:12:56.096345  /usr/bin/tpm2_getcap

    2023-02-23T23:12:56.122811  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-23T23:12:56.131475  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-23T23:12:56.143713  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =


    2023-02-23T23:12:56.146196  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure

    2023-02-23T23:12:56.148747  ERROR: Unable to run tpm2_getcap

    2023-02-23T23:12:57.144508  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-23T23:12:57.153962  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-23T23:12:57.163401  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =


    2023-02-23T23:12:57.168437  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f3141fb50d8f1b8c8684

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f3151fb50d8f1b8c868d
        failing since 24 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-23T23:13:08.702338  + set +x
    2023-02-23T23:13:08.702520  [   13.183930] <LAVA_SIGNAL_ENDRUN 0_dmesg =
912102_1.5.2.3.1>
    2023-02-23T23:13:08.810258  / # #
    2023-02-23T23:13:08.911707  export SHELL=3D/bin/sh
    2023-02-23T23:13:08.912062  #
    2023-02-23T23:13:09.013195  / # export SHELL=3D/bin/sh. /lava-912102/en=
vironment
    2023-02-23T23:13:09.013578  =

    2023-02-23T23:13:09.114946  / # . /lava-912102/environment/lava-912102/=
bin/lava-test-runner /lava-912102/1
    2023-02-23T23:13:09.115497  =

    2023-02-23T23:13:09.119642  / # /lava-912102/bin/lava-test-runner /lava=
-912102/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f47dc9e56cfe328c8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f47dc9e56cfe328c8671
        failing since 24 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-23T23:19:03.607630  + set +x
    2023-02-23T23:19:03.608168  [   13.149676] <LAVA_SIGNAL_ENDRUN 0_dmesg =
912119_1.5.2.3.1>
    2023-02-23T23:19:03.715871  / # #
    2023-02-23T23:19:03.817774  export SHELL=3D/bin/sh
    2023-02-23T23:19:03.818252  #
    2023-02-23T23:19:03.919489  / # export SHELL=3D/bin/sh. /lava-912119/en=
vironment
    2023-02-23T23:19:03.919896  =

    2023-02-23T23:19:04.021069  / # . /lava-912119/environment/lava-912119/=
bin/lava-test-runner /lava-912119/1
    2023-02-23T23:19:04.021578  =

    2023-02-23T23:19:04.025338  / # /lava-912119/bin/lava-test-runner /lava=
-912119/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8f1bbc0cbc91b8c8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f8f1bbc0cbc91b8c8669
        failing since 24 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-23T23:38:04.671237  + set +x
    2023-02-23T23:38:04.671405  [   12.891370] <LAVA_SIGNAL_ENDRUN 0_dmesg =
912155_1.5.2.3.1>
    2023-02-23T23:38:04.778321  / # #
    2023-02-23T23:38:04.879897  export SHELL=3D/bin/sh
    2023-02-23T23:38:04.880395  #
    2023-02-23T23:38:04.981629  / # export SHELL=3D/bin/sh. /lava-912155/en=
vironment
    2023-02-23T23:38:04.982147  =

    2023-02-23T23:38:05.083474  / # . /lava-912155/environment/lava-912155/=
bin/lava-test-runner /lava-912155/1
    2023-02-23T23:38:05.084189  =

    2023-02-23T23:38:05.087460  / # /lava-912155/bin/lava-test-runner /lava=
-912155/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa95945a3f25458c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fa95945a3f25458c864a
        failing since 24 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-23T23:45:03.122194  + set +x
    2023-02-23T23:45:03.122397  [   12.177366] <LAVA_SIGNAL_ENDRUN 0_dmesg =
912165_1.5.2.3.1>
    2023-02-23T23:45:03.229939  / # #
    2023-02-23T23:45:03.331702  export SHELL=3D/bin/sh
    2023-02-23T23:45:03.332336  #
    2023-02-23T23:45:03.433830  / # export SHELL=3D/bin/sh. /lava-912165/en=
vironment
    2023-02-23T23:45:03.434397  =

    2023-02-23T23:45:03.536094  / # . /lava-912165/environment/lava-912165/=
bin/lava-test-runner /lava-912165/1
    2023-02-23T23:45:03.536781  =

    2023-02-23T23:45:03.540233  / # /lava-912165/bin/lava-test-runner /lava=
-912165/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fae544df489ab98c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fae544df489ab98c8648
        failing since 24 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-23T23:46:27.131944  + set +x
    2023-02-23T23:46:27.132109  [   16.272863] <LAVA_SIGNAL_ENDRUN 0_dmesg =
912168_1.5.2.3.1>
    2023-02-23T23:46:27.239748  / # #
    2023-02-23T23:46:27.341404  export SHELL=3D/bin/sh
    2023-02-23T23:46:27.341929  #
    2023-02-23T23:46:27.443308  / # export SHELL=3D/bin/sh. /lava-912168/en=
vironment
    2023-02-23T23:46:27.443860  =

    2023-02-23T23:46:27.545051  / # . /lava-912168/environment/lava-912168/=
bin/lava-test-runner /lava-912168/1
    2023-02-23T23:46:27.545625  =

    2023-02-23T23:46:27.549165  / # /lava-912168/bin/lava-test-runner /lava=
-912168/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fcd9be7917b5f98c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fcd9be7917b5f98c8=
632
        failing since 2 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7faf9f392f81aa08c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7faf9f392f81aa08c8=
642
        failing since 1 day (last pass: v6.2-3304-g34939120e353, first fail=
: v6.2-6789-g74c3b2e0a611) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa8276597efa388c86b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa8276597efa388c8=
6b9
        failing since 2 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fcc5c85852f4c18c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fcc5c85852f4c18c8=
654
        new failure (last pass: v6.2-6789-g74c3b2e0a611) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fc2c2096e1c8118c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-st=
arfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-st=
arfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fc2c2096e1c8118c8=
664
        failing since 16 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63f7f966ab69a870508c862f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/b=
aseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/b=
aseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f966ab69a870508c8636
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:40:05.293324  <8>[   21.354592] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 284046_1.5.2.4.1>
    2023-02-23T23:40:05.398846  / # #
    2023-02-23T23:40:05.500907  export SHELL=3D/bin/sh
    2023-02-23T23:40:05.501447  #
    2023-02-23T23:40:05.602855  / # export SHELL=3D/bin/sh. /lava-284046/en=
vironment
    2023-02-23T23:40:05.603388  =

    2023-02-23T23:40:05.704890  / # . /lava-284046/environment/lava-284046/=
bin/lava-test-runner /lava-284046/1
    2023-02-23T23:40:05.705680  =

    2023-02-23T23:40:05.710706  / # /lava-284046/bin/lava-test-runner /lava=
-284046/1
    2023-02-23T23:40:05.777786  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f7f966ab69a870508c863a
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:40:07.874838  /lava-284046/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f7f966ab69a870508c863c
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:40:08.934707  /lava-284046/1/../bin/lava-test-case
    2023-02-23T23:40:08.935101  <8>[   24.960685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-23T23:40:08.937007  /lava-284046/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f7f966ab69a870508c8641
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:40:10.009962  /lava-284046/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f7f966ab69a870508c8642
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:40:10.013032  <8>[   26.073406] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T23:40:11.067646  /lava-284046/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63f7fbbeaa24b1a8478c8691

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fbbeaa24b1a8478c8698
        failing since 1 day (last pass: v6.2-1218-g2d4a54ee969d, first fail=
: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:49:31.886214  + set +x
    2023-02-23T23:49:31.889249  <8>[   45.189078][  T185] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 284054_1.5.2.4.1>
    2023-02-23T23:49:32.024329  #
    2023-02-23T23:49:32.126401  / # #export SHELL=3D/bin/sh
    2023-02-23T23:49:32.127034  =

    2023-02-23T23:49:32.228803  / # export SHELL=3D/bin/sh. /lava-284054/en=
vironment
    2023-02-23T23:49:32.229468  =

    2023-02-23T23:49:32.330687  / # . /lava-284054/environment/lava-284054/=
bin/lava-test-runner /lava-284054/1
    2023-02-23T23:49:32.331612  =

    2023-02-23T23:49:32.337193  / # /lava-284054/bin/lava-test-runner /lava=
-284054/1 =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f7fbbeaa24b1a8478c869c
        failing since 1 day (last pass: v6.2-1218-g2d4a54ee969d, first fail=
: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:49:36.979392  /lava-284054/1/../bin/lava-test-case
    2023-02-23T23:49:37.100259  <8>[   50.398507][  T254] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f7fbbeaa24b1a8478c869e
        failing since 1 day (last pass: v6.2-1218-g2d4a54ee969d, first fail=
: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:49:38.642824  /lava-284054/1/../bin/lava-test-case
    2023-02-23T23:49:38.766793  <8>[   52.065508][  T264] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f7fbbeaa24b1a8478c86a3
        failing since 1 day (last pass: v6.2-1218-g2d4a54ee969d, first fail=
: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:49:41.709807  /lava-284054/1/../bin/lava-test-case
    2023-02-23T23:49:41.844754  <8>[   55.143355][  T295] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f7fbbeaa24b1a8478c86a4
        failing since 1 day (last pass: v6.2-1218-g2d4a54ee969d, first fail=
: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:49:43.124182  /lava-284054/1/../bin/lava-test-case
    2023-02-23T23:49:43.246245  <8>[   56.544155][  T301] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63f7fc23607cf2941c8c8641

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fc23607cf2941c8c8648
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:44.710745  / # #
    2023-02-23T23:51:44.812761  export SHELL=3D/bin/sh
    2023-02-23T23:51:44.813315  #
    2023-02-23T23:51:44.914910  / # export SHELL=3D/bin/sh. /lava-284056/en=
vironment
    2023-02-23T23:51:44.915478  =

    2023-02-23T23:51:45.016988  / # . /lava-284056/environment/lava-284056/=
bin/lava-test-runner /lava-284056/1
    2023-02-23T23:51:45.017829  =

    2023-02-23T23:51:45.023503  / # /lava-284056/bin/lava-test-runner /lava=
-284056/1
    2023-02-23T23:51:45.090585  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T23:51:45.091000  + <8>[   21.646785] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 284056_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f7fc23607cf2941c8c864c
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:47.184668  /lava-284056/1/../bin/lava-test-case
    2023-02-23T23:51:47.185065  <8>[   23.753436] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-23T23:51:47.185309  /lava-284056/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f7fc23607cf2941c8c864e
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:48.244254  /lava-284056/1/../bin/lava-test-case
    2023-02-23T23:51:48.244655  <8>[   24.790257] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-23T23:51:48.244900  /lava-284056/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f7fc23607cf2941c8c8653
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:49.319847  /lava-284056/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f7fc23607cf2941c8c8654
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:49.323040  <8>[   25.905082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T23:51:50.381785  /lava-284056/1/../bin/lava-test-case
    2023-02-23T23:51:50.382435  <8>[   26.926158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-23T23:51:50.382686  /lava-284056/1/../bin/lava-test-case
    2023-02-23T23:51:50.382911  <8>[   26.943621] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-23T23:51:50.383132  /lava-284056/1/../bin/lava-test-case
    2023-02-23T23:51:50.383346  <8>[   26.962728] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-02-23T23:51:50.383560  /lava-284056/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63f7fcae9d83949cce8c8650

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fcae9d83949cce8c8657
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:53:55.600171  / ##
    2023-02-23T23:53:55.701672  export SHELL=3D/bin/sh
    2023-02-23T23:53:55.702105   #
    2023-02-23T23:53:55.803519  / # export SHELL=3D/bin/sh. /lava-284065/en=
vironment
    2023-02-23T23:53:55.804182  =

    2023-02-23T23:53:55.905675  / # . /lava-284065/environment/lava-284065/=
bin/lava-test-runner /lava-284065/1
    2023-02-23T23:53:55.906563  =

    2023-02-23T23:53:55.912609  / # /lava-284065/bin/lava-test-runner /lava=
-284065/1
    2023-02-23T23:53:55.978577  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T23:53:55.978910  + <8>[   21.706543] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 284065_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f7fcae9d83949cce8c865b
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:53:58.072716  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:53:58.073116  <8>[   23.811535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-23T23:53:58.073365  /lava-284065/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f7fcae9d83949cce8c865d
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:53:59.132175  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:53:59.132458  <8>[   24.849485] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-23T23:53:59.132617  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:53:59.132762  <8>[   24.866171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-23T23:53:59.132905  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:53:59.133042  <8>[   24.886560] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-23T23:53:59.133292  /lava-284065/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f7fcae9d83949cce8c8662
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:54:00.208823  /lava-284065/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f7fcae9d83949cce8c8663
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:54:00.212085  <8>[   25.965506] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T23:54:01.266412  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:54:01.266703  <8>[   26.986802] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-23T23:54:01.266861  /lava-284065/1/../bin/lava-test-case
    2023-02-23T23:54:01.267008  <8>[   27.004099] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-23T23:54:01.267154  /lava-284065/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8e8b66e66db308c8651

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f8e8b66e66db308c865a
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:38:04.833242  / # #
    2023-02-23T23:38:04.934703  export SHELL=3D/bin/sh
    2023-02-23T23:38:04.935066  #
    2023-02-23T23:38:05.036197  / # export SHELL=3D/bin/sh. /lava-3370324/e=
nvironment
    2023-02-23T23:38:05.036535  =

    2023-02-23T23:38:05.036697  / # <3>[   18.247652] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:38:05.137857  . /lava-3370324/environment/lava-3370324/bi=
n/lava-test-runner /lava-3370324/1
    2023-02-23T23:38:05.138407  =

    2023-02-23T23:38:05.152354  / # /lava-3370324/bin/lava-test-runner /lav=
a-3370324/1
    2023-02-23T23:38:05.214289  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb04651276f3408c86b4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb04651276f3408c86bd
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:47:05.085428  =

    2023-02-23T23:47:05.186750  / # #export SHELL=3D/bin/sh
    2023-02-23T23:47:05.187208  =

    2023-02-23T23:47:05.288548  / # export SHELL=3D/bin/sh. /lava-3370415/e=
nvironment
    2023-02-23T23:47:05.288979  <3>[   18.143632] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:47:05.289221  =

    2023-02-23T23:47:05.390529  / # . /lava-3370415/environment/lava-337041=
5/bin/lava-test-runner /lava-3370415/1
    2023-02-23T23:47:05.391534  =

    2023-02-23T23:47:05.404127  / # /lava-3370415/bin/lava-test-runner /lav=
a-3370415/1
    2023-02-23T23:47:05.462009  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb53143a65f0258c869b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb53143a65f0258c86a4
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:48:23.034646  / # #
    2023-02-23T23:48:23.136454  export SHELL=3D/bin/sh
    2023-02-23T23:48:23.136951  #
    2023-02-23T23:48:23.238186  / # export SHELL=3D/bin/sh. /lava-3370442/e=
nvironment
    2023-02-23T23:48:23.238604  =

    2023-02-23T23:48:23.238842  / # <3>[   18.255660] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:48:23.340172  . /lava-3370442/environment/lava-3370442/bi=
n/lava-test-runner /lava-3370442/1
    2023-02-23T23:48:23.341239  =

    2023-02-23T23:48:23.357788  / # /lava-3370442/bin/lava-test-runner /lav=
a-3370442/1
    2023-02-23T23:48:23.414748  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f92411724164838c8674

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f92411724164838c867d
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:38:33.541298  <8>[   17.608848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-23T23:38:33.541544  + set +x
    2023-02-23T23:38:33.543584  <8>[   17.613899] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3370321_1.5.2.4.1>
    2023-02-23T23:38:33.649242  / # #
    2023-02-23T23:38:33.751125  export SHELL=3D/bin/sh
    2023-02-23T23:38:33.751510  #
    2023-02-23T23:38:33.852859  / # export SHELL=3D/bin/sh. /lava-3370321/e=
nvironment
    2023-02-23T23:38:33.853254  =

    2023-02-23T23:38:33.853499  / # <3>[   17.878707] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:38:33.954879  . /lava-3370321/environment/lava-3370321/bi=
n/lava-test-runner /lava-3370321/1 =

    ... (19 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb389878e91c658c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb389878e91c658c863b
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:47:56.790146  <8>[   17.451635] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3370416_1.5.2.4.1>
    2023-02-23T23:47:56.895353  / # #
    2023-02-23T23:47:56.997022  export SHELL=3D/bin/sh
    2023-02-23T23:47:56.997373  #
    2023-02-23T23:47:56.997604  / # export SHELL=3D/bin/sh<3>[   17.646245]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:47:57.098893  . /lava-3370416/environment
    2023-02-23T23:47:57.099244  =

    2023-02-23T23:47:57.200573  / # . /lava-3370416/environment/lava-337041=
6/bin/lava-test-runner /lava-3370416/1
    2023-02-23T23:47:57.201193  =

    2023-02-23T23:47:57.218759  / # /lava-3370416/bin/lava-test-runner /lav=
a-3370416/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb9e0a5a2d8d8f8c8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi=
-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi=
-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb9e0a5a2d8d8f8c865e
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:49:29.672114  <8>[   17.625617] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3370458_1.5.2.4.1>
    2023-02-23T23:49:29.777460  / # #
    2023-02-23T23:49:29.879605  export SHELL=3D/bin/sh
    2023-02-23T23:49:29.880298  #
    2023-02-23T23:49:29.981746  / # export SHELL=3D/bin/sh. /lava-3370458/e=
nvironment
    2023-02-23T23:49:29.982387  <3>[   17.861371] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:49:29.982635  =

    2023-02-23T23:49:30.084081  / # . /lava-3370458/environment/lava-337045=
8/bin/lava-test-runner /lava-3370458/1
    2023-02-23T23:49:30.085058  =

    2023-02-23T23:49:30.095872  / # /lava-3370458/bin/lava-test-runner /lav=
a-3370458/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fc24607cf2941c8c86a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fc24607cf2941c8c86ab
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:51:23.281064  + set +x<8>[   18.694235] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3370474_1.5.2.4.1>
    2023-02-23T23:51:23.388446  / # #
    2023-02-23T23:51:23.490551  export SHELL=3D/bin/sh
    2023-02-23T23:51:23.491071  #
    2023-02-23T23:51:23.592483  / # export SHELL=3D/bin/sh. /lava-3370474/e=
nvironment
    2023-02-23T23:51:23.593249  =

    2023-02-23T23:51:23.694929  / # . /lava-3370474/environment/lava-337047=
4/bin/lava-test-runner /lava-3370474/1
    2023-02-23T23:51:23.695806  =

    2023-02-23T23:51:23.696036  / # /lava-3370474/bin/<3>[   19.090244] mmc=
0: error -84 whilst initialising SD card
    2023-02-23T23:51:23.701848  lava-test-runner /lava-3370474/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f92211724164838c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f92211724164838c8659
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:38:44.554490  + set +x
    2023-02-23T23:38:44.556574  <8>[   18.147923] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3370316_1.5.2.4.1>
    2023-02-23T23:38:44.661760  / # #
    2023-02-23T23:38:44.763458  export SHELL=3D/bin/sh
    2023-02-23T23:38:44.763852  #
    2023-02-23T23:38:44.865188  / # export SHELL=3D/bin/sh. /lava-3370316/e=
nvironment
    2023-02-23T23:38:44.865551  =

    2023-02-23T23:38:44.966936  / # . /lava-3370316/environment/lava-337031=
6/bin/lava-test-runner /lava-3370316/1
    2023-02-23T23:38:44.967609  =

    2023-02-23T23:38:44.971326  / # /lava-3370316/bin/lava-test-runner /lav=
a-3370316/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb60143a65f0258c8742

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb60143a65f0258c874a
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:48:18.039335  / # #
    2023-02-23T23:48:18.141032  export SHELL=3D/bin/sh
    2023-02-23T23:48:18.141390  #
    2023-02-23T23:48:18.242714  / # export SHELL=3D/bin/sh. /lava-3370422/e=
nvironment
    2023-02-23T23:48:18.243091  =

    2023-02-23T23:48:18.344502  / # . /lava-3370422/environment/lava-337042=
2/bin/lava-test-runner /lava-3370422/1
    2023-02-23T23:48:18.345223  =

    2023-02-23T23:48:18.350646  / # /lava-3370422/bin/lava-test-runner /lav=
a-3370422/1
    2023-02-23T23:48:18.430552  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T23:48:18.431177  + cd /lava-3370422/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fbd7c9b24abb768c864b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fbd7c9b24abb768c8654
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:50:23.928967  / # #
    2023-02-23T23:50:24.031242  export SHELL=3D/bin/sh
    2023-02-23T23:50:24.031811  #
    2023-02-23T23:50:24.134001  / # export SHELL=3D/bin/sh. /lava-3370467/e=
nvironment
    2023-02-23T23:50:24.134409  =

    2023-02-23T23:50:24.235588  / # . /lava-3370467/environment/lava-337046=
7/bin/lava-test-runner /lava-3370467/1
    2023-02-23T23:50:24.236438  =

    2023-02-23T23:50:24.253670  / # /lava-3370467/bin/lava-test-runner /lav=
a-3370467/1
    2023-02-23T23:50:24.285680  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T23:50:24.325470  + cd /lava-3370467/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fc5ae51dc4d9328c8838

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fc5ae51dc4d9328c8841
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:52:23.339727  / # #
    2023-02-23T23:52:23.441949  export SHELL=3D/bin/sh
    2023-02-23T23:52:23.442546  #
    2023-02-23T23:52:23.544134  / # export SHELL=3D/bin/sh. /lava-3370473/e=
nvironment
    2023-02-23T23:52:23.544754  =

    2023-02-23T23:52:23.646338  / # . /lava-3370473/environment/lava-337047=
3/bin/lava-test-runner /lava-3370473/1
    2023-02-23T23:52:23.647244  =

    2023-02-23T23:52:23.664150  / # /lava-3370473/bin/lava-test-runner /lav=
a-3370473/1
    2023-02-23T23:52:23.735969  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T23:52:23.736320  + cd /lava-3370473/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fc56c6a47b0a968c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-=
vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-=
vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fc56c6a47b0a968c8=
63b
        new failure (last pass: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8e63dfe9bc9b18c869d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7f8e63dfe9bc9b18c86a6
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-23T23:38:05.533624  <8>[   17.787544] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3370320_1.5.2.4.1>
    2023-02-23T23:38:05.636796  / # #
    2023-02-23T23:38:05.738495  export SHELL=3D/bin/sh
    2023-02-23T23:38:05.739043  #
    2023-02-23T23:38:05.840268  / # export SHELL=3D/bin/sh. /lava-3370320/e=
nvironment
    2023-02-23T23:38:05.840675  =

    2023-02-23T23:38:05.840893  / # <3>[   18.031788] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:38:05.942153  . /lava-3370320/environment/lava-3370320/bi=
n/lava-test-runner /lava-3370320/1
    2023-02-23T23:38:05.942831  =

    2023-02-23T23:38:05.948245  / # /lava-3370320/bin/lava-test-runner /lav=
a-3370320/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb05651276f3408c86ca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb05651276f3408c86d3
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:47:06.020743  / # #
    2023-02-23T23:47:06.122427  export SHELL=3D/bin/sh
    2023-02-23T23:47:06.122804  #
    2023-02-23T23:47:06.224152  / # export SHELL=3D/bin/sh. /lava-3370430/e=
nvironment
    2023-02-23T23:47:06.224529  =

    2023-02-23T23:47:06.224760  / # <3>[   18.139773] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:47:06.326150  . /lava-3370430/environment/lava-3370430/bi=
n/lava-test-runner /lava-3370430/1
    2023-02-23T23:47:06.327436  =

    2023-02-23T23:47:06.341115  / # /lava-3370430/bin/lava-test-runner /lav=
a-3370430/1
    2023-02-23T23:47:06.397997  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb66f1165c42858c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7fb66f1165c42858c8653
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:48:46.247272  / # #
    2023-02-23T23:48:46.349833  export SHELL=3D/bin/sh
    2023-02-23T23:48:46.350215  #
    2023-02-23T23:48:46.451603  / # export SHELL=3D/bin/sh. /lava-3370448/e=
nvironment
    2023-02-23T23:48:46.452339  <3>[   18.092010] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T23:48:46.452834  =

    2023-02-23T23:48:46.554576  / # . /lava-3370448/environment/lava-337044=
8/bin/lava-test-runner /lava-3370448/1
    2023-02-23T23:48:46.555640  =

    2023-02-23T23:48:46.560360  / # /lava-3370448/bin/lava-test-runner /lav=
a-3370448/1
    2023-02-23T23:48:46.603225  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f4cbbdc6a03ed88c865b

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63f=
7f4cbbdc6a03ed88c86ae
        new failure (last pass: v6.2-1218-g2d4a54ee969d)

    2023-02-23T23:20:15.910309  /lava-9306570/1/../bin/lava-test-case

    2023-02-23T23:20:15.920403  <8>[   22.951792] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa29f1512db6318c87ae

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63f=
7fa29f1512db6318c8801
        failing since 1 day (last pass: v6.2-rc8-211-g05def2d212c6, first f=
ail: v6.2-3304-g34939120e353)

    2023-02-23T23:43:13.919180  /lava-9307124/1/../bin/lava-test-case

    2023-02-23T23:43:13.925275  <8>[   23.109069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f5b2a82856faf98c8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clou=
dengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clou=
dengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f5b2a82856faf98c8=
677
        failing since 134 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f5785ffa8fb8f18c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f5785ffa8fb8f18c8=
662
        failing since 6 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa769857f978168c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i3=
86-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i3=
86-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa769857f978168c8=
63b
        failing since 4 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f859a71b3c090e8c86ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f859a71b3c090e8c8=
6ad
        failing since 6 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f800b7b2e8da100b8c870f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i38=
6-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i38=
6-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f800b7b2e8da100b8c8=
710
        failing since 4 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f4ec7344dd5d798c86cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f4ec7344dd5d798c8=
6d0
        failing since 6 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8d5facdc3d7888c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f8d5facdc3d7888c8=
658
        failing since 4 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f4b051f4fc7ebf8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f4b051f4fc7ebf8c8=
650
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f6ba598812cd948c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f6ba598812cd948c8=
630
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8b99029a4dbcf8c8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f8b99029a4dbcf8c8=
682
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa6b66c5ee568a8c8732

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa6b66c5ee568a8c8=
733
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa7276597efa388c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayli=
bre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayli=
bre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa7276597efa388c8=
633
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa7376597efa388c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa7376597efa388c8=
636
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa9abde680fbbe8c8922

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/base=
line-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/base=
line-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa9abde680fbbe8c8=
923
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fb0bf392f81aa08c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fb0bf392f81aa08c8=
655
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f6c9ab6f585b0e8c8710

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f6c9ab6f585b0e8c8=
711
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa9ebf0774433e8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa9ebf0774433e8c8=
63b
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fd5a779f0fc12a8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fd5a779f0fc12a8c8=
641
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7ff3a8f6c0442308c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7ff3a8f6c0442308c8=
65e
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7ff64422daca4ec8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broon=
ie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broon=
ie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7ff64422daca4ec8c8=
63e
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7ffb34d9262783a8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7ffb34d9262783a8c8=
652
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f800f39c2152dff38c86c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/basel=
ine-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/basel=
ine-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f800f39c2152dff38c8=
6c8
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f801a89ee0e58cf28c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f801a89ee0e58cf28c8=
642
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f7082f4d45f6f88c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f7082f4d45f6f88c8=
636
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f900a3dd6634d38c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f900a3dd6634d38c8=
659
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f4ea66c4ccf3728c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f4ea66c4ccf3728c8=
635
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f6be8915721f2c8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f6be8915721f2c8c8=
63d
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8bc9029a4dbcf8c8684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f8bc9029a4dbcf8c8=
685
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa6dc497a1572a8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa6dc497a1572a8c8=
658
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa7076597efa388c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayli=
bre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayli=
bre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa7076597efa388c8=
630
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa7576597efa388c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa7576597efa388c8=
639
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7faa977ab8377f68c8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/base=
line-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/base=
line-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7faa977ab8377f68c8=
663
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fafaf61774607c8c8697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fafaf61774607c8c8=
698
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f6f13f1de586eb8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f6f13f1de586eb8c8=
640
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fa9fbde680fbbe8c8927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fa9fbde680fbbe8c8=
928
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fd5b779f0fc12a8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fd5b779f0fc12a8c8=
646
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7ff4f1920faaedf8c86c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7ff4f1920faaedf8c8=
6c3
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7ff631d6dc0f4e68c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broon=
ie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broon=
ie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7ff631d6dc0f4e68c8=
63a
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f8000377a10876028c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f8000377a10876028c8=
630
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f800df9c2152dff38c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/basel=
ine-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/basel=
ine-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f800df9c2152dff38c8=
680
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f801a7ce708ae20f8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f801a7ce708ae20f8c8=
63f
        failing since 9 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f5dcd0f1c33b618c86be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f5dcd0f1c33b618c8=
6bf
        failing since 4 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f5c0df360416e58c8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f5c0df360416e58c8=
677
        failing since 2 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fc640a6da8dd4c8c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fc640a6da8dd4c8c8=
653
        failing since 70 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7f8b79029a4dbcf8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7f8b79029a4dbcf8c8=
67f
        failing since 70 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7faa177ab8377f68c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-l=
ibretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-l=
ibretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7faa177ab8377f68c8=
65b
        failing since 126 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7fd55779f0fc12a8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-8700-g=
ab98cc06b683/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7fd55779f0fc12a8c8=
63b
        failing since 70 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
