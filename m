Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9808575B0C
	for <lists+linux-next@lfdr.de>; Fri, 15 Jul 2022 07:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiGOFgq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jul 2022 01:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiGOFgZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2022 01:36:25 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2607A504
        for <linux-next@vger.kernel.org>; Thu, 14 Jul 2022 22:36:23 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w7so2331436ply.12
        for <linux-next@vger.kernel.org>; Thu, 14 Jul 2022 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5uM3gU+wveL8ixmljnmXtbasYk29Vfgnh2PkzaU0wvc=;
        b=MDkOpaaDydlEP5DIQEt4i2vfB885sUZkKC7tdMr1b/KLl4trD4ItjPkYmPszZWhakI
         2OVu6CYdsdjUxI9luQvSnCEPV/9vRV1bnmEkF+nWGCy14+rpyGC+WI1KvSdHiliRcl2B
         QU61qtWxt1X8hIwCmL0OP6JydS/bzJEY7V84MOsfiQ2O+npcP4p00ViP9BnjD1Z0YQjW
         hSZtNM6KOz8OiQ7roGxrdKDvk2sT350sMuaYBUPhdUbjOXTqC1DJye/DJgt/E0LPRa9D
         Dz5FqDElX49Np3Cep3vRHtphBWRrVGmc4A6hMRpP91COA+kNcJgdb40CnYQPnX/YujSa
         NF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5uM3gU+wveL8ixmljnmXtbasYk29Vfgnh2PkzaU0wvc=;
        b=uVffizwLRky/Zc2qX4dmB3VFqvCLonDT34xdfUtCND2gw/Iw3w6dWE/luJUbXU5fb0
         cR1KmVYYZjvhWRMZCmOC2wwi0Oq9NI8kUHaYmT424GfQyG/VQbdT9YvIc3HBaxf454rj
         iEZAfXNovYwrVsBFwSsAIw2qqGByEzmR8+CI6U28ElqSIQ66xchg0RF6G86F1QmwRbcM
         0wv+peMo//XNE7b4z5rfs/SfrCTkxr47DU23umSCfZT65vRwpja3TswZ6uB3Bm3HUpDK
         RcFyjFNwXq9J7x0KeXKS0JOnREhqINNRwNzfMUXBs84nNjdy8nTvPMkKuvuM4M5SdM4J
         HCYQ==
X-Gm-Message-State: AJIora/uB7yLqoAHEDta856GNmuES8Ui4WvdvUry+B7DNnjnNxKjA+1K
        pr2Y8HHBEXI4qT7yPbqGP+A3d+G/wV+nf63k
X-Google-Smtp-Source: AGRyM1srv5kQKGX/ayn5KrgeBqbURU6SjfnYRtSmu9m0T+iHfkdwELfc01vyielh+l56cAx1g3OGeA==
X-Received: by 2002:a17:90a:f692:b0:1ef:9ad9:7e94 with SMTP id cl18-20020a17090af69200b001ef9ad97e94mr19709297pjb.148.1657863382709;
        Thu, 14 Jul 2022 22:36:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x63-20020a628642000000b0052514384f02sm2763429pfd.54.2022.07.14.22.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 22:36:22 -0700 (PDT)
Message-ID: <62d0fcd6.1c69fb81.bf221.488b@mx.google.com>
Date:   Thu, 14 Jul 2022 22:36:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc6-500-g27ca1dbc37a0
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 334 runs,
 21 regressions (v5.19-rc6-500-g27ca1dbc37a0)
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

next/pending-fixes baseline: 334 runs, 21 regressions (v5.19-rc6-500-g27ca1=
dbc37a0)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
jetson-tk1                 | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls      | arm64  | lab-kontron   | gcc-10   | defconfig+=
debug              | 1          =

kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig+=
ima                | 1          =

meson-gxbb-p200            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

odroid-xu3                 | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config             | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc6-500-g27ca1dbc37a0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc6-500-g27ca1dbc37a0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      27ca1dbc37a0aacd61371f94a83d684024ba9749 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
jetson-tk1                 | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0f620c12a8575e8a39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0f620c12a8575e8a39=
bf3
        failing since 76 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls      | arm64  | lab-kontron   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c80d268220cae9a39c0b

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
d0c80d268220cae9a39c14
        failing since 45 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-15T01:50:43.495496  /lava-141599/1/../bin/lava-test-case
    2022-07-15T01:50:43.580349  <8>[   42.413970][  T318] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c67de7d5f17d3ca39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c67de7d5f17d3ca39=
bd4
        new failure (last pass: v5.19-rc6-441-g4822e65f1f95) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxbb-p200            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0cfcdbacbc613a1a39fdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0cfcdbacbc613a1a39=
fdd
        new failure (last pass: v5.19-rc6-441-g4822e65f1f95) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
odroid-xu3                 | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0ea643ba7e19ab1a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0ea643ba7e19ab1a39=
be8
        new failure (last pass: v5.19-rc6-441-g4822e65f1f95) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0cf24e19b6ae57fa39bff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0cf24e19b6ae57fa39=
c00
        failing since 65 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0d212ad7102dcd1a39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0d212ad7102dcd1a39=
bfa
        failing since 65 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0cf61ef4419e72fa39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0cf61ef4419e72fa39=
be0
        failing since 65 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0d366dc3fa64e57a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0d366dc3fa64e57a39=
bdf
        failing since 65 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c5c03bc5c36d5fa39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
aylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
aylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c5c03bc5c36d5fa39=
bd7
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-441-g4822e65f1f95) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c85df784de8417a39beb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre=
/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre=
/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c85df784de8417a39=
bec
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c995a7e116af4fa39c0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c995a7e116af4fa39=
c0e
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c9f6c46e04043ba39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c9f6c46e04043ba39=
bf9
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0c9c9c46e04043ba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0c9c9c46e04043ba39=
bce
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-441-g4822e65f1f95) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0cd27b411072d3ba39c1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/=
baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/=
baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0cd27b411072d3ba39=
c1c
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0ce3e2de65fc2f1a39c4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0ce3e2de65fc2f1a39=
c50
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/62d0ce7c747a21b937a39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d0ce7c747a21b937a39=
bee
        failing since 1 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62d0c15f55d0ac110ea39be4

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-5=
00-g27ca1dbc37a0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62d0c15f55d0ac110ea39c06
        failing since 136 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-15T01:22:26.979323  /lava-6825841/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62d0c16055d0ac110ea39c29
        failing since 45 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-15T01:22:24.797243  /lava-6825841/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62d0c16055d0ac110ea39c2a
        failing since 45 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-15T01:22:23.753377  /lava-6825841/1/../bin/lava-test-case
    2022-07-15T01:22:23.765986  <8>[   52.648681] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62d0c16055d0ac110ea39c2b
        failing since 45 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-15T01:22:22.709651  /lava-6825841/1/../bin/lava-test-case
    2022-07-15T01:22:22.721566  <8>[   51.603861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
