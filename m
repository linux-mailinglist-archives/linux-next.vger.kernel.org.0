Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05219415C25
	for <lists+linux-next@lfdr.de>; Thu, 23 Sep 2021 12:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbhIWKp0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Sep 2021 06:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240314AbhIWKpZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Sep 2021 06:45:25 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92769C061574
        for <linux-next@vger.kernel.org>; Thu, 23 Sep 2021 03:43:54 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t1so5909886pgv.3
        for <linux-next@vger.kernel.org>; Thu, 23 Sep 2021 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ONIVEei7hhSMwjju6E8XE1mx8ob4u1iwWJlANzmZfws=;
        b=WaqNP3gGbMlc9PRiVmM7ln4pm1RND1Q3pfpa8QdMXP1iNYo6ln6yuMAKOeTus5/jT7
         RiTEavm9d9XtLAASL4adsGwYACApTvmXyP9Amk4Tu0YDI/OvhNcGWAr3trjxMoEKDyid
         vk5wIkmXnWKMfnaeJY7PqKasfnrkOKdgxklinUP7EkFmSCgZKnuLqou3urkE3JQRzgKp
         BDy8l/oAB5+ojVJThL6G7T67VvEstMAO6WAOr6BAy/rZtqsxQlBmqPiHfHCTStA5VZn/
         ak3X3d7DruCyiudghHbXARLa77vyw34eH8tiqllW673O19l8DvYiG3tBn7SPblAYxWMC
         caRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ONIVEei7hhSMwjju6E8XE1mx8ob4u1iwWJlANzmZfws=;
        b=KssJoX5tEn4XSzQiHTUP03Xc/bU7bXivJ0Qdf8wLffKesV2ksQclohAa7PFPyzSqmq
         0Pd2W4yFwMtgGFJcMw4nARvAjiEl0ERVHm9nr5PtnmR5EbDzh6b50b/Qp4rQNcFp0UWK
         G+QiDR2m3Ikfu55TDyr0YUKW+rzdeNf2S+Rj33DqzdKLshpnJuqZnQfEPjFUdBWs7vq1
         JHPrFUcEFKnUUEADZDNfGZATmdMKyoGWbT/7lhLvwIVv4KncFr8BC36WigcrvU8Qfxh8
         pz/AYkg4bZkpmTBvt9EbHm8eRrWvPeRbiPdtoyew78FTcazxrGxRlcOjeZWWeR5lSZ9M
         jcIg==
X-Gm-Message-State: AOAM5303MZp76HhEOLHL2d6r43cAkPBYzUJqd4Ju19Yb5LynzhLVpjLA
        oNNvdGQPVkg6DPSpyIN/r+CNs8Dd63J01mhi
X-Google-Smtp-Source: ABdhPJwJdc0V28jXm5kB+aAjFutvcRtL7r95OD04us2KEiNMfBLKUqYxhd9qF7QbqREqFL61d/WZrA==
X-Received: by 2002:a63:7010:: with SMTP id l16mr3577272pgc.32.1632393832968;
        Thu, 23 Sep 2021 03:43:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b12sm5290868pfp.5.2021.09.23.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 03:43:52 -0700 (PDT)
Message-ID: <614c5a68.1c69fb81.8312b.ecae@mx.google.com>
Date:   Thu, 23 Sep 2021 03:43:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210923
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 566 runs, 70 regressions (next-20210923)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 566 runs, 70 regressions (next-20210923)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

beagle-xm                | arm    | lab-baylibre    | clang-12 | multi_v7_d=
efconfig           | 1          =

beagle-xm                | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

fsl-ls1088a-rdb          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb          | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =

hifive-unleashed-a00     | riscv  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig =
                   | 1          =

imx7d-sdb                | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | clang-12 | defconfig =
                   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp         | clang-12 | defconfig =
                   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
crypto             | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
ima                | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
ima                | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
crypto             | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron     | gcc-8    | defconfig+=
crypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | clang-12 | x86_64_def=
config             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config+crypto      | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-vexpress-a15    | arm    | lab-baylibre    | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a15    | arm    | lab-cip         | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a15    | arm    | lab-collabora   | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a15    | arm    | lab-linaro-lkft | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-baylibre    | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-cip         | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-collabora   | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-linaro-lkft | gcc-8    | vexpress_d=
efconfig           | 1          =

qemu_i386                | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | clang-12 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | gcc-8    | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | clang-12 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | gcc-8    | i386_defco=
nfig               | 1          =

qemu_x86_64              | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =

rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
crypto             | 1          =

rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210923/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210923
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bc5aa70f26995791074a00da8b57ead3a9c1a646 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614c2076cfa90fba1299a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c2076cfa90fba1299a=
2db
        failing since 210 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
beagle-xm                | arm    | lab-baylibre    | clang-12 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1cf1087a2736ba99a2ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1cf1087a2736ba99a=
2ed
        failing since 10 days (last pass: next-20210908, first fail: next-2=
0210913) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
beagle-xm                | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1e59ad7c16c13099a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1e59ad7c16c13099a=
2df
        failing since 57 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c21a1f9e021896a99a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c21a1f9e021896a99a=
2fb
        failing since 306 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb          | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c258a5faa9ba34d99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c258a5faa9ba34d99a=
2db
        failing since 306 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00     | riscv  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1951792890331099a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1951792890331099a=
2f4
        failing since 146 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c20c944cd1af21b99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c20c944cd1af21b99a=
2ee
        failing since 84 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c23b698bab3dcee99a321

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c23b698bab3dcee99a=
322
        failing since 84 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hip07-d05                | arm64  | lab-collabora   | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c267d4c0f663eb799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c267d4c0f663eb799a=
2db
        failing since 84 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx7d-sdb                | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614c20d765c883374299a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c20d765c883374299a=
2e6
        failing since 2 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | clang-12 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c21d8b31532140f99a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c21d8b31532140f99a=
2df
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10921) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp         | clang-12 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c20b45dfbee368099a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c20b45dfbee368099a=
2f3
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10921) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ceb087a2736ba99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ceb087a2736ba99a=
2e8
        failing since 2 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ee04c20a7727999a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ee04c20a7727999a=
2dc
        failing since 0 day (last pass: next-20210914, first fail: next-202=
10922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c205cacecc42ecd99a363

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c205cacecc42ecd99a=
364
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c23550b7a931a9499a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c23550b7a931a9499a=
2f7
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre    | gcc-8    | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614c24d1e132927ec299a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c24d1e132927ec299a=
2e6
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1c901559c6686499a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1c901559c6686499a=
2ec
        failing since 0 day (last pass: next-20210914, first fail: next-202=
10922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1e9aad7c16c13099a32c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1e9aad7c16c13099a=
32d
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp         | gcc-8    | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614c20ffa9d5679b9e99a32f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c20ffa9d5679b9e99a=
330
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1e4a6cbb7622c399a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1e4a6cbb7622c399a=
2f0
        new failure (last pass: next-20210922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c204facecc42ecd99a349

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c204facecc42ecd99a=
34a
        new failure (last pass: next-20210922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c22908fee89534f99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c22908fee89534f99a=
2dc
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron     | gcc-8    | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ea8ad7c16c13099a350

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ea8ad7c16c13099a=
351
        new failure (last pass: next-20210922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | clang-12 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1a1e98c5ed9ffc99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-minnowboard-turbot-E382=
6.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-minnowboard-turbot-E382=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1a1e98c5ed9ffc99a=
2e9
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10921) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c18fcec5a49191599a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-minnowboard-turbot-E3826.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-minnowboard-turbot-E3826.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c18fcec5a49191599a=
2f3
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614c19644daa806c3699a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-minnowboard=
-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-minnowboard=
-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c19644daa806c3699a=
2de
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1a88c5ab8e860699a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-minnowboard-turbot-E38=
26.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-minnowboard-turbot-E38=
26.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1a88c5ab8e860699a=
2dc
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10922) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-8    | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1b6a9ada20ec3199a336

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1b6a9ada20ec3199a=
337
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1b6b9ea0ae833b99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1b6b9ea0ae833b99a=
2db
        failing since 309 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ba784dad5f22299a30f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ba784dad5f22299a=
310
        failing since 309 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614c47be6568ea1a0a99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c47be6568ea1a0a99a=
2db
        failing since 309 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614c31539292b3dc3f99a318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c31539292b3dc3f99a=
319
        failing since 309 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a15    | arm    | lab-baylibre    | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c17827a3639346899a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c17827a3639346899a=
2f6
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a15    | arm    | lab-cip         | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c17964a5bc7aec999a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c17964a5bc7aec999a=
2ea
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a15    | arm    | lab-collabora   | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c3693c63eb30bb799a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c3693c63eb30bb799a=
2f7
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a15    | arm    | lab-linaro-lkft | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c30ef1b723cce9999a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c30ef1b723cce9999a=
2e6
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a9     | arm    | lab-baylibre    | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c17837a3639346899a2f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c17837a3639346899a=
2fa
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a9     | arm    | lab-cip         | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c177ffc69e0579c99a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c177ffc69e0579c99a=
2f3
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a9     | arm    | lab-collabora   | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c36cf0c427f123799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c36cf0c427f123799a=
2db
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a9     | arm    | lab-linaro-lkft | gcc-8    | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/614c310525dad38ae199a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c310525dad38ae199a=
2e5
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c186d2eef6b3f8d99a2f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c186d2eef6b3f8d99a=
2f5
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | clang-12 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1971aff9f2bf7f99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1971aff9f2bf7f99a=
2ec
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | gcc-8    | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1886f2876e284099a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1886f2876e284099a=
2ef
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c185bcbb900a89199a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c185bcbb900a89199a=
2f4
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | clang-12 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c19634daa806c3699a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c19634daa806c3699a=
2db
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | gcc-8    | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614c18abe5673f83af99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c18abe5673f83af99a=
2dc
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1b3f496a8255e599a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1b3f496a8255e599a=
2e7
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c18d1ec5a49191599a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c18d1ec5a49191599a=
2e0
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614c192104e6890bc099a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c192104e6890bc099a=
2f1
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614c19c1365a240dc599a310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c19c1365a240dc599a=
311
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1bb72f2611122999a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1bb72f2611122999a=
2e6
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1d1d5e32ba8f3499a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1d1d5e32ba8f3499a=
2db
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1b3d496a8255e599a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1b3d496a8255e599a=
2e1
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c18c2ffa16bb11599a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c18c2ffa16bb11599a=
2e4
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614c192304e6890bc099a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c192304e6890bc099a=
2f4
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614c195fe568dc2dec99a334

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c195fe568dc2dec99a=
335
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ba784dad5f22299a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ba784dad5f22299a=
313
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ccffaa7d4d83199a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ccffaa7d4d83199a=
2e5
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | clang-12 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1a89cfd6b7fa3699a33c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1a89cfd6b7fa3699a=
33d
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c18bfffa16bb11599a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c18bfffa16bb11599a=
2e1
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614c192704e6890bc099a2f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c192704e6890bc099a=
2fa
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614c199e7234abe9ed99a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c199e7234abe9ed99a=
2fd
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1b7b20ff2617d999a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1b7b20ff2617d999a=
2e7
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1cf7f1b62d062d99a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1cf7f1b62d062d99a=
2ef
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1c497c64ba14e899a2ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1c497c64ba14e899a=
2ed
        failing since 2 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1d9df7c9ff4a0e99a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1d9df7c9ff4a0e99a=
2fb
        failing since 99 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614c1ef1fe8623578c99a307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c1ef1fe8623578c99a=
308
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/614c20965370bc0aa899a3d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c20965370bc0aa899a=
3d7
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3328-rock64            | arm64  | lab-baylibre    | gcc-8    | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614c21eab31532140f99a35d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210923/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614c21eab31532140f99a=
35e
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210920) =

 =20
