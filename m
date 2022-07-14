Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1F2574214
	for <lists+linux-next@lfdr.de>; Thu, 14 Jul 2022 06:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiGNEBT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jul 2022 00:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGNEBS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Jul 2022 00:01:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51E2275CC
        for <linux-next@vger.kernel.org>; Wed, 13 Jul 2022 21:01:15 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id bh13so443044pgb.4
        for <linux-next@vger.kernel.org>; Wed, 13 Jul 2022 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Bic9s3laxqXlbEurFwwyIbuo/qgP81SPa3dKk0N9s/s=;
        b=Hu29NEZytLqcX43dFROwhdcyMSK8513jSvopLQOzYMEyXnmhOQC/EUvnAvzR8+46kM
         7yJda2lVQu27/wSI90CFmIH8B50mAvwBOIB4GZ1mhUIC0tLXDQtQ08wHWnrOsarj4ezZ
         WzAV8DWk+1zU+gwA7bg9JS4/DpwVzCdPHem4W+Nud61/1HaqmosVci4Aq/y5TpQKE2ZR
         IbFEcO7nYdR8emjYHn2+AAJLIVN6eehnf1kcp2iQsHm71u7HUb5kCPXujmnmN6dzFhfE
         EEtd5LlNpntged9B9f/qpyhKVxIN+/LFApZoOQS1uBoRCtK75V35gJeGuYbis4hebFdr
         QzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Bic9s3laxqXlbEurFwwyIbuo/qgP81SPa3dKk0N9s/s=;
        b=Ye7R5D5cnJDwyaGVYLn0D3cNaEfzafLuc5E6byRbcR02apR1QPQcOB8k5h+t29RYo2
         3XiQlzTUE7hRO7vfQli29pQtChtocsghTfXOPsg8Cqav8EmYBix73QNrgu0pBKYtBXMo
         0qrt+v1cqmIn94+fbtCjct1/6i5qRHyLYpBwCt7GSfMrQoRNrIcmxRjj4d0fXtWmJ0kX
         TPLB6KCNNPySPeWJGX8j3OwQIGaim0gu2a2Laox61IHJJUixwX0zrCzlrvCEQCyUeMCp
         Yy4BjEkt4Na1QYQC1KOZbqFlVLqj1f/IvNZj58Nj4ULznrNOF/UVhlAy5vUWx576RKAc
         xn3A==
X-Gm-Message-State: AJIora/cJ2P0Xaz3uLaGCJ/ulJahOOmkpKFBzXu3+QBazMhIUMbgCwxx
        V9UFChkjhT7CEt6NktQ+WmtkHtDek/cP6i0RRAY=
X-Google-Smtp-Source: AGRyM1u8ccJ3vwNox+aJs7/1Jy8K2MaIDDd8ljKpRl/15LreMcndAbx8/v8VoTknlWkf8Rr5QU8iyw==
X-Received: by 2002:a05:6a00:1d26:b0:528:3a25:ea3c with SMTP id a38-20020a056a001d2600b005283a25ea3cmr6308168pfx.67.1657771274799;
        Wed, 13 Jul 2022 21:01:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a5-20020a63e405000000b0041239bf9be8sm196724pgi.1.2022.07.13.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:01:14 -0700 (PDT)
Message-ID: <62cf950a.1c69fb81.fd5b8.0739@mx.google.com>
Date:   Wed, 13 Jul 2022 21:01:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc6-441-g4822e65f1f95
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 477 runs,
 29 regressions (v5.19-rc6-441-g4822e65f1f95)
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

next/pending-fixes baseline: 477 runs, 29 regressions (v5.19-rc6-441-g4822e=
65f1f95)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
da850-lcdk                 | arm    | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

kontron-kbox-a-230-ls      | arm64  | lab-kontron   | gcc-10   | defconfig+=
debug              | 1          =

mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+amdgpu      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+amdgpu      | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc6-441-g4822e65f1f95/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc6-441-g4822e65f1f95
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4822e65f1f95faeed22b61d56cd912fd6d49222a =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
da850-lcdk                 | arm    | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5b5180d1ce5382a39bd1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62cf5b5280d1ce5=
382a39bd9
        failing since 171 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-07-13T23:54:27.596341  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-07-13T23:54:27.596809  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-07-13T23:54:27.599458  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-07-13T23:54:27.642972  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf65acb7618ab8eca39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf65acb7618ab8eca39=
bdb
        new failure (last pass: v5.19-rc5-383-g73ad9bd963c1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls      | arm64  | lab-kontron   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5d538ce243d2aaa39c04

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
cf5d538ce243d2aaa39c0d
        failing since 44 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-14T00:03:04.828121  /lava-140517/1/../bin/lava-test-case
    2022-07-14T00:03:04.918004  <8>[   41.201350][  T311] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf6280cd890584bca39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf6280cd890584bca39=
bdd
        new failure (last pass: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5e7455cbf6b0b0a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5e7455cbf6b0b0a39=
bed
        failing since 63 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5e8355cbf6b0b0a39c4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5e8355cbf6b0b0a39=
c4c
        failing since 63 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5e7255cbf6b0b0a39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5e7255cbf6b0b0a39=
be7
        failing since 63 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5e5b415a458631a39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5e5b415a458631a39=
c13
        failing since 63 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5acbcae67c09ffa39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5acbcae67c09ffa39=
c0b
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5b6b236d98d049a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5b6b236d98d049a39=
be2
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5be51c7a763323a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5be51c7a763323a39=
bdb
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5be8e92e97e4b3a39bfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
aylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
aylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5be8e92e97e4b3a39=
bfe
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5d156d774901cba39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre=
/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre=
/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5d156d774901cba39=
be6
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5dba71b993ac6ea39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5dba71b993ac6ea39=
bcf
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5f6a50268c44efa39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5f6a50268c44efa39=
bd0
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5fc476475d4d51a39c3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5fc476475d4d51a39=
c3b
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5aaecae67c09ffa39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5aaecae67c09ffa39=
bdc
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5b775c6791b90ca39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5b775c6791b90ca39=
be4
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5c0468f542f8e8a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5c0468f542f8e8a39=
bdc
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5c3f61239b19a8a39bf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5c3f61239b19a8a39=
bf4
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5d2f7ee71fc80da39c17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/=
baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/=
baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5d2f7ee71fc80da39=
c18
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf5f37b213b59347a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf5f37b213b59347a39=
bcf
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf60b52eb85002dfa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf60b52eb85002dfa39=
bce
        new failure (last pass: v5.19-rc6-297-g1e717e841472) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf621d59572625cda39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf621d59572625cda39=
bf9
        failing since 0 day (last pass: v5.19-rc6-297-g1e717e841472, first =
fail: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf6785c8b30a2dffa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62cf6785c8b30a2dffa39=
bd9
        new failure (last pass: v5.19-rc6-382-gec832b259e17) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62cf620b8c6fbbab72a39bef

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc6-4=
41-g4822e65f1f95/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62cf620b8c6fbbab72a39c11
        failing since 135 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-14T00:23:21.525536  <8>[   53.919783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-07-14T00:23:22.549386  /lava-6814398/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62cf620b8c6fbbab72a39c34
        failing since 44 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-14T00:23:19.349246  <8>[   51.742486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-07-14T00:23:20.378410  /lava-6814398/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62cf620b8c6fbbab72a39c35
        failing since 44 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-14T00:23:18.305293  <8>[   50.698675] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-07-14T00:23:19.336812  /lava-6814398/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62cf620b8c6fbbab72a39c36
        failing since 44 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-14T00:23:18.293515  /lava-6814398/1/../bin/lava-test-case   =

 =20
