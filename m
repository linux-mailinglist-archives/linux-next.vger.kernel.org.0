Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF3C52B0EE
	for <lists+linux-next@lfdr.de>; Wed, 18 May 2022 05:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiERDxN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 May 2022 23:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiERDxI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 May 2022 23:53:08 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158E7B36C3
        for <linux-next@vger.kernel.org>; Tue, 17 May 2022 20:53:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n18so617188plg.5
        for <linux-next@vger.kernel.org>; Tue, 17 May 2022 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yRtpOiGWrva5Ifj96I3w9XIUIxlF36mqzDtQ2jYsaFM=;
        b=MKmtHZWt/GwU2ToYyrdziGqffOL3ZxVw3kQjsBxCaE21WjgxuoCO7Mwt2lv6pp8wkf
         DhFedH+5e78tX0fg2Sf1nt4ODkpQqr67fzBPs+CFJWySCP5Q7T+6URTvleP+huQdKsIU
         LF1pUl1XvbCAORO8KhKCS3Hni+XnFd2o9/f0/SI/nEjgxNv5oODF9svCwUVWz0lbFcgz
         2HV6yQS5lmpai1zdpQ/3/p8moNR5V1qVoOzlh0iD+3Gl4adJhy/qHZWWaQizLctQp7no
         JAT3229xG6MK6j6pLu25qhjKdZ2zgQrPhxj8NH5AnxIsCn2q3L0Rnsi0DicrHoVPXvs+
         JMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yRtpOiGWrva5Ifj96I3w9XIUIxlF36mqzDtQ2jYsaFM=;
        b=hrw5j3ZBRcoyAgyQ2SfZ3NUFjLj9SgcRHdAGHhMiZg56D+h/v/TRxQ8WQqmHupB2n4
         HNrh3fiGF1O/RZj5rG0tnZsaGPK1dVDSW6dkJtNdgMHYet7G4XkzFlmXLU3QB0ilAkcy
         g7hnHh5m/Yj7VRtDMG48k80vYhPOaPz+rgGzYSLTR9uUIRKqqyFm/z4wsOqEpTbH+uck
         zfw9pwm1LnFNnDYqa0qZsFg7/OsDgUHPM+RIeKtwbARKULwQ1iCRG12KNCU0H5C9eQZJ
         wCoyv1uDTCfceU0RyG15U8Gne6Zb5MlZfLqilW3Esesl9G3voH5lLMyg4f+zJsxHb64H
         rE2Q==
X-Gm-Message-State: AOAM530TIhl1OMzYbUtaLwx44RbbQm7QPptl05mIjjdRGV3v5IAhHJsZ
        xoC89f3az6g4KfpNOeNDj8Hvmvq2FTNiCpNOp+A=
X-Google-Smtp-Source: ABdhPJyRiWIVcTxJErORHEYRLsyphvAVH81jehF8IDNmqhU8OuHAVRzhu7IrnR/qFErFVaJhW6mgcw==
X-Received: by 2002:a17:90b:4d07:b0:1dc:e9bc:9a96 with SMTP id mw7-20020a17090b4d0700b001dce9bc9a96mr28437538pjb.163.1652845985236;
        Tue, 17 May 2022 20:53:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902650a00b001618b4d86b3sm389193plk.180.2022.05.17.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 20:53:04 -0700 (PDT)
Message-ID: <62846da0.1c69fb81.0dd8.17b4@mx.google.com>
Date:   Tue, 17 May 2022 20:53:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-rc7-165-g2424086909d29
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 471 runs,
 7 regressions (v5.18-rc7-165-g2424086909d29)
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

next/pending-fixes baseline: 471 runs, 7 regressions (v5.18-rc7-165-g242408=
6909d29)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc7-165-g2424086909d29/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc7-165-g2424086909d29
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2424086909d2986049c49936822527ee8271f573 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62843938604cb27ce5a39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62843938604cb27ce5a39=
c13
        failing since 8 days (last pass: v5.18-rc5-278-ge8576d28ffc9, first=
 fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/628439408de4b312c3a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628439408de4b312c3a39=
bd3
        failing since 8 days (last pass: v5.18-rc5-278-ge8576d28ffc9, first=
 fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/62843ca813189735eea39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62843ca813189735eea39=
bd8
        failing since 7 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/62843c910bce7807fca39c53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62843c910bce7807fca39=
c54
        failing since 7 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/62843ca74356e60d3da39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62843ca74356e60d3da39=
bce
        failing since 7 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/62843c8ff2902f47c9a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62843c8ff2902f47c9a39=
bd9
        failing since 7 days (last pass: v5.18-rc5-178-g63184bc90d435, firs=
t fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62843a899d2255d0bea39bdb

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-1=
65-g2424086909d29/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62843a8a9d2255d0bea39c01
        failing since 78 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-18T00:14:45.900242  <8>[   34.285108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-18T00:14:46.926809  /lava-6409301/1/../bin/lava-test-case
    2022-05-18T00:14:46.937895  <8>[   35.322689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
