Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5AE78AB44
	for <lists+linux-next@lfdr.de>; Mon, 28 Aug 2023 12:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjH1K3l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Aug 2023 06:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjH1K3a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Aug 2023 06:29:30 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EAA132
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 03:29:24 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bdbbede5d4so23739855ad.2
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693218563; x=1693823363;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cM7McCFBOD+bqD6NsvWMp7hKq3EmC92OSRqyysOD6ow=;
        b=Ata/nOi6jg6LFQlsWnelzDVaLammrpxuNG281VoATWujW34mW2/wsbBuaLcjZxXBhy
         mxE8Wd+ZLpmkpQUkEyzsXDAkZoHZK/WGxgxJ2oWW/Ex9EGvee1kXbka3SysA2nRG2zVi
         EgSry008aUl9Ncgkijdtwm6fGQKXneYRjSB5P3SO34P4AbEYeP5DkkDpjETKejPVffLY
         f3dB4l5hYtgXEiICmy0PJIGs3oqzWZ9KTD33LD07ipcPnKgR0uFtDzk9aFyXmUUQKFOZ
         qVP1c6R8TApxrrTM2ILWhc/KfS9SoChBQYtFrnF5WrumDQkN8juWlYrZjTtLURzQjQpf
         EfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693218563; x=1693823363;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cM7McCFBOD+bqD6NsvWMp7hKq3EmC92OSRqyysOD6ow=;
        b=EP1OhEccqcG+HAJsKh8CeUNALSbQHgyI3jryX/xRodivUpwjNpm0JjYcfjLYghlTuI
         uzTxcTRbq2VpZNrtdvPMwZJYQF0aXDsx10a283+oVh0HCmVA+TioYj3kpTMiKbrXfCZp
         jTgUF9JrqYDGcxgnwu9tTyeg1eLkMxYUfRmmabEOa4ewwSlSEMdt/o8RPI331MLIYZFo
         48dvayKYkGTc3swp3veXGMnVjCqWm+ymbsFaW4ok+UC7k2xL5M9XQixRg7uFzJ0MLMES
         paoH/sVNogr+/NYfqPpLmjRWxJEUhHn3wYB4pvHwabvkvEYPaohymO9kOWfM33B2Gs/9
         G9lQ==
X-Gm-Message-State: AOJu0Yz0Rh1XXlWtZuG6s3BOr5jvddIISp460Tjy6M2TijbTWlRYAtkQ
        L7RS7im0RaqOLlrlB22sV0NQIkW1PdzBp6B/Sck=
X-Google-Smtp-Source: AGHT+IEgzQFkUEJxhwilLDAfrLpNn6HCuA+PbUQsP5hExvCG//u3A2U9k3c5sZt1/lKVAaAB+BH1ug==
X-Received: by 2002:a17:902:e74f:b0:1b9:ea60:cd82 with SMTP id p15-20020a170902e74f00b001b9ea60cd82mr30416498plf.5.1693218562641;
        Mon, 28 Aug 2023 03:29:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902d3c600b001bdb0483e65sm6898581plb.265.2023.08.28.03.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 03:29:21 -0700 (PDT)
Message-ID: <64ec7701.170a0220.48c5b.a56f@mx.google.com>
Date:   Mon, 28 Aug 2023 03:29:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230828
Subject: next/master baseline: 361 runs, 39 regressions (next-20230828)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 361 runs, 39 regressions (next-20230828)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+videodec           | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230828/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230828
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2ee82481c392eec06a7ef28df61b7f0d8e45be2e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3bbcc3452c6c77286dfe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3bbcc3452c6c77286e07
        failing since 12 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-08-28T06:16:10.310540  + set<8>[   27.991692] <LAVA_SIGNAL_ENDRUN =
0_dmesg 74213_1.5.2.4.1>
    2023-08-28T06:16:10.311092   +x
    2023-08-28T06:16:10.421309  =

    2023-08-28T06:16:11.583541  / # #export SHELL=3D/bin/sh
    2023-08-28T06:16:11.589623  =

    2023-08-28T06:16:13.032257  / # export SHELL=3D/bin/sh. /lava-74213/env=
ironment
    2023-08-28T06:16:13.038331  =

    2023-08-28T06:16:15.649449  / # . /lava-74213/environment/lava-74213/bi=
n/lava-test-runner /lava-74213/1
    2023-08-28T06:16:15.656185  =

    2023-08-28T06:16:15.669432  / # /lava-74213/bin/lava-test-runner /lava-=
74213/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec4045b2ced9cabe286d7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec4045b2ced9cabe286d84
        failing since 12 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-08-28T06:35:26.310285  + set<8>[   28.551543] <LAVA_SIGNAL_ENDRUN =
0_dmesg 74281_1.5.2.4.1>
    2023-08-28T06:35:26.310876   +x
    2023-08-28T06:35:26.419990  / # #
    2023-08-28T06:35:27.585942  export SHELL=3D/bin/sh
    2023-08-28T06:35:27.592078  #
    2023-08-28T06:35:29.035560  / # export SHELL=3D/bin/sh. /lava-74281/env=
ironment
    2023-08-28T06:35:29.041639  =

    2023-08-28T06:35:31.651459  / # . /lava-74281/environment/lava-74281/bi=
n/lava-test-runner /lava-74281/1
    2023-08-28T06:35:31.658116  =

    2023-08-28T06:35:31.672657  / # /lava-74281/bin/lava-test-runner /lava-=
74281/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3964dfd70fae55286d8f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3964dfd70fae55286d98
        failing since 12 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-28T06:06:13.067248  + set<8>[   24.470517] <LAVA_SIGNAL_ENDRUN =
0_dmesg 74160_1.5.2.4.1>
    2023-08-28T06:06:13.067848   +x
    2023-08-28T06:06:13.176498  / # #
    2023-08-28T06:06:14.342570  export SHELL=3D/bin/sh
    2023-08-28T06:06:14.348705  #
    2023-08-28T06:06:15.792404  / # export SHELL=3D/bin/sh. /lava-74160/env=
ironment
    2023-08-28T06:06:15.798575  =

    2023-08-28T06:06:18.410901  / # . /lava-74160/environment/lava-74160/bi=
n/lava-test-runner /lava-74160/1
    2023-08-28T06:06:18.417701  =

    2023-08-28T06:06:18.426358  / # /lava-74160/bin/lava-test-runner /lava-=
74160/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39f0d550e2b720286e47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec39f0d550e2b720286e50
        failing since 12 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-28T06:08:29.015271  + set<8>[   28.747608] <LAVA_SIGNAL_ENDRUN =
0_dmesg 74193_1.5.2.4.1>
    2023-08-28T06:08:29.015749   +x
    2023-08-28T06:08:29.124348  / # #
    2023-08-28T06:08:30.289807  export SHELL=3D/bin/sh
    2023-08-28T06:08:30.295920  #
    2023-08-28T06:08:31.739338  / # export SHELL=3D/bin/sh. /lava-74193/env=
ironment
    2023-08-28T06:08:31.745380  =

    2023-08-28T06:08:34.357287  / # . /lava-74193/environment/lava-74193/bi=
n/lava-test-runner /lava-74193/1
    2023-08-28T06:08:34.364029  =

    2023-08-28T06:08:34.374135  / # /lava-74193/bin/lava-test-runner /lava-=
74193/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3eb491b5383213286d9b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3eb591b5383213286da3
        failing since 12 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-28T06:28:48.755587  + set<8>[   28.224933] <LAVA_SIGNAL_ENDRUN =
0_dmesg 74246_1.5.2.4.1>
    2023-08-28T06:28:48.756170   +x
    2023-08-28T06:28:48.864544  / # #
    2023-08-28T06:28:50.030609  export SHELL=3D/bin/sh
    2023-08-28T06:28:50.036732  #
    2023-08-28T06:28:51.480238  / # export SHELL=3D/bin/sh. /lava-74246/env=
ironment
    2023-08-28T06:28:51.486405  =

    2023-08-28T06:28:54.098590  / # . /lava-74246/environment/lava-74246/bi=
n/lava-test-runner /lava-74246/1
    2023-08-28T06:28:54.105302  =

    2023-08-28T06:28:54.113847  / # /lava-74246/bin/lava-test-runner /lava-=
74246/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3c85f13c7f2cc6286dd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3c85f13c7f2cc6286=
dd8
        new failure (last pass: next-20230824) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3f6ab090b23621286e0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3f6ab090b23621286=
e0c
        failing since 26 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3e667124c5d8e6286d97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3e667124c5d8e6286=
d98
        failing since 27 days (last pass: next-20230728, first fail: next-2=
0230801) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec4073912f162cd7286de4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec4073912f162cd7286=
de5
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec40862903669c89286d7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec40862903669c89286=
d7b
        failing since 215 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec4071912f162cd7286dde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec4071912f162cd7286=
ddf
        failing since 26 days (last pass: next-20230719, first fail: next-2=
0230802) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec40928fa31593cd286dc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec40928fa31593cd286=
dc3
        failing since 26 days (last pass: next-20230719, first fail: next-2=
0230802) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec40d6e0665f5a56286fda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec40d6e0665f5a56286=
fdb
        new failure (last pass: next-20230825) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec6a3134c7248112286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec6a3134c7248112286=
d6d
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3ffff4dc00fe65286d90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3ffff4dc00fe65286=
d91
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3d4457d38e043c286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3d4457d38e043c286=
d6d
        failing since 215 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3d528710af3712286d6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3d528710af3712286=
d70
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3a53880d00eebc286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3a53880d00eebc286=
d6d
        new failure (last pass: next-20230825) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3d44f22aac122f286d7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3d44f22aac122f286=
d7f
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3a119db5725e30286d8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3a119db5725e30286=
d8d
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39af5f5aff6398286e97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39af5f5aff6398286=
e98
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39fd0ab3547445286db6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39fd0ab3547445286=
db7
        failing since 346 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39ae5f5aff6398286e94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39ae5f5aff6398286=
e95
        failing since 346 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39f80ab3547445286d6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39f80ab3547445286=
d6e
        failing since 346 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39ad5f5aff6398286e90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39ad5f5aff6398286=
e91
        failing since 346 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3b3eca6e08572a286de6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3b3eca6e08572a286=
de7
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec39b05f5aff6398286e9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec39b05f5aff6398286=
e9b
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3be23f3824cf6d2870fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3be23f3824cf6d287103
        new failure (last pass: next-20230710)

    2023-08-28T06:16:43.209710  + set +x
    2023-08-28T06:16:43.212808  <8>[   28.435858] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1001861_1.5.2.4.1>
    2023-08-28T06:16:43.322284  / # #
    2023-08-28T06:16:44.786959  export SHELL=3D/bin/sh
    2023-08-28T06:16:44.807927  #
    2023-08-28T06:16:44.808385  / # export SHELL=3D/bin/sh
    2023-08-28T06:16:46.766148  / # . /lava-1001861/environment
    2023-08-28T06:16:50.368209  /lava-1001861/bin/lava-test-runner /lava-10=
01861/1
    2023-08-28T06:16:50.389678  . /lava-1001861/environment
    2023-08-28T06:16:50.390097  / # /lava-1001861/bin/lava-test-runner /lav=
a-1001861/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3ab6f2adf4e847286e8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3ab6f2adf4e847286e93
        failing since 20 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-08-28T06:11:36.405809  + set +x
    2023-08-28T06:11:36.409064  <8>[   28.430406] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1001851_1.5.2.4.1>
    2023-08-28T06:11:36.516633  / # #
    2023-08-28T06:11:37.980747  export SHELL=3D/bin/sh
    2023-08-28T06:11:38.001642  #
    2023-08-28T06:11:38.002106  / # export SHELL=3D/bin/sh
    2023-08-28T06:11:39.960156  / # . /lava-1001851/environment
    2023-08-28T06:11:43.562147  /lava-1001851/bin/lava-test-runner /lava-10=
01851/1
    2023-08-28T06:11:43.583587  . /lava-1001851/environment
    2023-08-28T06:11:43.584004  / # /lava-1001851/bin/lava-test-runner /lav=
a-1001851/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3ec626a29c474b286d90

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3ec626a29c474b286d97
        failing since 27 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-08-28T06:29:00.730856  + set +x
    2023-08-28T06:29:00.734115  <8>[   27.398167] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1001871_1.5.2.4.1>
    2023-08-28T06:29:00.841195  / # #
    2023-08-28T06:29:02.305800  export SHELL=3D/bin/sh
    2023-08-28T06:29:02.326723  #
    2023-08-28T06:29:02.327184  / # export SHELL=3D/bin/sh
    2023-08-28T06:29:04.285284  / # . /lava-1001871/environment
    2023-08-28T06:29:07.887379  /lava-1001871/bin/lava-test-runner /lava-10=
01871/1
    2023-08-28T06:29:07.908874  . /lava-1001871/environment
    2023-08-28T06:29:07.909292  / # /lava-1001871/bin/lava-test-runner /lav=
a-1001871/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3c192828fb645a286d75

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3c192828fb645a286d7c
        failing since 32 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-28T06:17:31.207319  / # #
    2023-08-28T06:17:32.667116  export SHELL=3D/bin/sh
    2023-08-28T06:17:32.687588  #
    2023-08-28T06:17:32.687709  / # export SHELL=3D/bin/sh
    2023-08-28T06:17:34.641489  / # . /lava-1001860/environment
    2023-08-28T06:17:38.236748  /lava-1001860/bin/lava-test-runner /lava-10=
01860/1
    2023-08-28T06:17:38.257343  . /lava-1001860/environment
    2023-08-28T06:17:38.257454  / # /lava-1001860/bin/lava-test-runner /lav=
a-1001860/1
    2023-08-28T06:17:38.348999  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-28T06:17:38.349141  + cd /lava-1001860/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3bbeea1b25426d286d6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3bbeea1b25426d286d76
        failing since 32 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-28T06:16:15.282818  / # #

    2023-08-28T06:16:16.362492  export SHELL=3D/bin/sh

    2023-08-28T06:16:16.364224  #

    2023-08-28T06:16:17.854273  / # export SHELL=3D/bin/sh. /lava-11370137/=
environment

    2023-08-28T06:16:17.856229  =


    2023-08-28T06:16:20.579588  / # . /lava-11370137/environment/lava-11370=
137/bin/lava-test-runner /lava-11370137/1

    2023-08-28T06:16:20.582038  =


    2023-08-28T06:16:20.591044  / # /lava-11370137/bin/lava-test-runner /la=
va-11370137/1

    2023-08-28T06:16:20.651358  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-28T06:16:20.651845  + cd /lava-113701<8>[   29.508405] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11370137_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3c3e1966cfbddf286e10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3c3e1966cfbddf286=
e11
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3fe4a0ad5dc84e286d94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3fe4a0ad5dc84e286=
d95
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3feb4850a6ed92286d8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3feb4850a6ed92286=
d8c
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3fc3a76b64b282286dec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3fc3a76b64b282286=
ded
        failing since 201 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3b92c3452c6c77286da1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ec3b92c3452c6c77286daa
        failing since 32 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-28T06:17:19.826377  / # #

    2023-08-28T06:17:19.927287  export SHELL=3D/bin/sh

    2023-08-28T06:17:19.927842  #

    2023-08-28T06:17:20.029057  / # export SHELL=3D/bin/sh. /lava-11370134/=
environment

    2023-08-28T06:17:20.029786  =


    2023-08-28T06:17:20.131200  / # . /lava-11370134/environment/lava-11370=
134/bin/lava-test-runner /lava-11370134/1

    2023-08-28T06:17:20.132314  =


    2023-08-28T06:17:20.173326  / # /lava-11370134/bin/lava-test-runner /la=
va-11370134/1

    2023-08-28T06:17:20.216843  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-28T06:17:20.217021  + cd /lava-1137013<8>[   17.546382] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11370134_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3d25f22aac122f286d79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3d25f22aac122f286=
d7a
        failing since 82 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64ec3fe1a0ad5dc84e286d8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230828/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ec3fe1a0ad5dc84e286=
d8f
        failing since 81 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
