Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F108452E438
	for <lists+linux-next@lfdr.de>; Fri, 20 May 2022 07:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345367AbiETFP0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 May 2022 01:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345345AbiETFPY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 May 2022 01:15:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2487A5ABB
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 22:15:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id m12so6493370plb.4
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 22:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VyFC592V1bwqYSPPbWiBTZco2d8hITEIgnIq3dxm5q0=;
        b=kOxyAOdxB5ICVv9uni3kQRkw1fRJgP7iWQiWtP6QwjvnF4dIzrK3denKk6ltVPnfB7
         yoLcB6HwcXdjp7eND6hXR7yqFiFQuxzpfxQAWQHJkiz+ywYDSH/Cdips3/lMbauVjFnO
         wVSkqzeFH2dkly37V3I/lIwm6DvV9x/36VNFsPHssFEhFmVHvZ+74UyShz4MNR2RYUjY
         3nLibTEQgWlAOPJTORSKaeJe9LxlppcqwtWUkH7dxMdHlmzUcEoumMo9peRFdj0slUkZ
         /kjgROVeuifKoeq1gJjXzVnZ6gnDU/vNv+jp5POcIUFQt9BivgUS2QHq3gPCq78EsBFf
         b9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VyFC592V1bwqYSPPbWiBTZco2d8hITEIgnIq3dxm5q0=;
        b=GEthCOdMbmv2Ts8Y9uGQZUGOc2WKcVnLrqXSpNB9tkWdfcpBvKRfwZDl+J2QDChCqD
         na8E56DDjhY8g49RW0MuNsBqOnTpHZgsldQowrll44yADyV0RdUmnlmSBps+sAQqPTD5
         D0V4S+/9r5xmgI2S6LqxPS95aJQuGv6A70KC0DfIRrWHhQvI1zHPixbPyetxdFuqFQ0n
         BxC/s1Ipw8cbHj9Lde74aKjg0d1e93A5/NaOEZGMZxzYCUKcgnpVwG+f3xUTWnvQzD3u
         LpGsZw4NFh/BqQISdhs7UP7ufxj7eQ+7wuBm5W3O9f6AUM9yr9Wxrtn1KaVpoSftGSiL
         Oa9A==
X-Gm-Message-State: AOAM532WGTAbGmYWN0Y8pRIfn81a80T9VoFsnOyAJkPeuGE5FRZ2em52
        frLNiqs/nMXbBowoaJFCIUsa9sPCsvrsxtd5oRE=
X-Google-Smtp-Source: ABdhPJxa90mSRKyKSf9li9GQHWoxtaVzv3bMEPf6GDeN+XfBbp49PW2VocyhRGV0ARdfv9BTPTtEZA==
X-Received: by 2002:a17:90b:48c6:b0:1df:99d9:997f with SMTP id li6-20020a17090b48c600b001df99d9997fmr8964814pjb.242.1653023719198;
        Thu, 19 May 2022 22:15:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y16-20020a62b510000000b0051843980605sm642964pfe.181.2022.05.19.22.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 22:15:18 -0700 (PDT)
Message-ID: <628723e6.1c69fb81.c5638.211a@mx.google.com>
Date:   Thu, 19 May 2022 22:15:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-rc7-251-g195d7f7a62c6
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 379 runs,
 15 regressions (v5.18-rc7-251-g195d7f7a62c6)
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

next/pending-fixes baseline: 379 runs, 15 regressions (v5.18-rc7-251-g195d7=
f7a62c6)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+debug              | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc7-251-g195d7f7a62c6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc7-251-g195d7f7a62c6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      195d7f7a62c605cc31548e3ff357347383d9575a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6286e9e84415109d38a39bda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6286e9e84415109=
d38a39bde
        failing since 116 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-20T01:07:09.556420  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-20T01:07:09.556814  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-20T01:07:09.559504  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-20T01:07:09.601632  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6286f6fa4616fa5422a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286f6fa4616fa5422a39=
bce
        failing since 20 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6286f904ab2f5375cba39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286f904ab2f5375cba39=
bd2
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6286fc4c4835922f4ba39c39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286fc4c4835922f4ba39=
c3a
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6286fddccd55fa7568a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286fddccd55fa7568a39=
bdb
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee64a2c0b0c023a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee64a2c0b0c023a39=
bcf
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6286f0f4963958c2bea39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286f0f4963958c2bea39=
bee
        failing since 10 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6286f0e4963958c2bea39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286f0e4963958c2bea39=
be0
        failing since 10 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee78a0f9a2c9e6a39c1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee78a0f9a2c9e6a39=
c1e
        failing since 9 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee6ea0f9a2c9e6a39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee6ea0f9a2c9e6a39=
bfa
        failing since 9 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee188cd58d4dbea39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee188cd58d4dbea39=
c0b
        failing since 9 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee5adc9c3e3759a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee5adc9c3e3759a39=
bfb
        failing since 9 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6286f0e090685bea28a39c48

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6286f0e090685bea28a39c6e
        failing since 80 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-20T01:37:21.604693  /lava-6428442/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ece0fb7f1e7e12a39c71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ece0fb7f1e7e12a39=
c72
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6286ee51dc9c3e3759a39be9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
51-g195d7f7a62c6/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6286ee51dc9c3e3759a39=
bea
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =20
