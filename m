Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCD076DF0D
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 05:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjHCDiB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 23:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbjHCDhx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 23:37:53 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EACE42
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 20:37:49 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a3373211a1so376508b6e.0
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2023 20:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691033868; x=1691638668;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kx9Kt6c/978tSJhZIsh9sfEvtR1sK2zXWMO03+Rz7kM=;
        b=xKsK+8Jw7qwHazfIzF+PQZCAtCJ7SqTD++Qbcb/iInxclb7GvybIKxY/1Pg2dgGHur
         b8WrLwtDRcLFkhPrAwHonwDP/ANfOMlakHGG5TmD0KNULxzjCPL1yNpMzKjPgolNJYtG
         khPr3eFjqLytdgRp6zuwkbdgV/AHhPGnsZr7taellaUPEVuFBa0T0zn6++/B2WxGgvd/
         xxMyLn8AwTSO4iRyS1D76QGBkmIi1KiEmE0pPQUg4rYMmm8wRoeOjIQA5E4GA7Z58t2j
         LBvnzNP8il+UNYYLvACKPKJoaZ5kMGyPVhVRA3XM6hJ7L8M6DhxemaWn7a7YW/O9GUtt
         OAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691033868; x=1691638668;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kx9Kt6c/978tSJhZIsh9sfEvtR1sK2zXWMO03+Rz7kM=;
        b=Pz57rBp7S3Cg6aPRlcH18345Js+4hcqlaFhYCuZxKNV3c2OpagC51xKTNdW0jys0RE
         Z1Hmv54rk6dbuYNl8n9Hii9jXPJvjlpZIcFBFWs3Ab52ZYxdWvv7jp7vJcADHHvKw95U
         hF2wuSfJFgYNkywHPDeqJci9wIihBoGFYwRbxsw0YYK7E8NlfRLy66zt7Nl1/cVzUnsu
         EzDiK2Hmg90eq2w4SkyhsrVCUoCAL4KQYQJkCDo6CoTsKDwWNSFchbW6vYBhd7gwXEAh
         w2LxKIZ0KijwhWYmWovPlb1AawUHHVyDmvs3CFyZXPGgQQ0PgUWvI/qNvfOlWVhRZNYt
         lfrw==
X-Gm-Message-State: ABy/qLZOGjUtWgvWwXEG6mExBJ93S3M0/3da69zjYudaV+OfEp0AofS4
        4lOc39iiSXqG5VinGNkr6Vdf4uKtAaIPMJtwMIt88g==
X-Google-Smtp-Source: APBJJlGGnAWQPzdwzNuuxLW1X6XgM3oH5cxX9OoxlM97mKU901QJXI+jOnUNjzwan4W/0X2HxGzLPg==
X-Received: by 2002:a05:6358:989d:b0:129:c50d:6a37 with SMTP id q29-20020a056358989d00b00129c50d6a37mr11126200rwa.16.1691033868263;
        Wed, 02 Aug 2023 20:37:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t7-20020aa79387000000b00687087d3647sm10619849pfe.142.2023.08.02.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 20:37:47 -0700 (PDT)
Message-ID: <64cb210b.a70a0220.92536.5f86@mx.google.com>
Date:   Wed, 02 Aug 2023 20:37:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc4-305-g35245ef82c5b8
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 23 runs,
 23 regressions (v6.5-rc4-305-g35245ef82c5b8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 23 runs, 23 regressions (v6.5-rc4-305-g35245ef=
82c5b8)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
hifive-unleashed-a00     | riscv  | lab-baylibre  | gcc-10   | defconfig   =
       | 1          =

qemu_arm-virt-gicv2      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv2      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv3      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv3      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =

qemu_i386                | i386   | lab-broonie   | gcc-10   | i386_defconf=
ig     | 1          =

qemu_i386                | i386   | lab-collabora | gcc-10   | i386_defconf=
ig     | 1          =

qemu_i386-uefi           | i386   | lab-broonie   | gcc-10   | i386_defconf=
ig     | 1          =

qemu_i386-uefi           | i386   | lab-collabora | gcc-10   | i386_defconf=
ig     | 1          =

qemu_riscv64             | riscv  | lab-broonie   | gcc-10   | defconfig   =
       | 1          =

qemu_riscv64             | riscv  | lab-collabora | gcc-10   | defconfig   =
       | 1          =

qemu_smp8_riscv64        | riscv  | lab-broonie   | gcc-10   | defconfig   =
       | 1          =

qemu_smp8_riscv64        | riscv  | lab-collabora | gcc-10   | defconfig   =
       | 1          =

qemu_x86_64              | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =

qemu_x86_64              | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc4-305-g35245ef82c5b8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc4-305-g35245ef82c5b8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      35245ef82c5b8206d97d0296017df658fd8ea3d2 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
hifive-unleashed-a00     | riscv  | lab-baylibre  | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/64caed0ad3199e74d435b1f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caed0ad3199e74d435b=
1f4
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv2      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caeefff29415947035b1dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caeefff29415947035b=
1de
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv2      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caee49c000ab87db35b1e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caee49c000ab87db35b=
1e4
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caef1367ad0c4a1935b1dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caef1367ad0c4a1935b=
1de
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caee5964f95da3d135b1dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caee5964f95da3d135b=
1dd
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caef01f57e0fde7935b1e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caef01f57e0fde7935b=
1e1
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv3      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caee59c000ab87db35b1e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caee59c000ab87db35b=
1e8
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caef630301d110db35b1e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caef630301d110db35b=
1e9
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/64caee7964f95da3d135b1e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caee7964f95da3d135b=
1e1
        failing since 0 day (last pass: v6.5-rc3-393-g6d8e2e5dcd42c, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_i386                | i386   | lab-broonie   | gcc-10   | i386_defconf=
ig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec93e15ace67db35bc33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec93e15ace67db35b=
c34
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_i386                | i386   | lab-collabora | gcc-10   | i386_defconf=
ig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec9283bcb2ac5335b1db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec9283bcb2ac5335b=
1dc
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_i386-uefi           | i386   | lab-broonie   | gcc-10   | i386_defconf=
ig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64caeca183bcb2ac5335b1fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caeca183bcb2ac5335b=
1ff
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_i386-uefi           | i386   | lab-collabora | gcc-10   | i386_defconf=
ig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec91e15ace67db35bc2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec91e15ace67db35b=
c2e
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_riscv64             | riscv  | lab-broonie   | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/64caed97e94211c1a535b1de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caed97e94211c1a535b=
1df
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_riscv64             | riscv  | lab-collabora | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/64caecfdfbe988184235b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caecfdfbe988184235b=
1da
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_smp8_riscv64        | riscv  | lab-broonie   | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/64caed9824b3632d7435b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caed9824b3632d7435b=
1da
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_smp8_riscv64        | riscv  | lab-collabora | gcc-10   | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/64caed1dfbe988184235b1df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_ri=
scv64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_ri=
scv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caed1dfbe988184235b=
1e0
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64              | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec354df9cddce035b1f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec354df9cddce035b=
1f6
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64              | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec2e4df9cddce035b1ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec2e4df9cddce035b=
1ed
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec324df9cddce035b1ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec324df9cddce035b=
1f0
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec21e15ace67db35b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec21e15ace67db35b=
1da
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie   | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec344df9cddce035b1f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec344df9cddce035b=
1f3
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
       | regressions
-------------------------+--------+---------------+----------+-------------=
-------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64caec2c61893a930435b1e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-30=
5-g35245ef82c5b8/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64caec2c61893a930435b=
1e7
        failing since 0 day (last pass: v6.5-rc4-220-gd08ef24947110, first =
fail: v6.5-rc4-271-g34fbf9d4c5844) =

 =20
