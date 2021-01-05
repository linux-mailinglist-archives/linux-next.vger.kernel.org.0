Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E352EAC15
	for <lists+linux-next@lfdr.de>; Tue,  5 Jan 2021 14:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbhAENm7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jan 2021 08:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbhAENm7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2021 08:42:59 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AD6C061793
        for <linux-next@vger.kernel.org>; Tue,  5 Jan 2021 05:42:19 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 4so16384912plk.5
        for <linux-next@vger.kernel.org>; Tue, 05 Jan 2021 05:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xez9OLCDlJXyLtMs46ucxp86tbXnCs6KxDzMrmBxFT4=;
        b=Nmx2WFif8pPUDKnMkeMueJ0rsQNwlJPZorb3Mt0LLRON3O187Ti5+eCUdfiBD3byZX
         cxfzWioV6MtFG3e+7M74xBTkQmxWyGTFb+b2THznxWp03qmLocI6fjeTVsDVSxnXRcio
         XtnNVydeAdYpJcNDcVHnMiBXgp3ppLxbaMBPKDAIcyZXoNQiDFF/UVOV6rGqvOhC//Vw
         z3ecaQxJ8ycn5qpWJ30k9a9/EWDEL1w0DTf/tQpQtSTZ+ie+1yBTeRYURWvz/L+3aONV
         LnhF5lGTxBMAmSD7+LczqffDwkUSDa3cY/BkdJvz1e6++HLSUBVBfN7ZDXWZNXVQSEl0
         IbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xez9OLCDlJXyLtMs46ucxp86tbXnCs6KxDzMrmBxFT4=;
        b=KL9j2YPhPQ5JetThX2ddClAMHBnCghvXoLS+sxC9Lc5m8X/hS+LpmfTJ7NtydbSumZ
         I8KQrMjxiUpmAaT/+CgTFPC5OOjOsKHoN7ejdYcsfyN6d3Zg32AXTN4sFh2No74yrEZ4
         RRGj4U5FHKvcZ4OeNG8YrAPNed6aaFayGi+5bApGk90GVnwnDZf3TulxSksIYKCM38XH
         VU1ooX8vmKdezfqwb3c0h1JumShOgmiD4FudlDW/jmaZ5dc1pDn32ETgABWlAtzJFfgX
         7hZrPh8EebbdWU8yIgAwf3ioByl1lJqhnMtPYC4kJ9t6QzBBKb7ANPZ8yE9HpQFArhjG
         D+jg==
X-Gm-Message-State: AOAM530OYAbhQZzrIf1AoMIxAm2HVgUVsZFTsOHOPhan4h6qcZPLukcr
        iz+Mj8/e5kW+S76qIJ38BwqsyOMZ8aJ/qQ==
X-Google-Smtp-Source: ABdhPJyKY+FtiwylXkTPw6J586JAhRjam+Mr/5gN1mpxZKQWtE+8dGKtFjh+MRUFDiGmL3AIJVrliQ==
X-Received: by 2002:a17:902:9681:b029:db:fd65:d10e with SMTP id n1-20020a1709029681b02900dbfd65d10emr77872019plp.6.1609854138615;
        Tue, 05 Jan 2021 05:42:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k25sm58847602pfi.10.2021.01.05.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:42:17 -0800 (PST)
Message-ID: <5ff46cb9.1c69fb81.599f2.4ec9@mx.google.com>
Date:   Tue, 05 Jan 2021 05:42:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.11-rc2-349-gbe2b364c5113e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 221 runs,
 7 regressions (v5.11-rc2-349-gbe2b364c5113e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 221 runs, 7 regressions (v5.11-rc2-349-gbe2b36=
4c5113e)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
hsdk                     | arc  | lab-baylibre  | gcc-8    | hsdk_defconfig=
               | 1          =

imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc2-349-gbe2b364c5113e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc2-349-gbe2b364c5113e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      be2b364c5113ec49dde16b45014f5f80a22f4d57 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
hsdk                     | arc  | lab-baylibre  | gcc-8    | hsdk_defconfig=
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff4388d5828d2b6fbc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: hsdk_defconfig
  Compiler:    gcc-8 (arc-elf32-gcc (ARCompact/ARCv2 ISA elf32 toolchain 20=
19.03-rc1) 8.3.1 20190225)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arc/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff4388d5828d2b6fbc94=
cba
        failing since 19 days (last pass: v5.10-3862-g077e992aebce4, first =
fail: v5.10-9016-g31c318f75dc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff437bbd8b225e51fc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff437bbd8b225e51fc94=
cd0
        failing since 71 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff439c3e037f88044c94cf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff439c3e037f88044c94=
cf6
        failing since 18 days (last pass: v5.10-9016-g31c318f75dc4, first f=
ail: v5.10-11328-gc41c506b38eb) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff4382549cc304510c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff4382549cc304510c94=
ccf
        failing since 50 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff437dee090be4dcec94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff437dee090be4dcec94=
cc4
        failing since 50 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff439381c40d7dd81c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff439381c40d7dd81c94=
cba
        failing since 50 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff44152bd27e34a30c94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-3=
49-gbe2b364c5113e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff44152bd27e34a30c94=
cd4
        failing since 50 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
