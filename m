Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0363084FF
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 06:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhA2FXG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jan 2021 00:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhA2FXF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2021 00:23:05 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B10DC061573
        for <linux-next@vger.kernel.org>; Thu, 28 Jan 2021 21:22:25 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o63so5871754pgo.6
        for <linux-next@vger.kernel.org>; Thu, 28 Jan 2021 21:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Mr/Sv/UWOgNT19FBYkjXB5spPO4/6Nv/2hz2MeRdCBo=;
        b=hlFlpQmTGKHutDoCQrwlJDUnX9tDULVDPmSCi31nrZiHXLu42Z8qCsx9f6Yjn5C8A8
         p2+oqGXQ6twbZZ75LgjzCbkuE2mhAlGyIuXWixeB7NXbVImSDuKIR7//0Cih1Fcledbg
         4JRu68eGftZQMXTZmjLf6NUBNtGAPXgSzSaPSmDIRQtok2eRk4PJVRJUpbL2fVNM4Y5y
         JaMZ8pLt853MIZJ5h1ehAdapP+MUjbPiMHMg/3aB3x9Y+NiYJBGU0nhpyy0zZU82fvJr
         kbf+KySkeHwekA60drtyYRjDhxRBBiELNBA+xI1vHBEqLYMGZoHDH1WZVYCxVQN9eYJm
         bICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Mr/Sv/UWOgNT19FBYkjXB5spPO4/6Nv/2hz2MeRdCBo=;
        b=pR0HS4PVTOJ+PTdxjm7tI+6UjXASOMkyy4YgwyhvjOl+zPYkCzqY/gUK9jzVEIdlPu
         q37CZhaB9PPE7qvcAD+FpPmxSnjuYnO6TYncQueTkHrTytndcWsbYvBu3hwl2k09XgjV
         Qk/dh5QY5cKPuKwV5jFanlrQ8NVGqlqoSC2WDvYVqfQabmduRLOv6pS3LXmAYlC+gtfh
         QcP/yutIU4IVytNrZLAx+A8ZSLR53cE91bWafv2Rh87cT9F5V7kcECYqdeTx/+CxUQm+
         4eAhwcY/HkjNxevb0/LaHmxsOVAE4kRlfNAiF7SrZxxZ61Evq/tdaUDLmMrdBEh1Fkxl
         J8iA==
X-Gm-Message-State: AOAM530xMPPE5Olmqlc6vFHIu6mL1mOXr5ESu1UNNZbPaiv9KvhbtEdi
        hae3UVLKo+AEjeb/RiiaoD1Qs5Uzn7KX+g==
X-Google-Smtp-Source: ABdhPJyaYHOqnPpY3Z5y2DSZ4GElw42ZKdV0+OVTp9RNB3/aKjislbasmvcGSYEhszSLJMVXR86b4Q==
X-Received: by 2002:a63:454e:: with SMTP id u14mr2917327pgk.113.1611897744086;
        Thu, 28 Jan 2021 21:22:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mm4sm6183895pjb.1.2021.01.28.21.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 21:22:23 -0800 (PST)
Message-ID: <60139b8f.1c69fb81.360e.fadf@mx.google.com>
Date:   Thu, 28 Jan 2021 21:22:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-rc5-405-g1e76bd25cdcd
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 286 runs,
 7 regressions (v5.11-rc5-405-g1e76bd25cdcd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 286 runs, 7 regressions (v5.11-rc5-405-g1e76bd=
25cdcd)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit       | arm  | lab-pengutronix | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc5-405-g1e76bd25cdcd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc5-405-g1e76bd25cdcd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1e76bd25cdcd5b7ea12a20c4be07af2232a57276 =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/601366323fac6a6f51d3dfd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601366323fac6a6f51d3d=
fd7
        failing since 8 days (last pass: v5.11-rc4-275-g31be679b2913, first=
 fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit       | arm  | lab-pengutronix | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601364d175af17431dd3e042

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601364d175af17431dd3e=
043
        new failure (last pass: v5.11-rc5-322-gc9df5fe15328c) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601361ec6d10308f71d3dfd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601361ec6d10308f71d3d=
fd2
        failing since 73 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60136a4e989820fee2d3dff2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60136a4e989820fee2d3d=
ff3
        failing since 73 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601361ecdd071e7f49d3dfd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601361ecdd071e7f49d3d=
fd5
        failing since 73 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601361cf42ef1c46fad3dfec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601361cf42ef1c46fad3d=
fed
        failing since 73 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/601361c504e4ec2b2dd3e006

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-4=
05-g1e76bd25cdcd/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601361c504e4ec2b2dd3e=
007
        failing since 73 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
