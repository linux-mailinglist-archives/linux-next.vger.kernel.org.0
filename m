Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3349951D054
	for <lists+linux-next@lfdr.de>; Fri,  6 May 2022 06:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbiEFEhF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 May 2022 00:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiEFEhE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 May 2022 00:37:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D83140A3
        for <linux-next@vger.kernel.org>; Thu,  5 May 2022 21:33:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x23so5307927pff.9
        for <linux-next@vger.kernel.org>; Thu, 05 May 2022 21:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZobU4sFHJVPdLd/ZvydOVJIik33oLar1+ICHbwV0V3k=;
        b=pzja46EB/vlcESEQijDBWBfL5miAZ5eq1WXD8Vi3dLSpK5FxGXmtNfAb0/L10osBJ1
         EeXAflp2BigtKUW+CPF+SsUCa6AOZVxJX6JRuLjGItsp1ziuTbfREcdulqlxxHpudKMj
         OoC2o4mjH++vhQHwzkwY4oCzndPA7OxjH7APz3B3/TqJD2cEjRHuSz+ql9L/S8A1bjyD
         m8R0tFkJF6FLJMmmGyfoAQFnXLMCIYsShDh5/781MQptSdZcrMXH78ZWH9erb/w6asL+
         L89QkgSaDmwCG0q+vJfWc2JPsO6gMxj7s+VsSUIRDWiUipPhsSWrcyxVmNXHrxwfoGZ7
         PYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZobU4sFHJVPdLd/ZvydOVJIik33oLar1+ICHbwV0V3k=;
        b=k+MHQh3xEUqer263eTIck4e7SRgB8K7EAIHukVaDYBq7mP+LBzRwUsRKASDug7ygKa
         kU9zQkDaZMj0pSC4c9oK3zRks44BEbw0qWmd7MoqRAqmA8n7wLhBgSZjMjR1MP3ynJZC
         YfF+/Z2OxgDYF7/7gv1dv1dKlGOllQmxmTqB6bRLEQ5s5uR6AMHsFd9xon3mgd7lrvJW
         F+0e5L/wynQVig1RnXuv8jPJl+nlV8rP2Po9Miz11lHvaXTw5zDVAzzOgv1v257rEmGX
         HhbCd1t4UDyJWJJ3gex07+jbVcd/r3T3IYtljoFCbUYpGGPFePTv76gXQ0sHkm5rw3Jf
         ye6A==
X-Gm-Message-State: AOAM531axFEXfLCWhDLJBf6riFr83kin+3JKkkW4opgJQMT6OPrx7k8t
        SjSdifKInCDVPdWSe5z/jyFgDxUwPk8KWLDPX5I=
X-Google-Smtp-Source: ABdhPJz99W+nL5VZPdqFESWFv28qZ2uvUQLsIVVgZbVvExCzaVHldpQq4LCYOiZHedFy3+dlgh1VFg==
X-Received: by 2002:a05:6a00:1824:b0:50c:e939:118a with SMTP id y36-20020a056a00182400b0050ce939118amr1483551pfa.15.1651811602283;
        Thu, 05 May 2022 21:33:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i130-20020a628788000000b0051082ab4de0sm250049pfe.44.2022.05.05.21.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 21:33:22 -0700 (PDT)
Message-ID: <6274a512.1c69fb81.ee13c.0c04@mx.google.com>
Date:   Thu, 05 May 2022 21:33:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc5-278-ge8576d28ffc9
Subject: next/pending-fixes baseline: 309 runs,
 5 regressions (v5.18-rc5-278-ge8576d28ffc9)
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

next/pending-fixes baseline: 309 runs, 5 regressions (v5.18-rc5-278-ge8576d=
28ffc9)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
at91sam9g20ek    | arm   | lab-broonie   | gcc-10   | multi_v5_defconfig   =
        | 1          =

da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =

imx8mn-ddr4-evk  | arm64 | lab-nxp       | gcc-10   | defconfig+crypto     =
        | 1          =

jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc5-278-ge8576d28ffc9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc5-278-ge8576d28ffc9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e8576d28ffc9f010be228cbc05ec1737ef37bd46 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
at91sam9g20ek    | arm   | lab-broonie   | gcc-10   | multi_v5_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/62746e49fc9fc9d6ee8f5733

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam=
9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam=
9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62746e49fc9fc9d6ee8f5=
734
        new failure (last pass: v5.18-rc5-229-gb1ef3301b238) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/62746c192a6828db5f8f572e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62746c192a6828d=
b5f8f5736
        failing since 102 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-06T00:29:54.134793  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-06T00:29:54.135139  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-06T00:29:54.135430  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-06T00:29:54.175338  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp       | gcc-10   | defconfig+crypto     =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/62746c74c0e4471a548f5757

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62746c74c0e4471a548f5=
758
        new failure (last pass: v5.18-rc5-229-gb1ef3301b238) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/627477e8a0765dc62f8f5727

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627477e8a0765dc62f8f5=
728
        failing since 6 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, firs=
t fail: v5.18-rc4-464-g425675974eb3) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6274705c6230f53b8d8f5727

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
78-ge8576d28ffc9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6274705c6230f53b8d8f5749
        failing since 66 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-06T00:48:00.948656  <8>[   32.350531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-06T00:48:01.977025  /lava-6282338/1/../bin/lava-test-case
    2022-05-06T00:48:01.988558  <8>[   33.389991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
