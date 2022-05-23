Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B373B531C94
	for <lists+linux-next@lfdr.de>; Mon, 23 May 2022 22:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiEWRDK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 May 2022 13:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiEWRDH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2022 13:03:07 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F9F53E15
        for <linux-next@vger.kernel.org>; Mon, 23 May 2022 10:03:05 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n18so13654442plg.5
        for <linux-next@vger.kernel.org>; Mon, 23 May 2022 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nDXGoEwSIFZLCyB5rTyPhcoayYB3ur2BrcP6pt+2UVE=;
        b=LWctrMeElW+rutSfiYIY1c9ugRTThN+2dgsT9x6scaQ67PtUQVsfbhaoKMxfFzO3sb
         LsVJcd/D5ALmfOKmUnsUBCm39J+0KvLcSiAOupdsKG21gKl/B2EsoxwNJWkW2lePISwv
         jo5nsTFGRYmlp9Uw07kjqgxFl1zl7xxt8p8uagtQ0lJlhWF13CgCmwQoYH0L5VVSfomM
         vQG9PCDaKKQybThtHS3WCPAHElaW8+maFyJ0Ga5Epy3bOmQ4ZDVkxR651rBXDN9sNmsk
         Ug6tgK7ouWUul8FX9+vc7X7nJTSWDHKvJveBjk/TZzyz/1fsvUrpTayqfJua0v0T+csV
         Zobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nDXGoEwSIFZLCyB5rTyPhcoayYB3ur2BrcP6pt+2UVE=;
        b=KulUDyvlxcMkVUtFnz4f+j0+XqqE0+2OTSze4vQvxt5Hdu/Z+RmHgdIAU/iI92x0w5
         oCi1ezHGjPjXZUlnGOZI569dgPjyAvZL4+Mhh9Ln2CqjJ08KBv0bluX+zUAtgz8UJLd3
         3fMWhbKu6LIkXE0luh6I8kdJh4XwJUelBDFd3P8fda599F8us9z6aB+7t6c2KI+/rzxo
         KyUK8F3a8TtmSFem/+w845gI5k6VN3UWeHeHmLcODLIlSFLXOVpGlzjvepmdTEt0k58E
         e1gTl60jNjN4awGoY84JDeVL6N2n8fLKiiTBNhB2LkRa6ZYOqyn+9BinnUpYiszS7Vt/
         Pm6w==
X-Gm-Message-State: AOAM533cPYrZVKBQszrBJHLW6w8zu3jEsbQF/aMIvQZzMyCYIj/0ikJn
        zz6LLwlGcaYyCOGviDcmjpreKCnupOMIiXxlD7Y=
X-Google-Smtp-Source: ABdhPJzyx7M9gY5kZFV7ceZD74RD2xrTTxkoiaCPCe74xQs+xGXHRY801CRW39xynReD6G4/XbYWMw==
X-Received: by 2002:a17:903:40c5:b0:162:120:194b with SMTP id t5-20020a17090340c500b001620120194bmr13468830pld.80.1653325384722;
        Mon, 23 May 2022 10:03:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f21-20020a637555000000b003c6a37b1628sm4919714pgn.13.2022.05.23.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:03:04 -0700 (PDT)
Message-ID: <628bbe48.1c69fb81.aa25.ba3b@mx.google.com>
Date:   Mon, 23 May 2022 10:03:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-155-gb82692513a38
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 408 runs,
 14 regressions (v5.18-155-gb82692513a38)
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

next/pending-fixes baseline: 408 runs, 14 regressions (v5.18-155-gb82692513=
a38)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | tegra_defco=
nfig              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-10   | defconfig+d=
ebug              | 1          =

tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fconfig           | 1          =

tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | tegra_defco=
nfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-155-gb82692513a38/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-155-gb82692513a38
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b82692513a382ca90524b1c39dcd06852356d970 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/628b83d3c9a5c8e93ca39bdd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/628b83d3c9a5c8e=
93ca39be5
        failing since 119 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-23T12:53:31.164367  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-23T12:53:31.165188  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-23T12:53:31.167885  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-23T12:53:31.211824  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/628b85db694dbd26efa39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b85db694dbd26efa39=
be0
        failing since 3 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8975fabff95b7da39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8975fabff95b7da39=
be5
        new failure (last pass: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8b57c5323b7e69a39c26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8b57c5323b7e69a39=
c27
        failing since 23 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8be1fb51b99d12a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8be1fb51b99d12a39=
bdd
        failing since 3 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | tegra_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b88201fee2b2920a39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b88201fee2b2920a39=
c13
        failing since 3 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8ae8a68e4cf39aa39c73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-=
virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-=
virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8ae8a68e4cf39aa39=
c74
        failing since 12 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8c0168e71ae566a39c02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8c0168e71ae566a39=
c03
        failing since 12 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8aea2d59ef2b45a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-=
virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8aea2d59ef2b45a39=
bd3
        failing since 12 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8c0234a6bbd2faa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8c0234a6bbd2faa39=
bce
        failing since 12 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8acea68e4cf39aa39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64-ba=
nanapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64-ba=
nanapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8acea68e4cf39aa39=
bee
        failing since 3 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8e0821378bd8e4a39bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8e0821378bd8e4a39=
bf1
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/628b917d72aeafae48a39c2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b917d72aeafae48a39=
c30
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
tegra124-nyan-big          | arm   | lab-collabora | gcc-10   | tegra_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/628b8eeaf813bb6489a39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nya=
n-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-155-g=
b82692513a38/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nya=
n-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628b8eeaf813bb6489a39=
bfa
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =20
