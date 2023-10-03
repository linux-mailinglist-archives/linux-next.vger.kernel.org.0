Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E1E7B5F59
	for <lists+linux-next@lfdr.de>; Tue,  3 Oct 2023 05:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjJCDbA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Oct 2023 23:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjJCDa7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 23:30:59 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6165FAC
        for <linux-next@vger.kernel.org>; Mon,  2 Oct 2023 20:30:55 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68fb85afef4so360468b3a.1
        for <linux-next@vger.kernel.org>; Mon, 02 Oct 2023 20:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696303854; x=1696908654; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3GJyB72muTuOZusIxoL331R98iUnu2Lg1ZT/0mIysW4=;
        b=2M93IrJrlsGSJqbFhu7SiMZ6/Q8cJF1zSs7dIM4zrXJ8wphVDlJFr5u+8meZJftyHg
         VVOWqd0vzfRQ3H4k/MAs4e12Liptgkv/DDrTXIRJKKMR83dEtdesTmlDGxusd2HCaZFI
         1bjYclQGJtyVF1USY72OyFiOXqxKz6uljo8qF/rsWV6DkglQ5acMCOsudbBJ2mgBdujs
         zg472p4K97dUiNxbUpGCTOIZNdS9tpEBSH+xa7AlFmWBpENtqm8Q4+AoJlSgENRHg0gO
         JbHDdaVdMn+CnSwvxeTt/kdAvXgO0pvoIpX2ao2h+jgTnhoXYpGS9pBhPCDgUreGoAKn
         vAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696303854; x=1696908654;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GJyB72muTuOZusIxoL331R98iUnu2Lg1ZT/0mIysW4=;
        b=eCCtjo8lq2JhzC0nrW49xxjGCaxzZyZr8eM+xO3lc5f7B1ujGEFo4SZfmDH59Z3C/l
         HzyTPE0P8aip5fByIuDJjJ7jZadyzEtLo5CU92R068cXdv8rsHhhoxvFcz0RRf4KB7+Z
         loo89yonLUW33mJwzljKVUNZbmKXnOI9fT7umJyL1keZoWhq5h0Yehl3AGlY80i+zIuC
         EtZ89gwDzH3FaY9ErN53KulRKci6MXzdRatSR2KXa6vDDpda/Z5pAPur9+6pUlY8qz/h
         ZGKkKSUjJ1Wp02gFBjaOJn77xlp9MJYjXO7kzGRfFXUPIBRznz0osOLyc6luoYNduKD3
         VVeg==
X-Gm-Message-State: AOJu0YzjsPyuOGi7X/fEtOIA8zRQtaLJvDxysb8nDaNF6EnE1dLSDRoB
        bjdkRDAQcNmD522++abjhclAzNWJ1yHk905C5WJ/sw==
X-Google-Smtp-Source: AGHT+IEHNVQuhb5cSXSRreTOJNt8tLr1fYkf6H42jD2C9t2gSiCk0zDwCjhsyE22ADUmDzrfAEfAhQ==
X-Received: by 2002:a05:6a00:134c:b0:690:b8b1:7b9e with SMTP id k12-20020a056a00134c00b00690b8b17b9emr13124891pfu.0.1696303854110;
        Mon, 02 Oct 2023 20:30:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q20-20020a656a94000000b00553dcfc2179sm209071pgu.52.2023.10.02.20.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:30:53 -0700 (PDT)
Message-ID: <651b8aed.650a0220.e9982.0af9@mx.google.com>
Date:   Mon, 02 Oct 2023 20:30:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-285-g5819084cf40c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 69 runs,
 18 regressions (v6.6-rc4-285-g5819084cf40c)
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

next/pending-fixes baseline: 69 runs, 18 regressions (v6.6-rc4-285-g5819084=
cf40c)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora | gcc-10   | defconfig =
         | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
         | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =

qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =

qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc4-285-g5819084cf40c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc4-285-g5819084cf40c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5819084cf40c51313a953b510b9d5cdc3fb064b6 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b5a6ab20973a6fa8a0a52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4=
-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4=
-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b5a6ab20973a6fa8a0=
a53
        new failure (last pass: v6.6-rc3-342-g4bd3c2b6ac51) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b5a41923c6f171d8a0aa5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651b5a41923c6f171d8a0aae
        failing since 4 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-03T00:02:42.687593  / # #
    2023-10-03T00:02:43.841525  export SHELL=3D/bin/sh
    2023-10-03T00:02:43.846911  #
    2023-10-03T00:02:45.386495  / # export SHELL=3D/bin/sh. /lava-3794812/e=
nvironment
    2023-10-03T00:02:45.391908  =

    2023-10-03T00:02:48.199505  / # . /lava-3794812/environment/lava-379481=
2/bin/lava-test-runner /lava-3794812/1
    2023-10-03T00:02:48.205165  =

    2023-10-03T00:02:48.205391  / # /lava-3794812/bin/lava<3>[   22.415731]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-03T00:02:48.213978  -test-runner /lava-3794812/1
    2023-10-03T00:02:48.278903  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b5a69210f9eecac8a0a85

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651b5a69210f9eecac8a0a8e
        failing since 27 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-03T00:03:40.877802  + set<8>[   28.435871] <LAVA_SIGNAL_ENDRUN =
0_dmesg 149274_1.5.2.4.1>
    2023-10-03T00:03:40.878392   +x
    2023-10-03T00:03:40.986988  / # #
    2023-10-03T00:03:42.153055  export SHELL=3D/bin/sh
    2023-10-03T00:03:42.159175  #
    2023-10-03T00:03:43.658544  / # export SHELL=3D/bin/sh. /lava-149274/en=
vironment
    2023-10-03T00:03:43.664552  =

    2023-10-03T00:03:46.388246  / # . /lava-149274/environment/lava-149274/=
bin/lava-test-runner /lava-149274/1
    2023-10-03T00:03:46.395030  =

    2023-10-03T00:03:46.397151  / # /lava-149274/bin/lava-test-runner /lava=
-149274/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651b58ee51ab582c5d8a0b1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b58ee51ab582c5d8a0=
b1d
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651b58ef51ab582c5d8a0b20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b58ef51ab582c5d8a0=
b21
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651b58edeb780166c38a0aac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b58edeb780166c38a0=
aad
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651b58f051ab582c5d8a0b23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b58f051ab582c5d8a0=
b24
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b59ddecf682eb3f8a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b59ddecf682eb3f8a0=
a50
        failing since 4 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b59de385ec806c68a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b59de385ec806c68a0=
a43
        failing since 4 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b59e0de9bf7c0748a0a46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b59e0de9bf7c0748a0=
a47
        failing since 4 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b59df385ec806c68a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b59df385ec806c68a0=
a48
        failing since 4 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/651b54b748a203dac38a0ab7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b54b748a203dac38a0=
ab8
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/651b54b614989f0b448a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b54b614989f0b448a0=
a54
        failing since 4 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b54013285248db98a0ae9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b54013285248db98a0=
aea
        failing since 4 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/651b54003285248db98a0ae6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b54003285248db98a0=
ae7
        failing since 4 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/651b537656ebcba9aa8a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b537656ebcba9aa8a0=
a4f
        failing since 4 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/651b5375a67265b36a8a0a99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b5375a67265b36a8a0=
a9a
        failing since 4 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/651b5374a67265b36a8a0a91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-28=
5-g5819084cf40c/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651b5374a67265b36a8a0=
a92
        failing since 4 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
