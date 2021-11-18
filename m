Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F10E4553FD
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 05:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242452AbhKRE7n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 23:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242423AbhKRE7l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 23:59:41 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8832C061570
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 20:56:41 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id o14so4193176plg.5
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6L98EusZ+aeiRgJ02NLUvkF/p63ilTDo4RKa98WC/Dk=;
        b=azWo9SpQDiexK9vADVXHdrW4u4eM+0xsAHbzZyb3T2l/IGwMlPYQGnNr1PnPhzp5S8
         qdgiyB1arX44qaNlY7MSU3i+uxdal+DBlEQRy89/CSf3fPSGyY694SxzK6he3RQKg+y5
         tyLyf1sWvFCUowUrP3dSvMbqI9UUnMIi/AAbVEmlGQ829YZYvlIRaJt79qxrSSO/QOEH
         189sVVB/mpcET9dm6NH9H9JvuOCa6vGVJXUHQ95CMRAe2hYxn3DClYGpoi3OK4uOoBtx
         GAiZHqnkM1PPfj6HTo24S5w7jYlav4Tsa0Dk3VsDeO0ZVYWUEmqzvVPfxfAbRXZ5ecpD
         o9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6L98EusZ+aeiRgJ02NLUvkF/p63ilTDo4RKa98WC/Dk=;
        b=0UObZZQVo2YYQN9emduGKSnNaSysP6gtI06PZkczdEEGQFbqXNL6YuW9j59a8tkyn1
         JH+8kj2JX5NgSXed5IVZwrmhrQr8zoPuR3Q8Pr7727UVSu75qCmIprPus3bCSvaKT1MJ
         q2JntRqnhSJf41FfDvzDXtEl8F138ij0koAwEAGtmNtekwclnFZsFy/cxvIh9bsmZBUO
         FPKVVtjCczeScwJzoPJzWSKS7nUNyxreewpsP+7gBFfdByGZNlCZY8xy7rL39Klld03h
         CC7hkolyVijUGZQBZkf5V3xAFD+lkPn9xN8zVrRwPigB2/vbUVttjj6v+TTAdkCXLTZg
         hh/A==
X-Gm-Message-State: AOAM532wKgibw4SxaI0/h6Ddurld7wEWm84qpDMbBsbHVk7wRARMlLV3
        r92XPX5fmv+hNW8Fm95xQmlJ4w9Y2tOJXRRY
X-Google-Smtp-Source: ABdhPJyqd2zWV2qBQevm4KkJl4EBnqZx2tPrL053cdur+a8YTNI9MvnQUUnGCzLEayKCz28t28NUXA==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id b3-20020a170903228300b00141f858f9afmr63346812plh.80.1637211401236;
        Wed, 17 Nov 2021 20:56:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s5sm1030246pgq.62.2021.11.17.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 20:56:40 -0800 (PST)
Message-ID: <6195dd08.1c69fb81.f0377.4906@mx.google.com>
Date:   Wed, 17 Nov 2021 20:56:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc1-328-g11d53a03cd9e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 548 runs,
 4 regressions (v5.16-rc1-328-g11d53a03cd9e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 548 runs, 4 regressions (v5.16-rc1-328-g11d53a=
03cd9e)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 2          =

r8a77950-salvator-x        | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc1-328-g11d53a03cd9e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc1-328-g11d53a03cd9e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      11d53a03cd9ead2cc0b97e6ab103775536db5e6e =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6195a66bdedf5270aa3358fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195a66bdedf5270aa335=
8fd
        new failure (last pass: v5.16-rc1-213-g610c9ac03d76) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6195b0757e848966cc3358fc

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6195b0757e84896=
6cc335900
        new failure (last pass: v5.16-rc1-213-g610c9ac03d76)
        12 lines

    2021-11-18T01:46:03.276931  kern  <8>[   44.598830] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-11-18T01:46:03.278006  :alert :   ESR =3D 0x96000005
    2021-11-18T01:46:03.279076  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-11-18T01:46:03.280140  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-11-18T01:46:03.281269  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6195b0757e84896=
6cc335901
        new failure (last pass: v5.16-rc1-213-g610c9ac03d76)
        2 lines

    2021-11-18T01:46:03.311376  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2021-11-18T01:46:03.313293  kern  :alert : Data ab<8>[   44.628736] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D2>
    2021-11-18T01:46:03.314436  ort info:
    2021-11-18T01:46:03.315515  kern  :alert<8>[   44.638260] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 1097766_1.5.2.4.1>
    2021-11-18T01:46:03.316639   :   ISV =3D 0, ISS =3D 0x00000005
    2021-11-18T01:46:03.317725  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-11-18T01:46:03.318788  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000009722000   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6195aca5c8d14d570f3358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-3=
28-g11d53a03cd9e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195aca5c8d14d570f335=
8fa
        new failure (last pass: v5.16-rc1-213-g610c9ac03d76) =

 =20
