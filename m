Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3526535A159
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 16:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhDIOny (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 10:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhDIOnv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 10:43:51 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C26C061760
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 07:43:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t22so2537881ply.1
        for <linux-next@vger.kernel.org>; Fri, 09 Apr 2021 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=amJeHlesU8YDMwdljSxR3iYLpbvm9/zSNsL1KCOBS4o=;
        b=Cqs+cF0sx6htYBSXb6VgJkF8xi8eFY60hiElZpVv23CokFAFNJiJW3EhOLZ3PnYduy
         F8E7JNWhlNYkRFFvo7ENVKpV2c13I4feKTeggvw1cdQaIPgA45db77nFOGQDblysrjv6
         a7dR/6CFE5DyW9B+w844JSivCd6eiDgttU4mfZrcraxk/g/Vghvtgz9qceeRnxF0QkaH
         f5VLGwSoSgWN8tujr6WNJQCx0FM4FeJfgQBd/uS1fV4l1BTKu0X4FgXpgOwimdLaUvGr
         1VjJKcT/GKkQjV+TGaQLK5ReH1TfBThDsNuH8cGKrs2BzTv3fksnaxBSbrFuSuGAShoY
         gA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=amJeHlesU8YDMwdljSxR3iYLpbvm9/zSNsL1KCOBS4o=;
        b=hz6Vrb76nAkSVctzxaHW71+f7/HIGN+AncIqB2uWcnl04jiLWc0CZN/p8ShMfFQj99
         mtyXO3EDPAEYhpAguX6bpLmeeNuj1+rqwWe6uqGy+wG/rZ6llxUnjyRfyJI59Vz5FLtF
         +K/D3eyYtQJU11YRs5JUwSRAsD5fWfLKxnioXTo6ALkGv8cbeWKvJ1NPz5mbqCwnha6N
         7a8D7PsRRsyzJuHYNpJYzBVEIQcncN/CDDX1+dKncSXBvbt+xQhkxKbpEVCb+MMSFjS/
         1f/rxLAeCOiQ/sImaNwEASzljmdgzXmCsZCLVjozC2bzp1akZgEBIAc2Z+r+uVmzJrdA
         4GRQ==
X-Gm-Message-State: AOAM531dTxhg35dJGj7/0O7aZBXs7zTppYu5d27kqlJRyRyDtfJckWmp
        EH9GZmLv6vWi/xBdEO7+8sOQ+UWAurqEh3i1
X-Google-Smtp-Source: ABdhPJzjKKFZBIjxGT66M2cGI2mF9O1Q28YKf96GlcPzjeuuWVgViDmuW/GREOES7iGMYHKiuxxKlQ==
X-Received: by 2002:a17:90b:374a:: with SMTP id ne10mr14165852pjb.102.1617979417417;
        Fri, 09 Apr 2021 07:43:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w21sm2660038pjy.52.2021.04.09.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 07:43:37 -0700 (PDT)
Message-ID: <60706819.1c69fb81.f38f.6a16@mx.google.com>
Date:   Fri, 09 Apr 2021 07:43:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210408
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 481 runs, 31 regressions (next-20210408)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 481 runs, 31 regressions (next-20210408)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | bcm2835_defcon=
fig            | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-11 | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre  | clang-11 | defconfig+CONF=
IG_EFI=3Dn       | 1          =

imx8mp-evk              | arm64 | lab-nxp       | clang-10 | defconfig     =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | clang-11 | defconfig     =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig     =
               | 1          =

mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =

mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210408/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210408
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6145d80cfc62e3ed8f16ff584d6287e6d88b82b9 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6070312cfe264541f7dac728

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070312cfe264541f7dac=
729
        failing since 11 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60702bd47b76328734dac785

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60702bd47b76328=
734dac78b
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 10:26:04.289000+00:00  kern  :alert : Mem [   21.427182] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 10:26:04.290000+00:00  abort info:
    2021-04-09 10:26:04.290000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60702bd47b76328=
734dac78c
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 10:26:04.294000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 10:26:04.295000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 10:26:04.296000+00:00  kern  :alert : Data abort info:
    2021-04-09 10:26:04.296000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 10:26:04.341000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:26:04.343000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.465990] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 10:26:04.344000+00:00  dp=3D0000000007202000
    2021-04-09 10:26:04.344000+00:00  ker[   21.477043] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 79244_1.5.2.4.1>
    2021-04-09 10:26:04.345000+00:00  n  :alert : [0000000000000050] pgd=3D=
0800000007201003
    2021-04-09 10:26:04.346000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60702e1917afcb6087dac6f1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60702e1917afcb6=
087dac6f7
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 10:35:45.053000+00:00  kern  :alert : Mem abort info:
    2021-04-09 10:35:45.054000+00:00  kern  :aler[   21.656825] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-09 10:35:45.054000+00:00  t :   ESR =3D 0x96000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60702e1917afcb6=
087dac6f8
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 10:35:45.058000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 10:35:45.059000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 10:35:45.060000+00:00  kern  :alert : Data abort info:
    2021-04-09 10:35:45.060000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-09 10:35:45.061000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:35:45.096000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002811e00
    2021-04-09 10:35:45.097000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000cfa0003, p4d=3D080000000cfa00[   21.702412] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-11 | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60702d8e159428d434dac6c3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60702d8e159428d=
434dac6c9
        failing since 2 days (last pass: next-20210322, first fail: next-20=
210406)
        11 lines

    2021-04-09 10:33:24.464000+00:00  kern  :alert : Mem [   21.469305] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 10:33:24.465000+00:00  abort info:
    2021-04-09 10:33:24.466000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-09 10:33:24.467000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 10:33:24.467000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60702d8e159428d=
434dac6ca
        failing since 2 days (last pass: next-20210322, first fail: next-20=
210406)
        2 lines

    2021-04-09 10:33:24.471000+00:00  kern  :alert : Data abort info:
    2021-04-09 10:33:24.472000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 10:33:24.506000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:33:24.508000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.508432] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 10:33:24.509000+00:00  dp=3D000000003a8f5000
    2021-04-09 10:33:24.510000+00:00  ker[   21.519000] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 79329_1.5.2.4.1>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607029cc145f1c1395dac6b4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607029cc145f1c1=
395dac6ba
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 10:17:26.321000+00:00  kern  :alert : Mem [   21.552250] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 10:17:26.322000+00:00  abort info:
    2021-04-09 10:17:26.322000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-09 10:17:26.323000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 10:17:26.324000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607029cc145f1c1=
395dac6bb
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 10:17:26.328000+00:00  kern  :alert : Data abort info:
    2021-04-09 10:17:26.329000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 10:17:26.362000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:17:26.364000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.591566] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 10:17:26.364000+00:00  0003a545000
    2021-04-09 10:17:26.365000+00:00  kern  :aler[   21.602384] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 79195_1.5.2.4.1>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60702a806136a5aff0dac6b5

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60702a806136a5a=
ff0dac6bb
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 10:20:26.721000+00:00  kern  :alert : Mem abort in[   21.537=
813] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-09 10:20:26.722000+00:00  fo:
    2021-04-09 10:20:26.722000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-09 10:20:26.723000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 10:20:26.724000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60702a806136a5a=
ff0dac6bc
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 10:20:26.728000+00:00  kern  :alert : Data abort info:
    2021-04-09 10:20:26.729000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 10:20:26.762000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:20:26.764000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a96a[   21.577781] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 10:20:26.765000+00:00  000   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60702ef5dd10f93fcfdac6cb

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60702ef5dd10f93=
fcfdac6d1
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10407)
        11 lines

    2021-04-09 10:39:28.576000+00:00  kern  :alert : Mem abort info:
    2021-04-09 10:39:28.577000+00:00  kern  :aler[   21.735200] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-09 10:39:28.578000+00:00  t :   ESR =3D 0x96000007
    2021-04-09 10:39:28.579000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 10:39:28.579000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 10:39:28.580000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 10:39:28.581000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60702ef5dd10f93=
fcfdac6d2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10407)
        2 lines

    2021-04-09 10:39:28.585000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 10:39:28.618000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002a32000
    2021-04-09 10:39:28.619000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000ca50003, p4d=3D080000000ca50003, pud=3D080000000ca50003, pmd=3D=
08[   21.783219] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 10:39:28.619000+00:00  0000000ca60003, [   21.793029] <LAVA_=
SIGNAL_ENDRUN 0_dmesg 79365_1.5.2.4.1>
    2021-04-09 10:39:28.620000+00:00  pte=3D0000000000000000   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60702bfc259398fcfcdac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702bfc259398fcfcdac=
6cd
        failing since 15 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre  | clang-11 | defconfig+CONF=
IG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/60702949b68c658fa6dac6e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702949b68c658fa6dac=
6e7
        failing since 94 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60702ddf6cdb10d362dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702ddf6cdb10d362dac=
6b3
        failing since 1 day (last pass: next-20210406, first fail: next-202=
10407) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | clang-11 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60702faf87eb542e58dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702faf87eb542e58dac=
6bb
        new failure (last pass: next-20210407) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60702b5db198b899f4dac6e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702b5db198b899f4dac=
6e1
        new failure (last pass: next-20210407) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60702c1065e73a2803dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702c1065e73a2803dac=
6bc
        new failure (last pass: next-20210407) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60702ddf17afcb6087dac6b1

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60702ddf17afcb6087dac6c5
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
02ddf17afcb6087dac6cb
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-09 10:35:07.376000+00:00  /lava-3488900/1/../bin/lava-test-case
    2021-04-09 10:35:07.383000+00:00  <8>[   59.015855] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60702a79da01621b9ddac716

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60702a79da01621b9ddac72a
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-09 10:20:36.164000+00:00  <8>[   57.918715] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
02a79da01621b9ddac730
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210406) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60702eeb13bb08bd8edac6bd

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60702eeb13bb08bd8edac6d1
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10407) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
02eeb13bb08bd8edac6d7
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10407)

    2021-04-09 10:39:35.271000+00:00  /lava-3488922/1/../bin/lava-test-case
    2021-04-09 10:39:35.280000+00:00  <8>[   58.234011] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60702a0c20d3d556c5dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702a0c20d3d556c5dac=
6c1
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60702a478157e093c1dac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702a478157e093c1dac=
6d1
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60702a5cf4a8472dfedac71b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702a5cf4a8472dfedac=
71c
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607029a9d1e2f8383adac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607029a9d1e2f8383adac=
6bc
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60702ee1fe07ec7baadac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60702ee1fe07ec7baadac=
6c1
        failing since 57 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60703035a775c765c7dac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210408/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60703035a775c765c7dac=
6eb
        failing since 57 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
