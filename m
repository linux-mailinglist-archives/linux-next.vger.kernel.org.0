Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8732DCB0F
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 03:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgLQCjf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 21:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQCjf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 21:39:35 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BB1C061794
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 18:38:54 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j13so3226490pjz.3
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 18:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fgfphnJTyFbtVS/7mPZsZzFGpNfXQbK5+qNt+zcnNQs=;
        b=0katgsNpIDb8ShVPImNrySM3aFGPbfbBm/yFaP3zS+aYuJwzfjU2c+hAjVULt760Kz
         dRG1+1oSnRbUUt9AK0feWJGQ0vkI4I5u5i1E79ZdsKc6UU409XOxzIE7rFOtd9FpI75c
         aO55EJCDxpKl9kye1hfuergFtOR/5rforLwRS0yzJuPOCfihhiM4fb89MPpyyXk83eir
         QqF+ZM2cph5xcqNjf2GmnnriipksbWld/wa/uQA8TsAPtx3lvRajQufIuseFZuwN3pBq
         dnUzlXAi3ZtU6o2/CL1oVAOnSpKQAjwvGjb2196SQvOHWcxN8T1KTbsmbs0Dw4/F37DX
         /3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fgfphnJTyFbtVS/7mPZsZzFGpNfXQbK5+qNt+zcnNQs=;
        b=mj8txk06LsSxdI+f9AI9+1WoucCAIQZoXE/KaL6b4Crziev9/Ahm8c8qNtVNtl2KZo
         AGiveWKj+BZ5iX7SXOOoMCqNQpQd/z/cIhl8tEY+7OSnXO10Rl/H15KlZXgwtKWRyctR
         z22G3fXmqlRGqqkuNFnbu87OVOWgTBc8TOPgGkAo8eV1NYrJMAX8csD1eV9lv5g8RdU/
         I6fIZ38tHwGGCacinbFRTv8HmVoWSgGs8kgBGY5fv4vK7lBKCH+RDBH59NKq6OCtunvc
         7n2/VLoXWvvcyPZL/AlUN4Uz4Efv3b/MYSPGJnWoL/I2OToTEPFBhpnDg6BnpJx7c8iq
         GeVA==
X-Gm-Message-State: AOAM533Mmh8+kx1xA8oRsCDxBqxhf2Er2tMAk0Ku8Q1UXgdyDDikZIuz
        RXJ3SPYet0NfAqL+YRF6qvCS9llx5Cx1IQ==
X-Google-Smtp-Source: ABdhPJyj9KJhpjZ7rbVLQuOIWFuXwx8YL5cuknqt2FVmRQqTjOh2ry+sWmmGMzv4/KZAh58/GChPGQ==
X-Received: by 2002:a17:90a:a45:: with SMTP id o63mr5838283pjo.146.1608172733934;
        Wed, 16 Dec 2020 18:38:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g11sm3265150pjb.35.2020.12.16.18.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 18:38:53 -0800 (PST)
Message-ID: <5fdac4bd.1c69fb81.5155b.89f9@mx.google.com>
Date:   Wed, 16 Dec 2020 18:38:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-9016-g31c318f75dc4
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 201 runs,
 8 regressions (v5.10-9016-g31c318f75dc4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 201 runs, 8 regressions (v5.10-9016-g31c318f75=
dc4)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
hsdk                 | arc  | lab-baylibre    | gcc-8    | hsdk_defconfig  =
             | 1          =

imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | multi_v7_defconf=
ig           | 1          =

imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-9016-g31c318f75dc4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-9016-g31c318f75dc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      31c318f75dc40b05022f1eba1494878a408c100d =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
hsdk                 | arc  | lab-baylibre    | gcc-8    | hsdk_defconfig  =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda9122849c100669c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: hsdk_defconfig
  Compiler:    gcc-8 (arc-elf32-gcc (ARCompact/ARCv2 ISA elf32 toolchain 20=
19.03-rc1) 8.3.1 20190225)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arc/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda9122849c100669c94=
cc6
        new failure (last pass: v5.10-3862-g077e992aebce4) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda98aba941394fadc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda98aba941394fadc94=
cba
        failing since 3 days (last pass: v5.10-rc7-269-g52e72161fe54, first=
 fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda92e27e264a7351c94cd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda92e27e264a7351c94=
cd9
        failing since 3 days (last pass: v5.10-rc7-269-g52e72161fe54, first=
 fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
imx6sx-sdb           | arm  | lab-nxp         | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda9d10372858433dc94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-=
imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-=
imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda9d10372858433dc94=
cd3
        failing since 3 days (last pass: v5.10-rc7-269-g52e72161fe54, first=
 fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda8e046bd9cac87ac94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda8e046bd9cac87ac94=
cca
        failing since 30 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda8e096bd9cac87ac94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda8e096bd9cac87ac94=
ccf
        failing since 30 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda8ddd8f0a371b00c94cef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda8ddd8f0a371b00c94=
cf0
        failing since 30 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda8ddbaed620cea9c94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-9016-=
g31c318f75dc4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda8ddbaed620cea9c94=
cdc
        failing since 30 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
