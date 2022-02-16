Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C43D4B8B89
	for <lists+linux-next@lfdr.de>; Wed, 16 Feb 2022 15:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbiBPOfz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Feb 2022 09:35:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbiBPOfz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Feb 2022 09:35:55 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129452A5203
        for <linux-next@vger.kernel.org>; Wed, 16 Feb 2022 06:35:41 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id 10so2167127plj.1
        for <linux-next@vger.kernel.org>; Wed, 16 Feb 2022 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3Fdz34RaoFGAOIX72efQjOAjAonlSnVNVx6IHJH/0SU=;
        b=tM5FbmCAqCCg9YirFfkes61XGzvfsa14SE3DV4z6QDDqj6OT/DqbR/539YgmebnQWY
         VqaFUFjgF+CWBi4Jb8AgaJzb9bL/IWB7O3glp9Z+tTaBg9sNLv52+R8RWWlDxxaEDXci
         D2ticlPEosjvw2cL1EN2sgvoWRR+zBI990z77qdp5P89uyHeWQrbR5FU6Mwog0b5Bxsf
         YfqVzdvQWnZl6LuUyD5inDeVXrZNZEiiT149eCkTINnPm4WmybxmWjBUeCkotQhqqsfU
         wRcN2X+DB04oP5beEv5q6MArSwz26asdKh7i3rEPF2AC8NhufaHjo3GTwILzYSjEXCDt
         k74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3Fdz34RaoFGAOIX72efQjOAjAonlSnVNVx6IHJH/0SU=;
        b=keG2m1czfyKTlRuEf69T1uVaOFifG3ZqTfRfm3gdFlxE2B/xOb64FajM1DZCS6qpSk
         cSi1CFEW1SVxNFTeMdv8CjMC9RC5Md7lf+8BVNrtu4i09wJRVGidk6xJv7Tjyqy7Jm0C
         q6X3SpleTQMQiKLDbAnY2lMAZXLMpatqqGRuwnKfrZh6sR030DS6GPcpNBFgMdRXimzq
         0KT4KAS7vuw3xnX4xbZ71HHf9XQOyn2KWWqhzDs6Lzb4zkhKcFb+rUrjIOGYtqANWeWA
         bfGFWIdrPOsrwmRRM7+Fnz3hocnyBzjJVPQTHqAeZodz4D4++a/dPaRUf+b1yLHb5Fsb
         Vu7Q==
X-Gm-Message-State: AOAM531CddNk9COZCDaLiLgSAXUCuPCgwB7EJRllWXnCyFh08pJXdwOl
        EPSOO6H4Y0XKvV6x2nJ6Ny+pmxDBvxM6TYeR
X-Google-Smtp-Source: ABdhPJyYx/HN7OReMC4GvLB/n87s0kWi6u2fyf9YfBiXqVz2sbq4A5G336GQLMqzazZBF0QFgZMUIQ==
X-Received: by 2002:a17:90a:9bc9:b0:1bb:9945:d69b with SMTP id b9-20020a17090a9bc900b001bb9945d69bmr1273432pjw.144.1645022139266;
        Wed, 16 Feb 2022 06:35:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pi9sm8039915pjb.23.2022.02.16.06.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 06:35:38 -0800 (PST)
Message-ID: <620d0bba.1c69fb81.64819.37f7@mx.google.com>
Date:   Wed, 16 Feb 2022 06:35:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220216
Subject: next/master baseline: 574 runs, 65 regressions (next-20220216)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 574 runs, 65 regressions (next-20220216)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
config           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220216/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220216
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      763a906a02e961eedabab7dbedd16904a3bd0184 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd33af117440fccc62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd33af117440fccc62=
96a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd33b9a9c3eb918c62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd33b9a9c3eb918c62=
987
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd356c248716097c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd356c248716097c62=
96c
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd357c248716097c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd357c248716097c62=
97a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd938028fd0c80dc62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd938028fd0c80dc62=
97a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd9d86cb3a814fbc62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd9d86cb3a814fbc62=
981
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccbc39ef31eaecc62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccbc39ef31eaecc62=
979
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd4fec2f52f59cc62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd4fec2f52f59cc62=
982
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd06a0c64aa8feac629b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd06a0c64aa8feac62=
9b9
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccc414a930d150c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccc414a930d150c62=
98a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd6447caabff65c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd6447caabff65c62=
977
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0490c64aa8feac6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0490c64aa8feac62=
98d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620cce9842dd4f3ff2c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cce9842dd4f3ff2c62=
97b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd2eb8513e52587c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd2eb8513e52587c62=
96a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd37777df848a39c62997

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd37777df848a39c62=
998
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd2de5dba5feccbc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd2de5dba5feccbc62=
969
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd35877df848a39c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd35877df848a39c62=
969
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd8acb0f472f3d5c6299c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd8acb0f472f3d5c62=
99d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd99c6cb3a814fbc62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd99c6cb3a814fbc62=
96a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd10ae71556a74c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd10ae71556a74c62=
97e
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd36d596710efec62997

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd36d596710efec62=
998
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd10aed2ac1da10c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd10aed2ac1da10c62=
974
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd01d596710efec62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd01d596710efec62=
973
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd5276ca06c7f6c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd5276ca06c7f6c62=
973
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0867c71be6703c629b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0867c71be6703c62=
9b8
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd8c47caabff65c6298f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd8c47caabff65c62=
990
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620cce34ef2f1f0ff4c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cce34ef2f1f0ff4c62=
970
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd2dc12cf3844e1c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd2dc12cf3844e1c62=
976
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd3149f2943ba01c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd3149f2943ba01c62=
97e
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd39ee321417a16c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd39ee321417a16c62=
978
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd3069f2943ba01c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd3069f2943ba01c62=
96d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd36977df848a39c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd36977df848a39c62=
97a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd91c028fd0c80dc62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd91c028fd0c80dc62=
974
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cda008281376b85c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cda008281376b85c62=
976
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccbd14a930d150c62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccbd14a930d150c62=
981
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd850108d8b795c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd850108d8b795c62=
980
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0a6c91704344fc62994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0a6c91704344fc62=
995
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccc5e91b8463c4c6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccc5e91b8463c4c62=
98d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd8f279e7de5e7c6298b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd8f279e7de5e7c62=
98c
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0710931d178aac62990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0710931d178aac62=
991
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccb8443186b7dcc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccb8443186b7dcc62=
976
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccefc3e2c12a55cc6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccefc3e2c12a55cc62=
970
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd264f94e75977fc6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd264f94e75977fc62=
99b
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd2ef5dba5feccbc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd2ef5dba5feccbc62=
976
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd39fe321417a16c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd39fe321417a16c62=
97b
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd2df12cf3844e1c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd2df12cf3844e1c62=
97c
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd36a77df848a39c6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd36a77df848a39c62=
97d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | clang-14 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd9241aad2c87e0c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd9241aad2c87e0c62=
98a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | clang-14 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/620cdaa0abd5069fd3c6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220212123227+2a228=
6e9859a-1~exp1~20220212003308.41)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cdaa0abd5069fd3c62=
97d
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccbfe91b8463c4c62987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccbfe91b8463c4c62=
988
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd4e0c3675c9cec6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd4e0c3675c9cec62=
98d
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0bb620c7e2e33c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0bb620c7e2e33c62=
978
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620cccd814a930d150c629dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cccd814a930d150c62=
9de
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd5367878709d1c62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd5367878709d1c62=
975
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd0727c71be6703c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd0727c71be6703c62=
96a
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccd1cf921cef01dc62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccd1cf921cef01dc62=
974
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620ccef685e420ee56c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620ccef685e420ee56c62=
969
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd258f94e75977fc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd258f94e75977fc62=
97b
        failing since 7 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620cd87e1397dd62a4c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620cd87e1397dd62a4c62=
98a
        new failure (last pass: next-20220215) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
config           | 2          =


  Details:     https://kernelci.org/test/plan/id/620ccfcc1e8b26b5cbc62999

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620ccfcc1e8b26b=
5cbc6299d
        failing since 12 days (last pass: next-20220125, first fail: next-2=
0220204)
        16 lines

    2022-02-16T10:19:43.046689  kern  :alert : 8<--- cut here ---
    2022-02-16T10:19:43.057516  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-16T10:19:43.066736  kern  :alert : [000001a0] *pgd=3D7c[   44.2=
87003] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-16T10:19:43.067119  a33835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620ccfcc1e8b26b=
5cbc6299e
        failing since 12 days (last pass: next-20220125, first fail: next-2=
0220204)
        54 lines

    2022-02-16T10:19:43.072241  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-16T10:19:43.077720  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-16T10:19:43.081342  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-16T10:19:43.086875  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-16T10:19:43.097865  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4f4bc00 pointer offset 64 size 1024
    2022-02-16T10:19:43.106960  kern  :alert : Register r5 information: sla=
b task_struct start c25ee600 pointer offset 0
    2022-02-16T10:19:43.112405  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-16T10:19:43.121719  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4f4bc00 pointer offset 128 size 1024
    2022-02-16T10:19:43.127214  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-16T10:19:43.138145  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/620cd1d4392be1d0ccc62998

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620cd1d4392be1d=
0ccc6299c
        failing since 14 days (last pass: next-20220127, first fail: next-2=
0220201)
        16 lines

    2022-02-16T10:28:05.624163  kern  :alert : 8<--- cut here ---
    2022-02-16T10:28:05.634992  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-16T10:28:05.644462  kern  :alert : [000001a0] *pgd=3D7d[   44.5=
83370] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-16T10:28:05.644959  797835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620cd1d4392be1d=
0ccc6299d
        failing since 14 days (last pass: next-20220127, first fail: next-2=
0220201)
        54 lines

    2022-02-16T10:28:05.649670  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-16T10:28:05.655126  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-16T10:28:05.658833  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-16T10:28:05.664641  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-16T10:28:05.675331  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4cd9800 pointer offset 64 size 1024
    2022-02-16T10:28:05.679116  kern  :alert : Register r5 information: sla=
b task_struct start c25b1980 pointer offset 0
    2022-02-16T10:28:05.690014  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-16T10:28:05.699358  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4cd9800 pointer offset 128 size 1024
    2022-02-16T10:28:05.704991  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-16T10:28:05.716307  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (44 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/620cd8514152f96c6ac629d3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620cd8514152f96=
c6ac629d7
        failing since 12 days (last pass: next-20220125, first fail: next-2=
0220204)
        16 lines

    2022-02-16T10:55:44.000037  kern  :alert : 8<--- cut here ---
    2022-02-16T10:55:44.010872  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-16T10:55:44.020166  kern  :alert : [00000188] *pgd=3D7c[   45.1=
61147] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-16T10:55:44.020541  998835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620cd8514152f96=
c6ac629d8
        failing since 12 days (last pass: next-20220125, first fail: next-2=
0220204)
        54 lines

    2022-02-16T10:55:44.025636  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-16T10:55:44.031105  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-16T10:55:44.034769  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-16T10:55:44.040266  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-16T10:55:44.051223  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4de4800 pointer offset 64 size 1024
    2022-02-16T10:55:44.060456  kern  :alert : Register r5 information: sla=
b task_struct start c4bdc000 pointer offset 0
    2022-02-16T10:55:44.065912  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-16T10:55:44.075088  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4de4800 pointer offset 120 size 1024
    2022-02-16T10:55:44.080498  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-16T10:55:44.091510  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =20
