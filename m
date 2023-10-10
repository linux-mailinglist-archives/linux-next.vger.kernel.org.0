Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5277B7BEF7A
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 02:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377918AbjJJAJ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Oct 2023 20:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379141AbjJJAJZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2023 20:09:25 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99C0CF
        for <linux-next@vger.kernel.org>; Mon,  9 Oct 2023 17:09:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-279150bad13so3804799a91.3
        for <linux-next@vger.kernel.org>; Mon, 09 Oct 2023 17:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696896561; x=1697501361; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mKpXIc0pkzUH6eF0E+RdfR6OnXcYRvggfz4mxePKgdY=;
        b=NUhXJjB75RwZzJiulH9ZiWvB+3SSzaHBdKyVwJg8GGTj41ngovGFHJZ9krfMPAieul
         65CyWjsNUMBg8p+dFBjFOB5qudPYU9ov9RARR79k2kbY20YzvTu1A/zGiXpceVHD/PSz
         x3Vyo/GDjjF5EzXWJ9DsfXTPT5wwF1YieVC1LNWNmUtxjBzgMPA5mf7qq1TCQLfg45mf
         KsjXegVdvMQyPsAfuoMIJ4prewYantDPDjvou9mjz4D/VUfLDMMcajyW1kbRZzp+g95o
         6zWf6yRcf3pFdUqNfflcb7XPQKm3c0+RxKcc9tj4iQ9eY6WbNTz6IhBFl3LN9+T7/eNp
         uqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696896561; x=1697501361;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKpXIc0pkzUH6eF0E+RdfR6OnXcYRvggfz4mxePKgdY=;
        b=gxKGK+V1mUC3/ES9+X9MeZ4bQ7UCMOpIXlHgub/rtBzOYWjVEzrteFlga+eMPJp8Ak
         XXpdOie//KTcEGGJpB/+XFuoMtjmX3Kx25GBWeuOe0orYHy9Va0EQZlokWfRJods6ejB
         JK6sKhX+mb1ejC9sslKG2a8oO1N2zRA8gJtPbN7wpwycBj0AED4LLxBb+gjhg3CwZuEY
         S5WcE9bu7NeLLC+yyiwzPhBsas5PbgSdZMdYNxkZ37zJwaQBZQ7ivXHaK4D+662HLsfd
         iXRCb41vIBIzhcomtOXX8Z/spKY2CL3DggF0NLR6TB4yST7HPhY0o6N9kYdkNPASk/I0
         DChg==
X-Gm-Message-State: AOJu0YziDGk2wa+K3QYwmgMzmerf2W4MiOKrBDXOn7zWH0EBTSpXG39N
        enzThsRgoGrEtNvhME9OdHzEkYDfI8tp+B/A1Zv3AA==
X-Google-Smtp-Source: AGHT+IG5MzhS2lLHpCuyR3vh0whnd2pAbE9bDXcbnKZo9OgYtnrX2PJ+796u/bvbN67IJylInAhMCg==
X-Received: by 2002:a17:90b:11cc:b0:277:6d6a:33ba with SMTP id gv12-20020a17090b11cc00b002776d6a33bamr16420778pjb.28.1696896561515;
        Mon, 09 Oct 2023 17:09:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iq21-20020a17090afb5500b0027b0bfa3be1sm10863429pjb.11.2023.10.09.17.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 17:09:20 -0700 (PDT)
Message-ID: <65249630.170a0220.48dcb.e439@mx.google.com>
Date:   Mon, 09 Oct 2023 17:09:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-240-g35a9dc47bcc8
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 62 runs,
 17 regressions (v6.6-rc5-240-g35a9dc47bcc8)
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

next/pending-fixes baseline: 62 runs, 17 regressions (v6.6-rc5-240-g35a9dc4=
7bcc8)

Regressions Summary
-------------------

platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

imx8mp-evk                 | arm64  | lab-broonie  | gcc-10   | defconfig  =
        | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =

qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =

qemu_riscv64               | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc5-240-g35a9dc47bcc8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc5-240-g35a9dc47bcc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      35a9dc47bcc822953d70a503ab9fb581d724b58e =



Test Regressions
---------------- =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65246447a73a11673fefcf61

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65246447a73a11673fefcf6a
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-09T20:36:07.016315  / # #
    2023-10-09T20:36:08.170244  export SHELL=3D/bin/sh
    2023-10-09T20:36:08.175616  #
    2023-10-09T20:36:09.715033  / # export SHELL=3D/bin/sh. /lava-3797548/e=
nvironment
    2023-10-09T20:36:09.720393  =

    2023-10-09T20:36:12.528169  / # . /lava-3797548/environment/lava-379754=
8/bin/lava-test-runner /lava-3797548/1
    2023-10-09T20:36:12.533859  =

    2023-10-09T20:36:12.534082  / # /lava-3797548/bin/lava-t<3>[   22.41523=
3] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce
    2023-10-09T20:36:12.546395  est-runner /lava-3797548/1
    2023-10-09T20:36:12.607768  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mp-evk                 | arm64  | lab-broonie  | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65246574971048bfbbefcf02

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65246574971048bfbbefcf0b
        failing since 34 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-09T20:40:48.030362  <8>[   27.978095] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-10-09T20:40:48.033962  + set<8>[   27.987762] <LAVA_SIGNAL_ENDRUN =
0_dmesg 158133_1.5.2.4.1>
    2023-10-09T20:40:48.034232   +x
    2023-10-09T20:40:48.140846  /#
    2023-10-09T20:40:49.301123   # #export SHELL=3D/bin/sh
    2023-10-09T20:40:49.306788  =

    2023-10-09T20:40:50.798405  / # export SHELL=3D/bin/sh. /lava-158133/en=
vironment
    2023-10-09T20:40:50.804108  =

    2023-10-09T20:40:53.515243  / # . /lava-158133/environment/lava-158133/=
bin/lava-test-runner /lava-158133/1
    2023-10-09T20:40:53.521046   =

    ... (13 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6524650ff67a6afc7eefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524650ff67a6afc7eefc=
ef4
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65246512238e41a23defcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65246512238e41a23defc=
ef6
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652465107dffb0f928efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652465107dffb0f928efc=
ef4
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652465117dffb0f928efcef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652465117dffb0f928efc=
ef7
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652463f964037a7008efcf1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652463f964037a7008efc=
f1e
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652463f76fa28047e4efcf6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652463f76fa28047e4efc=
f6e
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652463fa3f1d32115cefcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652463fa3f1d32115cefc=
efb
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652463f86fa28047e4efcf70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652463f86fa28047e4efc=
f71
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/65246061c97e688bf4efcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65246061c97e688bf4efc=
efb
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/65246062d8ac087f32efcef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65246062d8ac087f32efc=
ef7
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_riscv64               | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652460d7e9fc77986cefcf59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652460d7e9fc77986cefc=
f5a
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/652460d86901659a68efcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652460d86901659a68efc=
ef9
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524609d93e6ab8615efcef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524609d93e6ab8615efc=
ef7
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524609a337c4a396defcf38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524609a337c4a396defc=
f39
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524609b337c4a396defcf3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-24=
0-g35a9dc47bcc8/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524609b337c4a396defc=
f3c
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
