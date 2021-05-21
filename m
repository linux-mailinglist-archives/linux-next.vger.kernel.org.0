Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C8F38C6B6
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhEUMpe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 08:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhEUMpe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 08:45:34 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1F9C061574
        for <linux-next@vger.kernel.org>; Fri, 21 May 2021 05:44:10 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q15so14107687pgg.12
        for <linux-next@vger.kernel.org>; Fri, 21 May 2021 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=g6COOB2CYSMvvZKfiX3My3zi49i0sKZye6wLNMEOsko=;
        b=qYco5dbi/YOkkWn9Kh2hYTr9StG22DvO0Fsp7/NwZSjyqaaUBoxutUWpwmtoLrFHDv
         BkoDB/EVKcYsq+plKcX+kwOF+lXj97tuUtj1GeQnATepBEIe3HDc+Zy89KGYZwOrlnah
         lwF7WkT7ntuTs/DZxfbdTGQstMvNuQaj5FP5ZlkUPybjh+N+8T0AJ/U5KIHTamPWzTU2
         fBHBbqfsSWTXtwMjURbsiKlRElpbDRmyIlSOs1aK/lDbGq2deeTZnRAZHUDdICxOkLh1
         Z5z9+jmcnR80gPMvASHyzgR4nmd6b0dOb9VUVNNvvK5BVt3ta2iMkddklOdHQTO9bcmT
         F4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=g6COOB2CYSMvvZKfiX3My3zi49i0sKZye6wLNMEOsko=;
        b=FcsxFIP/RY8LLhcKL1iYsii/gX3Jj1bt1jn5S38WT1RPXTvaFrknDvJGKb1eSDNkhF
         BEHwHIBD3W436pXphfHDC3XEft45u+2JABKFBxkxb9VbJTNm7zd76Qtk/7JdEG5Sma6Z
         Vqz0zBg1WF15V7WiQVcgu1wai820HqxWGSc2LJfk1sxO2dXLUu9+LyeURVRdOPkzExML
         D6JOrwyaZc5EhEAjggtuTv5fzMGwD6WpvsCUsajcYDfWk+3Su6BecXSRAj8SNb7BdCvt
         jv9syX574uW7+slfCKMW07KJ3vUVYz9L9OGx6M5zjvbr0x1Sp1O6LomP2vHjQAlQNSLL
         NRAw==
X-Gm-Message-State: AOAM532iZXPkpL+UGvaa7oNAuqebd9BXzhOtmStWzqTj3W56XoFIUFs8
        evCYwgBq0lq9hQsJ5dqHt2TagB7KK6axfmj0
X-Google-Smtp-Source: ABdhPJydY542sRNyaFMYO0tym59xWwsODfjIZ9RU/Ue/pl7ZNpGa1KpVAczvw6Z1rCxrq1FsK/ArsQ==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id z65-20020a6233440000b029024c735c4546mr10047201pfz.1.1621601049295;
        Fri, 21 May 2021 05:44:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k15sm4440710pfi.0.2021.05.21.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:44:08 -0700 (PDT)
Message-ID: <60a7ab18.1c69fb81.886e3.f5e6@mx.google.com>
Date:   Fri, 21 May 2021 05:44:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.13-rc2-481-g054f1a7414a0
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 270 runs,
 10 regressions (v5.13-rc2-481-g054f1a7414a0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 270 runs, 10 regressions (v5.13-rc2-481-g054f1=
a7414a0)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana          | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc2-481-g054f1a7414a0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc2-481-g054f1a7414a0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      054f1a7414a07b19e6e2bb02e4cdb0c2d50d8545 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a76f8069901201ffb3afa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a76f8069901201ffb3a=
fa9
        failing since 207 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60a77f091ee71f981bb3afbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a77f091ee71f981bb3a=
fbf
        new failure (last pass: v5.13-rc2-449-g435e556b2959) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
mt8173-elm-hana          | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60a775cb07d0c68412b3af97

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60a775cb07d0c68412b3afab
        failing since 23 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
775cb07d0c68412b3afb1
        failing since 23 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-21 08:56:38.883000+00:00  /lava-3820165/1/../bin/lava-test-case
    2021-05-21 08:56:38.891000+00:00  <8>[   56.901621] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a76de12a38f193f4b3afa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a76de12a38f193f4b3a=
faa
        failing since 186 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a76dc8beee84ad96b3af9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a76dc8beee84ad96b3a=
f9e
        failing since 186 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a76dfb193e52aab6b3afb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a76dfb193e52aab6b3a=
fb6
        failing since 186 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a77244f5ba4532e6b3afc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a77244f5ba4532e6b3a=
fc4
        failing since 186 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a783ea0f2ad774c7b3afc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a783ea0f2ad774c7b3a=
fc8
        failing since 186 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60a775fa2dd9013f14b3af97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc2-4=
81-g054f1a7414a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a775fa2dd9013f14b3a=
f98
        new failure (last pass: v5.13-rc2-449-g435e556b2959) =

 =20
