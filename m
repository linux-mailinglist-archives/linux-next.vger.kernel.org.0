Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CC242B0F6
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 02:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhJMAc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 20:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhJMAc4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 20:32:56 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9F3C061570
        for <linux-next@vger.kernel.org>; Tue, 12 Oct 2021 17:30:53 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so916408pjb.3
        for <linux-next@vger.kernel.org>; Tue, 12 Oct 2021 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WGFy10WP3aPHsz7S4WxBVUJoVgfDGVWStEsUxttsclc=;
        b=iacRt2GSgqHG/wwO6apOmVm2WokPhHkYP+i8KncSb6/9REbLKfh7VZRClVzM1ULXlO
         skXf9/YKFxfpjHf38VSQ/yIBCZI/h4pLg24sG0ZwLDIMsaw1/9fXPVBDg3Z83djjEiI6
         I1K8ycHPsk4MHQOZAoJPuFAfXCNPl2r53B9OU4+FMwueuxhlrN1ohcO3YkD15s2IFVwp
         0CJKOsXpUbbO/5hJ4YCp9riGK6977xonprEXaz8Lismk6CFYBIUeseJtya2VRLUc7Jld
         rk9IMf3/t8dR7fCqDW7Ho7CucRbnlu3BjdWwG4gH/UmLODe7QswygFVRjMgAyFRYGS2G
         LMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WGFy10WP3aPHsz7S4WxBVUJoVgfDGVWStEsUxttsclc=;
        b=kmDb2706ldFPQEcPqKOGzYdu2bECu+xqznmckpNMKeHH9YKZPIsfq0siB09nbS4Dzv
         1+Ol/8c/gOTI7V7Pr6IfuAsg4Knmu2iPmj7wYghxpcSd+Un9e+yIleNWh4RltjZVorXJ
         sbWJPCN9E6YVKFlLVp/w13J69hGubbX/EQM4lMpX9VREsjaHnZ+EuwMuYl3eyXv3iiKq
         E0UOj8jXjO6ia0z2GLWUR+GdiUa8RUNC3K2d7wQQ24uLHkvukiwNYWqe0cCuC2qocQeE
         48/AWTmsPF34MWqlEgJ4n6X6STooiwAtHr+XFDY2QE28HwHELjtdFFQ/RyDkkZx1ud4s
         4uCw==
X-Gm-Message-State: AOAM533sZ5TIbeHFGAra3ffpAIWEeoqbt1612fsBu3IcqGMddh9VBYfk
        795ROktmVbutG+N0kxX3zfxpUgwuVWH5JdNd
X-Google-Smtp-Source: ABdhPJyXLv8VtvGemspR+yYQWCr1azV6VEkxRlXWJBu3jYU7iMsHWGLJGPuZCHTILdPIh0/kWW1tSg==
X-Received: by 2002:a17:90b:380d:: with SMTP id mq13mr9669362pjb.131.1634085052688;
        Tue, 12 Oct 2021 17:30:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s2sm4037648pjs.56.2021.10.12.17.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 17:30:52 -0700 (PDT)
Message-ID: <616628bc.1c69fb81.7f2f2.cb1e@mx.google.com>
Date:   Tue, 12 Oct 2021 17:30:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.15-rc5-210-gee0ce4e51d06
Subject: next/pending-fixes baseline: 191 runs,
 8 regressions (v5.15-rc5-210-gee0ce4e51d06)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 191 runs, 8 regressions (v5.15-rc5-210-gee0ce4=
e51d06)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig+crypto | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
            | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig       | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig       | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig       | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
            | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc5-210-gee0ce4e51d06/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc5-210-gee0ce4e51d06
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee0ce4e51d069528a1256b8e877cbea983e78130 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/6165ec842ee46775a108fab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165ec842ee46775a108f=
ab7
        failing since 13 days (last pass: v5.15-rc3-320-g55d87bb21463, firs=
t fail: v5.15-rc3-355-gce19122666db) =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6165f18e7589d1598e08fab4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165f18e7589d1598e08f=
ab5
        failing since 103 days (last pass: v5.13-rc7-277-gfd6ae26c403a, fir=
st fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig       | 1          =


  Details:     https://kernelci.org/test/plan/id/6165f36aee010f3e5308fac1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165f36aee010f3e5308f=
ac2
        failing since 330 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig       | 1          =


  Details:     https://kernelci.org/test/plan/id/6165f544eac4fd657808faaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165f544eac4fd657808f=
aab
        failing since 330 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig       | 1          =


  Details:     https://kernelci.org/test/plan/id/6165f3efed4b0bc16008fadf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165f3efed4b0bc16008f=
ae0
        failing since 330 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/6165f0ad3fe8fad28708faea

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6165f0ad3fe8fad28708faf4
        failing since 91 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-10-12T20:31:31.974844  /lava-4704650/1/../bin/lava-test-case
    2021-10-12T20:31:31.986741  <8>[   25.180618] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6165f0ad3fe8fad28708faf5
        failing since 91 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-10-12T20:31:30.941848  /lava-4704650/1/../bin/lava-test-case
    2021-10-12T20:31:30.953192  <8>[   24.147527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
            | regressions
------------------------+-------+---------------+----------+---------------=
------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6165f1947589d1598e08faba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
10-gee0ce4e51d06/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6165f1947589d1598e08f=
abb
        failing since 7 days (last pass: v5.15-rc3-397-g80b7383f5539, first=
 fail: v5.15-rc3-416-g4d5a088c93ce) =

 =20
