Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DD14A828A
	for <lists+linux-next@lfdr.de>; Thu,  3 Feb 2022 11:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiBCKld (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Feb 2022 05:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbiBCKlc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Feb 2022 05:41:32 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F5BC061714
        for <linux-next@vger.kernel.org>; Thu,  3 Feb 2022 02:41:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cq9-20020a17090af98900b001b8262fe2d5so3773589pjb.0
        for <linux-next@vger.kernel.org>; Thu, 03 Feb 2022 02:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1Juou6x3B6jSZuBPOnQzOjdXZnNBIb46vhgHPVKbrNg=;
        b=RwvTDLgivP/t/34fX4iBJdgBwe2YaS34ZShjM6Z+oycj6memVYaXleWMCPAP3sR1gX
         njgbH4u4DIMizeXLuWiJGcU3067wAsQt4FEwDOwHo7HwEKoTaFzr9/Xl1KrkTMPhfTuZ
         QGrjD89VMxh6WdI/gpZJ6P2iEcqsGODIQZih+tqKRUE7jtoPTdXA+sjs6lvWJLbT//3x
         jnRxh6ziQMew8j86GY7NJLd9Qed0vancgfUVshJzjfrINNB5uik1zAul90mIAkQVrsqX
         IVw0v2lCPKnzNIZgm/TAl/ij+m0zIG78M9KU8lNJN3dEILLn7xAGJ/jq4pTCjiFsct8X
         gxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1Juou6x3B6jSZuBPOnQzOjdXZnNBIb46vhgHPVKbrNg=;
        b=OSqigdMOS+molxk2/FlpkLLXHS7eHVoan3bH/UZ5Tq8rxkgoAG/IosE7GIRdyjOQcD
         /T8WJgyyE125FVp2b3ScGpSBY6kHbfDviApaov0PcPorGBmNSk9yjsPzy7j7VDGK8c5P
         4F/wg8PvRpaoGnp5BI8KWHietndVPlMwl4x3PJ1g7PzuguaHT7EOs+oN3lmYsYjoGsf+
         DXoT4q0Sa0i/nORXxpGV+TfqkaC3LnWCaxNCgQwhFErDjW/0RxTL3aH+6DWHsJkYgBtu
         5XxvkZKZ3StOmZi3I/s4N03XbXVoEeVchnZWuOWarWjwYyNxHg+/ivzYdnrDmhv9Mbv7
         Vjqg==
X-Gm-Message-State: AOAM53225qzIOu53BFNCghTO01utsgF6RCeJ5wslasEEZFEf8ybFyh+U
        8nv5+oHTj6EJ7MHBs8rPxLIOrEHigWAmVvqm
X-Google-Smtp-Source: ABdhPJxQRF3KemjAHPgn7singcjD5lbS2upvddI7Rj3zgV4Im26b8uslR49f2DPyCwm2FHfBvHd5Mw==
X-Received: by 2002:a17:902:9343:: with SMTP id g3mr36248009plp.11.1643884891897;
        Thu, 03 Feb 2022 02:41:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j10sm29154524pfu.93.2022.02.03.02.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 02:41:31 -0800 (PST)
Message-ID: <61fbb15b.1c69fb81.d79c6.cbc3@mx.google.com>
Date:   Thu, 03 Feb 2022 02:41:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220203
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 563 runs, 12 regressions (next-20220203)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 563 runs, 12 regressions (next-20220203)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-nxp         | clang-14 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220203/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220203
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2d3d8c7643a56bfe2e808f97d5a4360d49f3b45b =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-nxp         | clang-14 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb79d540a1db524b5d6f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb79d540a1db524b5d6=
f19
        new failure (last pass: next-20220202) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb7a57265563079b5d7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb7a57265563079b5d7=
086
        failing since 42 days (last pass: next-20211221, first fail: next-2=
0211222) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb7e294739669cd45d6efd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb7e294739669cd45d6=
efe
        failing since 51 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb92c43350988ddf5d6ef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb92c43350988ddf5d6=
ef8
        failing since 51 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb832eee0d392eca5d6f21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb832eee0d392eca5d6=
f22
        failing since 51 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb7e244739669cd45d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb7e244739669cd45d6=
ee9
        failing since 50 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb7f0f000cf7ddf05d6f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb7f0f000cf7ddf05d6=
f1b
        failing since 50 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb91afa37fa547845d6eea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb91afa37fa547845d6=
eeb
        failing since 50 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb832a9da64ef7335d6ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb832a9da64ef7335d6=
ef4
        failing since 50 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb770a1c77cfc3365d6ef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb770a1c77cfc3365d6=
ef9
        new failure (last pass: next-20220201) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb7974f8bf9521255d6f6e

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61fb7974f8bf9521255d6f90
        failing since 10 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-03T06:42:43.434418  <4>[   22.944693] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-03T06:42:43.770702  /lava-5600862/1/../bin/lava-test-case
    2022-02-03T06:42:43.781565  <8>[   23.293249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb795bac60fa14da5d6f14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220203/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb795bac60fa14da5d6=
f15
        new failure (last pass: next-20220201) =

 =20
