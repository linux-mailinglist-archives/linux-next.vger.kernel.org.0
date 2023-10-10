Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6CD7BFA28
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 13:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjJJLq3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 07:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbjJJLq2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 07:46:28 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0BAA4
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 04:46:22 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9b95943beso2737135ad.1
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696938382; x=1697543182; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TZmrPoEnwMvdAcEjGNIINBqE6ZUcU2VHXkPvmtzPu2Y=;
        b=NostW6FPwkQ7KzfTDEjFS4kgOb0AaZjIpVIabDjkd5G4oFik8umAwnkPdSmPo57U/D
         XEO+8xilJcNQegVi1E1E9uvYlc2afXM+WqmTrGII3LAWoHdM7iYTEVYoShnaamOJxJnm
         w+nlD+VUxSN5y3JZuFs0zJZT/35gd6ZuR3npsqT9ZXDS6f42zQeqyGFwP7AJs3xgrq7A
         5CJlXthIInJH7f7al+/F+UNwMRhElYHKkgF2tR7zE4AZC0UyU2E4I7JspR42QTNBOydH
         1O50uJfbG7e8Sdb3fqcdTPfNc7Y5ZqgRaEPevSH8K0pF5AkCyT+R4oM7TLK1hPDn5zzN
         5BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938382; x=1697543182;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZmrPoEnwMvdAcEjGNIINBqE6ZUcU2VHXkPvmtzPu2Y=;
        b=qfkuYuN1mt2dEfZb4fSTRCiZ9MBajSt1iIfDItDV7iZ4hNVQ+4T0X9d8fkwuA/iWQD
         yWvjAopQQCK/m1ZKQVjPuGybsb2u8lwXOt/TK71L2QnQLrpL725u71vNh15OE7uTvxCY
         ZBNnFhGhIReHXYmyxp0ktr8AzDLEY354I0z9LV+QSyOWWRN5Rg0Roy0TeRrQ0/5QyxYa
         /cIl6m4WT8UFLxOcjrFkReMu7Xol8JMoB9rvfNq8upU6QJw/MftQ4WO1wVN4qiUqskj2
         DuVGrE+zwAzMfeGo3Ta9l4kU8Otj1i5mhhA1hFlpwR6hbCaW5h28Slx1LIYPb3qKLTdF
         80MQ==
X-Gm-Message-State: AOJu0Yx7HbyN/ZDbw+PfNWRf+8vJGXjU5J4Ss8hWaXuPRQbLvBNvIdHq
        IxaCoOBH1vaCh8hcGLVCyVWFggyZi//2fD7CHDbzZg==
X-Google-Smtp-Source: AGHT+IEjGnx56KHGkePVuBiTpAB0ZQ/zLeq/fkvVLHDetzcPcMNaNFhWHx1B1u+03lYkaL/9aHXwfg==
X-Received: by 2002:a17:903:32c8:b0:1c8:952c:603e with SMTP id i8-20020a17090332c800b001c8952c603emr13626226plr.49.1696938380680;
        Tue, 10 Oct 2023 04:46:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001bdc8a5e96csm11567906plc.169.2023.10.10.04.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 04:46:19 -0700 (PDT)
Message-ID: <6525398b.170a0220.85f83.d7ed@mx.google.com>
Date:   Tue, 10 Oct 2023 04:46:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231010
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 350 runs, 73 regressions (next-20231010)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 350 runs, 73 regressions (next-20231010)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_i386                    | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =

qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =

qemu_mips-malta              | mips   | lab-baylibre  | gcc-10   | malta_de=
fconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231010/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231010
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c0a6edb636cba9c0d1db966a54d910a02e52e4be =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6525042e1f529cdfc7efcf04

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6525042e1f529cdfc7efcf19
        failing since 41 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-10T07:58:33.608422  + <8>[   11.064360] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11722269_1.4.2.3.1>

    2023-10-10T07:58:33.608887  set +x

    2023-10-10T07:58:33.716204  / # #

    2023-10-10T07:58:33.818329  export SHELL=3D/bin/sh

    2023-10-10T07:58:33.818982  #

    2023-10-10T07:58:33.920202  / # export SHELL=3D/bin/sh. /lava-11722269/=
environment

    2023-10-10T07:58:33.920399  =


    2023-10-10T07:58:34.020960  / # . /lava-11722269/environment/lava-11722=
269/bin/lava-test-runner /lava-11722269/1

    2023-10-10T07:58:34.021235  =


    2023-10-10T07:58:34.025664  / # /lava-11722269/bin/lava-test-runner /la=
va-11722269/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6525042211c51b24eaefcf14

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6525042211c51b24eaefcf29
        failing since 41 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-10T07:58:26.711334  + <8>[   10.711091] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11722300_1.4.2.3.1>

    2023-10-10T07:58:26.711421  set +x

    2023-10-10T07:58:26.816109  / # #

    2023-10-10T07:58:26.916722  export SHELL=3D/bin/sh

    2023-10-10T07:58:26.916911  #

    2023-10-10T07:58:27.017423  / # export SHELL=3D/bin/sh. /lava-11722300/=
environment

    2023-10-10T07:58:27.017594  =


    2023-10-10T07:58:27.118091  / # . /lava-11722300/environment/lava-11722=
300/bin/lava-test-runner /lava-11722300/1

    2023-10-10T07:58:27.118372  =


    2023-10-10T07:58:27.122628  / # /lava-11722300/bin/lava-test-runner /la=
va-11722300/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6525040531acb386e3efcf03

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6525040531acb386e3efcf18
        failing since 41 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-10T07:57:42.797380  + <8>[   10.698124] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11722268_1.4.2.3.1>

    2023-10-10T07:57:42.797465  set +x

    2023-10-10T07:57:42.901750  / # #

    2023-10-10T07:57:43.002313  export SHELL=3D/bin/sh

    2023-10-10T07:57:43.002490  #

    2023-10-10T07:57:43.102950  / # export SHELL=3D/bin/sh. /lava-11722268/=
environment

    2023-10-10T07:57:43.103124  =


    2023-10-10T07:57:43.203594  / # . /lava-11722268/environment/lava-11722=
268/bin/lava-test-runner /lava-11722268/1

    2023-10-10T07:57:43.203841  =


    2023-10-10T07:57:43.208103  / # /lava-11722268/bin/lava-test-runner /la=
va-11722268/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc6b92b2626f67efcf18

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fc6b92b2626f67efcf21
        failing since 82 days (last pass: next-20230717, first fail: next-2=
0230720)

    2023-10-10T07:25:09.482011  / # #
    2023-10-10T07:25:10.635765  export SHELL=3D/bin/sh
    2023-10-10T07:25:10.641103  #
    2023-10-10T07:25:12.180443  / # export SHELL=3D/bin/sh. /lava-3799088/e=
nvironment
    2023-10-10T07:25:12.185786  =

    2023-10-10T07:25:14.993079  / # . /lava-3799088/environment/lava-379908=
8/bin/lava-test-runner /lava-3799088/1
    2023-10-10T07:25:14.998657  =

    2023-10-10T07:25:14.998856  / # /lava-3799088/bin/lava<3>[   21.383968]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-10T07:25:15.004330  -test-runner /lava-3799088/1
    2023-10-10T07:25:15.075152  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fde6c4ca60ec6befcfa9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fde6c4ca60ec6befcfb2
        failing since 7 days (last pass: next-20230717, first fail: next-20=
231003)

    2023-10-10T07:31:37.030429  / # #
    2023-10-10T07:31:38.184348  export SHELL=3D/bin/sh
    2023-10-10T07:31:38.189733  #
    2023-10-10T07:31:39.729238  / # export SHELL=3D/bin/sh. /lava-3799118/e=
nvironment
    2023-10-10T07:31:39.734627  =

    2023-10-10T07:31:42.542096  / # . /lava-3799118/environment/lava-379911=
8/bin/lava-test-runner /lava-3799118/1
    2023-10-10T07:31:42.547726  =

    2023-10-10T07:31:42.547943  / # /lava-3799118/bin/lava-t<3>[   22.41260=
0] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce
    2023-10-10T07:31:42.560602  est-runner /lava-3799118/1
    2023-10-10T07:31:42.622503  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff762811d2cf47efcf25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524ff762811d2cf47efcf2c
        failing since 7 days (last pass: next-20230707, first fail: next-20=
231003)

    2023-10-10T07:38:15.966691  + set<8>[   18.256296] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3799144_1.5.2.4.1>
    2023-10-10T07:38:15.966904   +x
    2023-10-10T07:38:16.071632  / # #
    2023-10-10T07:38:17.225586  export SHELL=3D/bin/sh
    2023-10-10T07:38:17.230989  #
    2023-10-10T07:38:18.770537  / # export SHELL=3D/bin/sh. /lava-3799144/e=
nvironment
    2023-10-10T07:38:18.775925  =

    2023-10-10T07:38:21.583454  / # . /lava-3799144/environment/lava-379914=
4/bin/lava-test-runner /lava-3799144/1
    2023-10-10T07:38:21.589088  =

    2023-10-10T07:38:21.589300  / # /lava-3799144/bin/lava-<3>[   22.412931=
] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistanc=
e =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc7b92b2626f67efcf36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fc7b92b2626f67efcf3f
        failing since 55 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-10-10T07:25:25.798917  + set<8>[   28.192496] <LAVA_SIGNAL_ENDRUN =
0_dmesg 160162_1.5.2.4.1>
    2023-10-10T07:25:25.799512   +x
    2023-10-10T07:25:25.910200  #
    2023-10-10T07:25:27.072651  / # #export SHELL=3D/bin/sh
    2023-10-10T07:25:27.078753  =

    2023-10-10T07:25:28.572965  / # export SHELL=3D/bin/sh. /lava-160162/en=
vironment
    2023-10-10T07:25:28.579012  =

    2023-10-10T07:25:31.300900  / # . /lava-160162/environment/lava-160162/=
bin/lava-test-runner /lava-160162/1
    2023-10-10T07:25:31.307637  =

    2023-10-10T07:25:31.318505  / # /lava-160162/bin/lava-test-runner /lava=
-160162/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb130ebe200f9befcf08

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fb130ebe200f9befcf11
        failing since 55 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-10T07:19:25.273066  + set<8>[   27.129199] <LAVA_SIGNAL_ENDRUN =
0_dmesg 160126_1.5.2.4.1>
    2023-10-10T07:19:25.273566   +x
    2023-10-10T07:19:25.386448  / # #
    2023-10-10T07:19:26.550782  export SHELL=3D/bin/sh
    2023-10-10T07:19:26.556935  #
    2023-10-10T07:19:28.055914  / # export SHELL=3D/bin/sh. /lava-160126/en=
vironment
    2023-10-10T07:19:28.061918  =

    2023-10-10T07:19:30.785313  / # . /lava-160126/environment/lava-160126/=
bin/lava-test-runner /lava-160126/1
    2023-10-10T07:19:30.792046  =

    2023-10-10T07:19:30.792881  / # /lava-160126/bin/lava-test-runner /lava=
-160126/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fe21457c24ed15efcf16

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fe21457c24ed15efcf1f
        failing since 55 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-10T07:32:22.111441  + set<8>[   30.002159] <LAVA_SIGNAL_ENDRUN =
0_dmesg 160203_1.5.2.4.1>
    2023-10-10T07:32:22.112053   +x
    2023-10-10T07:32:22.221739  / # #
    2023-10-10T07:32:23.385303  export SHELL=3D/bin/sh
    2023-10-10T07:32:23.391097  #
    2023-10-10T07:32:24.888204  / # export SHELL=3D/bin/sh. /lava-160203/en=
vironment
    2023-10-10T07:32:24.894313  =

    2023-10-10T07:32:27.614401  / # . /lava-160203/environment/lava-160203/=
bin/lava-test-runner /lava-160203/1
    2023-10-10T07:32:27.621192  =

    2023-10-10T07:32:27.633942  / # /lava-160203/bin/lava-test-runner /lava=
-160203/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff9c41826ab1aeefcf09

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524ff9c41826ab1aeefcf12
        failing since 55 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-10T07:38:44.955211  + set<8>[   28.069527] <LAVA_SIGNAL_ENDRUN =
0_dmesg 160211_1.5.2.4.1>
    2023-10-10T07:38:44.955837   +x
    2023-10-10T07:38:45.065998  / # #
    2023-10-10T07:38:46.232532  export SHELL=3D/bin/sh
    2023-10-10T07:38:46.238746  #
    2023-10-10T07:38:47.737465  / # export SHELL=3D/bin/sh. /lava-160211/en=
vironment
    2023-10-10T07:38:47.743463  =

    2023-10-10T07:38:50.460845  / # . /lava-160211/environment/lava-160211/=
bin/lava-test-runner /lava-160211/1
    2023-10-10T07:38:50.467518  =

    2023-10-10T07:38:50.475218  / # /lava-160211/bin/lava-test-runner /lava=
-160211/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc352ae0f505deefcf5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fc352ae0f505deefc=
f5b
        failing since 69 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa7b501fb8fdf0efcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa7b501fb8fdf0efc=
efb
        failing since 258 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa8961b9e6369fefcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa8961b9e6369fefc=
f02
        failing since 244 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa9e902859f58cefceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa9e902859f58cefc=
f00
        failing since 244 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9ff4056a9f00cefcf02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9ff4056a9f00cefc=
f03
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6524faa194dae2b5c2efcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524faa194dae2b5c2efc=
efc
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9fec60543448eefcf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9fec60543448eefc=
f16
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6524faa3a216fd0abdefcf06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524faa3a216fd0abdefc=
f07
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa00a5213f0458efcf06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa00a5213f0458efc=
f07
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6524faa413246e54f8efcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524faa413246e54f8efc=
f02
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9fd4056a9f00cefceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9fd4056a9f00cefc=
f00
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6524faa213246e54f8efcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524faa213246e54f8efc=
eff
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc2f7c25a44103efceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fc2f7c25a44103efc=
f00
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa9fad79af771cefcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa9fad79af771cefc=
ef9
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5d6d36145c88efcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5d6d36145c88efc=
ef6
        new failure (last pass: next-20230720) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fdaa90b1c32000efcf04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fdaa90b1c32000efc=
f05
        failing since 7 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff3db29cdf0570efcf4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ff3db29cdf0570efc=
f4d
        failing since 7 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc31ddd4a5d4d2efcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fc31ddd4a5d4d2efc=
f04
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa9d13246e54f8efcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa9d13246e54f8efc=
efa
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5cfc971afff1efcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5cfc971afff1efc=
f04
        new failure (last pass: next-20230720) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fdad6a78b47920efcf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fdad6a78b47920efc=
f0b
        failing since 7 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff3cb9bc43561defcefd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ff3cb9bc43561defc=
efe
        failing since 7 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc2eddd4a5d4d2efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fc2eddd4a5d4d2efc=
ef4
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa9e94dae2b5c2efcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa9e94dae2b5c2efc=
ef8
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5c988dfc9b21efcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5c988dfc9b21efc=
ef6
        new failure (last pass: next-20230720) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fdab90b1c32000efcf07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fdab90b1c32000efc=
f08
        failing since 7 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff3ab9bc43561defcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ff3ab9bc43561defc=
ef4
        failing since 7 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc3044033842f0efcf70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fc3044033842f0efc=
f71
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524faa0ad79af771cefcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524faa0ad79af771cefc=
efc
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5c651b67437aefcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5c651b67437aefc=
eff
        new failure (last pass: next-20230720) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fdac6a78b47920efcf07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fdac6a78b47920efc=
f08
        failing since 7 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff3bb9bc43561defcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ff3bb9bc43561defc=
efa
        failing since 7 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386                    | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f71946120b9dc7efcefc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f71946120b9dc7efc=
efd
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/65250220925840d09befcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65250220925840d09befc=
ef4
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f71ab52e6581d1efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f71ab52e6581d1efc=
f01
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/6525021f4efa383a77efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525021f4efa383a77efc=
f01
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-baylibre  | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6525043bead912f05fefcf07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525043bead912f05fefc=
f08
        failing since 11 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65250450d1f1b6bac8efcef8

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65250450d1f1b6b=
ac8efcefc
        failing since 0 day (last pass: next-20231004, first fail: next-202=
31009)
        1 lines

    2023-10-10T07:58:48.777512  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00000000, epc =3D=3D 00000000, ra =3D=
=3D 80249414
    2023-10-10T07:58:48.777629  =


    2023-10-10T07:58:48.802519  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-10-10T07:58:48.802648  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9ae6798c1d30befcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9ae6798c1d30befc=
f01
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5e50bdccd041efcf07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5e50bdccd041efc=
f08
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ffdad03df8e4ddefcf0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ffdad03df8e4ddefc=
f0d
        failing since 11 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652503ed0298250836efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652503ed0298250836efc=
ef5
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9ad41d0a69994efcefc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9ad41d0a69994efc=
efd
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5e988dfc9b21efcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5e988dfc9b21efc=
efa
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ffdcc77b283c03efcefc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ffdcc77b283c03efc=
efd
        failing since 11 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652503ec31acb386e3efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652503ec31acb386e3efc=
ef4
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524f9af5e9d16ab00efcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524f9af5e9d16ab00efc=
efa
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fb5eda54ae4a75efcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fb5eda54ae4a75efc=
f02
        failing since 11 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ffdbc77b283c03efcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ffdbc77b283c03efc=
efa
        failing since 11 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652503eb622ad8c355efcf52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652503eb622ad8c355efc=
f53
        failing since 11 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa7d13246e54f8efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa7d13246e54f8efc=
ef4
        failing since 244 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fae799d6d6f113efcf03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fae799d6d6f113efcf0c
        failing since 154 days (last pass: next-20230505, first fail: next-=
20230508)

    2023-10-10T07:18:44.131699  <8>[   21.894904] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 437779_1.5.2.4.1>
    2023-10-10T07:18:44.237195  / # #
    2023-10-10T07:18:44.338843  export SHELL=3D/bin/sh
    2023-10-10T07:18:44.339379  #
    2023-10-10T07:18:44.440405  / # export SHELL=3D/bin/sh. /lava-437779/en=
vironment
    2023-10-10T07:18:44.441119  =

    2023-10-10T07:18:44.542177  / # . /lava-437779/environment/lava-437779/=
bin/lava-test-runner /lava-437779/1
    2023-10-10T07:18:44.543054  =

    2023-10-10T07:18:44.551033  / # /lava-437779/bin/lava-test-runner /lava=
-437779/1
    2023-10-10T07:18:44.595593  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff0db45bf14156efcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524ff0db45bf14156efc=
ef6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/652500752c4a50c78aefcf70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652500752c4a50c78aefc=
f71
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fc6792b2626f67efcf06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fc6792b2626f67efcf0f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:25:03.099461  + set +x
    2023-10-10T07:25:03.099868  <8>[   18.644497] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 437793_1.5.2.4.1>
    2023-10-10T07:25:03.203617  / # #
    2023-10-10T07:25:03.305134  export SHELL=3D/bin/sh
    2023-10-10T07:25:03.305634  #
    2023-10-10T07:25:03.406508  / # export SHELL=3D/bin/sh. /lava-437793/en=
vironment
    2023-10-10T07:25:03.407011  =

    2023-10-10T07:25:03.508096  / # . /lava-437793/environment/lava-437793/=
bin/lava-test-runner /lava-437793/1
    2023-10-10T07:25:03.508806  =

    2023-10-10T07:25:03.515280  / # /lava-437793/bin/lava-test-runner /lava=
-437793/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fcb1dc5aa622c8efcfb6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fcb1dc5aa622c8efcfbf
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:30:56.189088  / # #

    2023-10-10T07:30:56.291241  export SHELL=3D/bin/sh

    2023-10-10T07:30:56.291987  #

    2023-10-10T07:30:56.393456  / # export SHELL=3D/bin/sh. /lava-11722003/=
environment

    2023-10-10T07:30:56.394154  =


    2023-10-10T07:30:56.495619  / # . /lava-11722003/environment/lava-11722=
003/bin/lava-test-runner /lava-11722003/1

    2023-10-10T07:30:56.496756  =


    2023-10-10T07:30:56.512394  / # /lava-11722003/bin/lava-test-runner /la=
va-11722003/1

    2023-10-10T07:30:56.556317  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T07:30:56.586451  + cd /lava-11722003/1/tests/1_boot<8>[   17=
.037993] <LAVA_SIGNAL_STARTRUN 1_bootrr 11722003_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fad3a216fd0abdefcfab

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fad4a216fd0abdefcfb4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:18:28.101858  <8>[   18.681993] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 437783_1.5.2.4.1>
    2023-10-10T07:18:28.207105  / # #
    2023-10-10T07:18:28.308814  export SHELL=3D/bin/sh
    2023-10-10T07:18:28.309398  #
    2023-10-10T07:18:28.410413  / # export SHELL=3D/bin/sh. /lava-437783/en=
vironment
    2023-10-10T07:18:28.411012  =

    2023-10-10T07:18:28.512013  / # . /lava-437783/environment/lava-437783/=
bin/lava-test-runner /lava-437783/1
    2023-10-10T07:18:28.512893  =

    2023-10-10T07:18:28.516881  / # /lava-437783/bin/lava-test-runner /lava=
-437783/1
    2023-10-10T07:18:28.600805  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fde1c4ca60ec6befcf9b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fde1c4ca60ec6befcfa4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:31:24.714128  / # #
    2023-10-10T07:31:24.815501  export SHELL=3D/bin/sh
    2023-10-10T07:31:24.816223  #
    2023-10-10T07:31:24.917287  / # export SHELL=3D/bin/sh. /lava-437798/en=
vironment
    2023-10-10T07:31:24.917887  =

    2023-10-10T07:31:25.018873  / # . /lava-437798/environment/lava-437798/=
bin/lava-test-runner /lava-437798/1
    2023-10-10T07:31:25.022749  =

    2023-10-10T07:31:25.025950  / # /lava-437798/bin/lava-test-runner /lava=
-437798/1
    2023-10-10T07:31:25.104865  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-10T07:31:25.105324  + cd /lava-437798/<8>[   19.642908] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 437798_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff5c070c5f8ca7efcf80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524ff5c070c5f8ca7efcf89
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:37:42.686774  / # #
    2023-10-10T07:37:42.788030  export SHELL=3D/bin/sh
    2023-10-10T07:37:42.788743  #
    2023-10-10T07:37:42.889585  / # export SHELL=3D/bin/sh. /lava-437801/en=
vironment
    2023-10-10T07:37:42.892748  =

    2023-10-10T07:37:42.994559  / # . /lava-437801/environment/lava-437801/=
bin/lava-test-runner /lava-437801/1
    2023-10-10T07:37:42.995234  =

    2023-10-10T07:37:42.998831  / # /lava-437801/bin/lava-test-runner /lava=
-437801/1
    2023-10-10T07:37:43.077883  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-10T07:37:43.078404  + cd /lava-437801/<8>[   19.477271] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 437801_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fae50ebe200f9befcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fae50ebe200f9befcefe
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:23:11.569398  / # #

    2023-10-10T07:23:11.671419  export SHELL=3D/bin/sh

    2023-10-10T07:23:11.672159  #

    2023-10-10T07:23:11.773551  / # export SHELL=3D/bin/sh. /lava-11721894/=
environment

    2023-10-10T07:23:11.774256  =


    2023-10-10T07:23:11.875696  / # . /lava-11721894/environment/lava-11721=
894/bin/lava-test-runner /lava-11721894/1

    2023-10-10T07:23:11.876792  =


    2023-10-10T07:23:11.893709  / # /lava-11721894/bin/lava-test-runner /la=
va-11721894/1

    2023-10-10T07:23:11.936351  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T07:23:11.968785  + cd /lava-11721894/1/tests/1_boot<8>[   17=
.160669] <LAVA_SIGNAL_STARTRUN 1_bootrr 11721894_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fdf224d462e9bcefd000

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524fdf224d462e9bcefd009
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:35:58.360082  / # #

    2023-10-10T07:35:58.460938  export SHELL=3D/bin/sh

    2023-10-10T07:35:58.461617  #

    2023-10-10T07:35:58.562916  / # export SHELL=3D/bin/sh. /lava-11722043/=
environment

    2023-10-10T07:35:58.563646  =


    2023-10-10T07:35:58.665146  / # . /lava-11722043/environment/lava-11722=
043/bin/lava-test-runner /lava-11722043/1

    2023-10-10T07:35:58.666234  =


    2023-10-10T07:35:58.674510  / # /lava-11722043/bin/lava-test-runner /la=
va-11722043/1

    2023-10-10T07:35:58.716109  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T07:35:58.748298  + cd /lava-1172204<8>[   17.337388] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11722043_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6524ff818073af0875efcf14

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524ff818073af0875efcf1d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-10T07:42:57.482530  / # #

    2023-10-10T07:42:57.584667  export SHELL=3D/bin/sh

    2023-10-10T07:42:57.585378  #

    2023-10-10T07:42:57.686717  / # export SHELL=3D/bin/sh. /lava-11722077/=
environment

    2023-10-10T07:42:57.687443  =


    2023-10-10T07:42:57.788926  / # . /lava-11722077/environment/lava-11722=
077/bin/lava-test-runner /lava-11722077/1

    2023-10-10T07:42:57.790040  =


    2023-10-10T07:42:57.806702  / # /lava-11722077/bin/lava-test-runner /la=
va-11722077/1

    2023-10-10T07:42:57.874679  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T07:42:57.875194  + cd /lava-1172207<8>[   17.520057] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11722077_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6524fa41bb7a9d947aefcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231010/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524fa41bb7a9d947aefc=
ef6
        failing since 126 days (last pass: next-20230601, first fail: next-=
20230606) =

 =20
