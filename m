Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7408A22570C
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 07:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgGTF3w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 01:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgGTF3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 01:29:52 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15743C0619D2
        for <linux-next@vger.kernel.org>; Sun, 19 Jul 2020 22:29:52 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x9so8155753plr.2
        for <linux-next@vger.kernel.org>; Sun, 19 Jul 2020 22:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hEecUP0IkSqB5Mjb/jeiKmYvphI6YeTBxh/RrPMjcJQ=;
        b=GIowcylQmffPqbihbk0Y7KhBbu0DLQ7fWgwMbZMyiXHuX/F5ckijJX6bOXBg23ra+u
         um3Z2MLl/J74B7mUTtNeALTrquwgn+E4Fr8/5S693ErO7HOibYInCPoe0xXYyDvnuk4J
         fEYuJ0GtdaSiEm+Ifbd0JafYeoS+57mMcGQ4GYgSOPB5aP1P41olgErO7xc5f27Wfnvq
         2T/Ifw+TVpbZ7v4wP155mgIgDPr6jdR0XXG/5S2fMhxWFSj0XhDQDHZZL1rdXlO463vS
         AMWerpcwc7XFXx8Uja5wmA2dVoQLA6GXxKHq9d+ToJ/spaA+1qVYyn0U61asYLzQ5LBD
         1//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hEecUP0IkSqB5Mjb/jeiKmYvphI6YeTBxh/RrPMjcJQ=;
        b=JDWYdi8eZwwsvTAJlzR+F5jq17zhHtzTXHiaCN7A693DacXkk+btJyOenmqAWGY3Hr
         fOlPgptzXLUzDaMwG/DdTd0BRTDi6rRURkrak6NO7OhwD5Z+U6yhiGeO/ZD6nnAxX09O
         Qi5JP3SFbYMmiGZ/mdpjYDXyIquQIeMyOqwTp3AOLygEO7Wk1z7KrsI1n+ZdZPlKjps8
         mcak73zDaBC3LuIFBHm1z7Pzi+9fvZsOsWEbm+mos+ZtIx3HaoGI321o2Ut7tKqNb+ar
         cN54Hal78sayCrpSt/DESzgqCHHFzrLn8+4as5NJxO+4f6UUOfsgqkQhmb+YyuMlS2NW
         +/Lg==
X-Gm-Message-State: AOAM530TS5uGynkFktsB4BvxqcjvVkoRDc/c6nD+1ByFvwf0iBC3XoN8
        iSJRxAhQSDIEprYxZ1pqIkDW+9/hDCY=
X-Google-Smtp-Source: ABdhPJwdVwd5FXtS1e3vIUPoVyPxLwQ77CZDfJifQyhcSJzf6zGq9a/bV4DW60rVBORGjO6n+Xx43Q==
X-Received: by 2002:a17:90a:d42:: with SMTP id 2mr13263279pju.15.1595222991246;
        Sun, 19 Jul 2020 22:29:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q7sm15816957pfn.23.2020.07.19.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 22:29:50 -0700 (PDT)
Message-ID: <5f152bce.1c69fb81.deb4d.3d3f@mx.google.com>
Date:   Sun, 19 Jul 2020 22:29:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-432-g6ded1a48da25
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 169 runs,
 5 regressions (v5.8-rc5-432-g6ded1a48da25)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 169 runs, 5 regressions (v5.8-rc5-432-g6ded1a4=
8da25)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig  =
            | 0/1    =

bcm2837-rpi-3-b       | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig=
            | 0/1    =

meson-gxl-s905d-p230  | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 0/1    =

vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g           | 3/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-cip      | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc5-432-g6ded1a48da25/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc5-432-g6ded1a48da25
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6ded1a48da25bae109eb40f0849429ff49e7899f =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f14f284e8d0b73dab85bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f14f284e8d0b73dab85b=
b31
      failing since 75 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig=
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f14f7738f6a7f4ba785bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f14f7738f6a7f4ba785b=
b20
      new failure (last pass: v5.8-rc5-311-g3c7f84b22484) =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
meson-gxl-s905d-p230  | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f14f6c20468cda85385bb2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f14f6c20468cda85385b=
b2b
      new failure (last pass: v5.8-rc5-311-g3c7f84b22484) =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f14f4adcb5d86fb4f85bb25

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f14f4adcb5d86fb=
4f85bb28
      failing since 21 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-cip      | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f14f4a5a3461601c585bb21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-43=
2-g6ded1a48da25/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f14f4a5a3461601=
c585bb24
      failing since 21 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
