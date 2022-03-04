Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4474CD37C
	for <lists+linux-next@lfdr.de>; Fri,  4 Mar 2022 12:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236841AbiCDLbI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Mar 2022 06:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239615AbiCDLbH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Mar 2022 06:31:07 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0429F1B1259
        for <linux-next@vger.kernel.org>; Fri,  4 Mar 2022 03:30:16 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id gb21so7096494pjb.5
        for <linux-next@vger.kernel.org>; Fri, 04 Mar 2022 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Nk+nFefMSHtdoUyea8+zjOPlrIAivlAOvA5GWcRecaA=;
        b=XcVKd3kPFWUFtdkMI+SV7M9JglSfR6nMfHv6KzzmeKB5KufzC/GkSl4ZAnXmoEfTXX
         sqglyk52qafNf+592KcbQ7E53rTheesR+XQ26g9lHBnYeTYXHiKepuhxFok5rJjqvDJK
         045q47+fhtXHqZUFadSdFYTBVqsnyT3LHqqFMjDxShwxjS/yD9QWyDdATZEClK2sah2D
         to/Tl2R4w56zpu3Kd2pmavBg1aM4lBveDJBVM3qINzB8qfhOr5SHsfXmVsV6OdeFmS6j
         +wGMGgcY/2/f/3CtgJXjvri2IbQPDO4BS83iyZnGFk9n+TeaQDLGcQ5Is7/LCdFyHS0q
         cAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Nk+nFefMSHtdoUyea8+zjOPlrIAivlAOvA5GWcRecaA=;
        b=y/yj2o+lAtoyoo0Nw3s1q/kAEIsd9MM9nXYwOFi57JzLvnOZGy7cScxW8mdkUoyL/w
         BVDg2AHQvUGispu/82h7us3cwXx0DqLyhtsgP2yuDtk2MHruyd+ClDBnmybvb8r+hVBK
         029oy33w2wp6r7VHNqZT8IpILil5Uxj/tqcrBhWUu+6ps5qzZC7X00g3b/Euroe8xNsP
         ln/T9loCseaVGr0I0xv8jOfuFYbAf+1Dr+cgWz9UtOgaeAsknTHzyQXGkx7UzwkgLd33
         R5Ds+Wqv3lldSJHJd7Rjsq7Rtc3qQcuoJCLXNBLZ12hiwSK9wxOH08G8X8WWeJibYOf6
         313w==
X-Gm-Message-State: AOAM53120ZvgXOUa9FRhGL3mty8C+njOQToBzOJkX0UrDnLJdgTcZGU5
        DKtvYJpgr2YA9MmrNqvLvmlGFXX4ljYeCg/IqJE=
X-Google-Smtp-Source: ABdhPJyjSHoDxqiOxyiWCoC4d2Mg0wP2dyJUtr3U0AZcuO9iJYr6W1TMchw8fEgmjPYZ1Wvmdrs2MA==
X-Received: by 2002:a17:90a:c252:b0:1bc:52a8:cac8 with SMTP id d18-20020a17090ac25200b001bc52a8cac8mr10044830pjx.61.1646393415285;
        Fri, 04 Mar 2022 03:30:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p10-20020a056a0026ca00b004f38e426e3csm5594353pfw.201.2022.03.04.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 03:30:14 -0800 (PST)
Message-ID: <6221f846.1c69fb81.cc425.ee94@mx.google.com>
Date:   Fri, 04 Mar 2022 03:30:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc6-312-gf15bf60c638f
Subject: next/pending-fixes baseline: 168 runs,
 3 regressions (v5.17-rc6-312-gf15bf60c638f)
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

next/pending-fixes baseline: 168 runs, 3 regressions (v5.17-rc6-312-gf15bf6=
0c638f)

Regressions Summary
-------------------

platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
bcm2711-rpi-4-b  | arm64 | lab-linaro-lkft | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

bcm2836-rpi-2-b  | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =

rk3399-gru-kevin | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc6-312-gf15bf60c638f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc6-312-gf15bf60c638f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f15bf60c638f4bd55572d814df3fc67b16a31eca =



Test Regressions
---------------- =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
bcm2711-rpi-4-b  | arm64 | lab-linaro-lkft | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6221c7579e95b4356ac62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linar=
o-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linar=
o-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6221c7579e95b4356ac62=
969
        new failure (last pass: v5.17-rc6-278-g34490bca674f) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6221c8c51d3b6603a0c62994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6221c8c51d3b6603a0c62=
995
        failing since 15 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform         | arch  | lab             | compiler | defconfig          =
          | regressions
-----------------+-------+-----------------+----------+--------------------=
----------+------------
rk3399-gru-kevin | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6221c3f963fe32c096c62995

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
12-gf15bf60c638f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6221c3f963fe32c096c629bb
        failing since 4 days (last pass: v5.17-rc5-244-gd77a1b37f796, first=
 fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-04T07:46:43.955168  <8>[   32.837093] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-04T07:46:44.980850  /lava-5813867/1/../bin/lava-test-case
    2022-03-04T07:46:44.991914  <8>[   33.874770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
