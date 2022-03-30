Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58864EBD63
	for <lists+linux-next@lfdr.de>; Wed, 30 Mar 2022 11:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244665AbiC3JPz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Mar 2022 05:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244663AbiC3JPz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Mar 2022 05:15:55 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBC424F0F
        for <linux-next@vger.kernel.org>; Wed, 30 Mar 2022 02:14:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g9-20020a17090ace8900b001c7cce3c0aeso1490751pju.2
        for <linux-next@vger.kernel.org>; Wed, 30 Mar 2022 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2WERhRwRj67zQhzg39RZ2ZGzZMIWYKHgjLt0f/nnI70=;
        b=m5YiAsAxdzYqptyosa66vuCLh4/aKlquadTQVRMYs2LlEwl2XwVEM2XgbivkHYj5Ua
         gqhfU32H2m3m63UbphO5g4qYclmYACcUvcFkC2SUdNs0SXDnHM2GTdL3/h9RCHdjWvxS
         bzfH5tdDKvxiVcdmA+e3Haj6QNaT9anKOMUHCPB0yGvDWgv77c94d0oehWfzfDM5o8WB
         ud0fXx6TCupj8HttaoXVCUjfyljpDDlYi7sLHtt0bByStVTJbS4oicXO7oJxc+jxOkHw
         hJz8ReZRdXazLmRM9U3boup6g5obfI6OJFPaVZRi+LL4rYEnenMStaHHzscR0oxD3RX/
         X1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2WERhRwRj67zQhzg39RZ2ZGzZMIWYKHgjLt0f/nnI70=;
        b=dn2GHbJgrX8jpFx4izcJpNQ8V6atjk1DyimGVfvsBknT8xqHP8fkQDkIf+0C0I5maP
         wZWSizdG+bDyWzmHx5o6Zo2E/1nAjV+0JeauIGOSxVbSlamsaHY2+FFPpFruevQXEXAl
         BIiEsIeGPwsLl8+SX3HkLU9NFrQ3QX8YtzRwZY0uGENjHSwlWp9uOLH0X6EOmtMnYSOD
         BfoZBwPFP4WV4ZO6pe1Pqp8tvXsQnYMf6YjMFlcMj7kgVMl0ylDwV4Ou7imAp5jeHIox
         JRSlJ8CTsBf2tbY1JEHkBq9zCYDlPf1ts9C46LFBk9cFEcQ+qNAxie+y5xsNhpyb+RTx
         lq9w==
X-Gm-Message-State: AOAM530Uf+DDugeYvACHMSUuB0OeFuP47p7Sz116cjKaYPE0z9PSfEY5
        SrCZqcJbNC0fowtYgJ66fnHxB3S/AfsOLkJFDMk=
X-Google-Smtp-Source: ABdhPJw1ppQXb+8QxPa/AVVjWX1m+8aWRmVLKKos4W4q6BEvXNhQcBYMhsOUjGyglSm1ZuR2eFkaxw==
X-Received: by 2002:a17:90b:3a8a:b0:1c6:47fe:c9b0 with SMTP id om10-20020a17090b3a8a00b001c647fec9b0mr3876139pjb.151.1648631649325;
        Wed, 30 Mar 2022 02:14:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a390d00b001c995e0a481sm5600166pjb.30.2022.03.30.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 02:14:09 -0700 (PDT)
Message-ID: <62441f61.1c69fb81.19f73.e855@mx.google.com>
Date:   Wed, 30 Mar 2022 02:14:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-13070-gc7e54cdeb141
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 301 runs,
 8 regressions (v5.17-13070-gc7e54cdeb141)
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

next/pending-fixes baseline: 301 runs, 8 regressions (v5.17-13070-gc7e54cde=
b141)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-13070-gc7e54cdeb141/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-13070-gc7e54cdeb141
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7e54cdeb14169ac81dbcbeb69a461cee554a4c8 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624401e6e8323f4a55ae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624401e6e8323f4a55ae0=
67f
        failing since 14 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6244083c81ea2d5372ae0688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6244083c81ea2d5372ae0=
689
        failing since 15 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6243e3909483d58d3dae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243e3909483d58d3dae0=
67d
        failing since 14 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6243e6f6f6b3efff6bae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243e6f6f6b3efff6bae0=
687
        failing since 15 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6243b7388e988ec89bae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243b7388e988ec89bae0=
67e
        failing since 44 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6243b7a16130893ccbae06ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243b7a16130893ccbae0=
6af
        failing since 44 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6243b7731b690d4885ae068b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243b7731b690d4885ae0=
68c
        failing since 44 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6243b7b51d6dfb3bc6ae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-13070=
-gc7e54cdeb141/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6243b7b51d6dfb3bc6ae0=
68d
        failing since 44 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =20
