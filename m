Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A7E474E91
	for <lists+linux-next@lfdr.de>; Wed, 15 Dec 2021 00:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhLNXaA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 18:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhLNX37 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 18:29:59 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C67C061574
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 15:29:59 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so17433184pjq.4
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7XJ9ebWWZKJ1ppHPJcoHOI4D7eL9fMkOJ7wEBXiVIUc=;
        b=XnmfI7L6PJCzIhH3+V56Rwi1DjBY0R+653pgU9+2aK+oBPp75dRGGdas6OcKWat89d
         83bEebMfUT5ZFlSV9H8yeRM2ibl/FXNQdsGfCrtYWc1SPsqYaJNLVal3WL6ftSrTBI49
         WmIFk5HdeJxEq1lC0YshEiPfGL9/2Vd5raaBne4h9WHfqccVIdMbMArup6HTk6MrI6D7
         KtW+crBqpCuBdNCLBwrr7TJ5/rdF4Klx06pQg+LqD+WhRkNfE3rhOeVGIPKJuW5GUybI
         xUjA6IlaHD4dFaTpUv7j7uCUgH/2NqyXQMFZip6+36Uv/+R4qSZhJAV4CqBFcT2m8NJh
         Ps1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7XJ9ebWWZKJ1ppHPJcoHOI4D7eL9fMkOJ7wEBXiVIUc=;
        b=ix5krYiRDw2xeZwpfeeGU6MokKErmw3OhFGvja5jRtbOOmvwqbMp+6huyvH/lOYkG4
         SmwkpVw0und7Gho8y3sP4J1GIaGXCo5yaCBedx873lH6v6QcOFA3LCZkIy1QeysWr5dM
         LvbHyphvWkQ2Hl5s4dOCc2ZgnFcvJUmb5y3aQL3JF8S7yNIIA96QPSwyxfzGaxmkQPb+
         KttMZ+n75faJEtGibQxBdN3KZ8zHbg8u6jM8ZMmIKprcA0N5uOAXZEWcmOSQSZGFYdH+
         aS0tun/wlRI7O48UHVbgerFO/n1hCVh6Z0Uke1kB7Kxw/8gHYsdJ5MDL0fdD2tLKTbnS
         VNug==
X-Gm-Message-State: AOAM5324Pim8Men15gzoECeHK2AfcdN18uL9FN58rdt4+oCR1AjR6U0n
        +RdPHnBLRmcze4tsFpn3Eg6po3sE3AexaaYU
X-Google-Smtp-Source: ABdhPJyi90HUvp3qmX+kOntnhO5iJ871NIA0F8p7H6prY2a3JfYeJDxc5WRsCF2j9ZQUFrnDtZfQCw==
X-Received: by 2002:a17:902:988e:b0:148:a2e8:2c4d with SMTP id s14-20020a170902988e00b00148a2e82c4dmr1791512plp.156.1639524598774;
        Tue, 14 Dec 2021 15:29:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d12sm174692pfu.91.2021.12.14.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 15:29:58 -0800 (PST)
Message-ID: <61b928f6.1c69fb81.d4e8c.0da0@mx.google.com>
Date:   Tue, 14 Dec 2021 15:29:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-177-g6cfce3d8f89a
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 583 runs,
 4 regressions (v5.16-rc5-177-g6cfce3d8f89a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 583 runs, 4 regressions (v5.16-rc5-177-g6cfce3=
d8f89a)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-177-g6cfce3d8f89a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-177-g6cfce3d8f89a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6cfce3d8f89a800eb02aa757640e1fc958cabc76 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8f33fd46d1bb15439711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8f33fd46d1bb154397=
11f
        failing since 34 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8eeff55140c71cc397165

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8eeff55140c71cc397=
166
        failing since 3 days (last pass: v5.16-rc4-241-g3e464b455df7, first=
 fail: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8f1a744b69b706e397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8f1a744b69b706e397=
129
        failing since 0 day (last pass: v5.16-rc4-356-ga119cd39dcbf, first =
fail: v5.16-rc5-103-g80aa1498c144) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8f9b123c8274a48397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
77-g6cfce3d8f89a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8f9b123c8274a48397=
121
        new failure (last pass: v5.16-rc5-103-g80aa1498c144) =

 =20
