Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E355644BACC
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 05:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhKJERb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 23:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhKJERa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 23:17:30 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA7CC061764
        for <linux-next@vger.kernel.org>; Tue,  9 Nov 2021 20:14:43 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so699945pjc.4
        for <linux-next@vger.kernel.org>; Tue, 09 Nov 2021 20:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OeYSClawlJjCWXWmhny/oXzpntKswdi3zXizpiqqq5Y=;
        b=zU8bMMTOBSVlkDjw4KzlSxG50GBLABVXj+UpUOIhPbawkTsv4U5piEDb1kb9RCech0
         H84rnadzlXJkiQskB7/JWtjEvOylnsJd2ZxHlRdb9OSwjadDgIO+HDOmPoqpCIZ81XOA
         vbx8KC4EZkcah+6MmbhcxvaCpTS9OvK6M+7Uw5ewy4/aNZp3sHF5QLlJcYWQC4TzPpys
         oSaS6I4SUFX00zYAP6jeMFAIhMp9bErWprDO1O31yHIJsDuc48zieSKPMvgOptzjPCJx
         2vAfAHQl0wbwgZtarsCbL3fBRSLNGaF9BGyqzDZ5gUk92/T8eDuKFDvtpXkIYyFgCVPl
         C2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OeYSClawlJjCWXWmhny/oXzpntKswdi3zXizpiqqq5Y=;
        b=a1WbaJwO1pjAu3oGWSJlxfmtazNGXqL/fDX62MBd6I7JrPPcJyyIrCOkJHJrvGLda4
         bXWAp8HA8UvpWb5C60WJcBd1TbdfuvfdwVtDVeDOovCrJifDoy9iCviwp5cvIh+K4d5j
         DO9e7RefUqcxq/Use369ohNyAngnQCghB9tVBnjyb6BhT3cmxhkK8roXvty72Yu3ez4E
         IRAY7/GTxUOE01tmUwn/+DKlVO3Hgy0lKWa/I0tTsvpUiugC8YpBNJWIyyoSzgnX/eqY
         CZmwnN2XgiMEgmLFK+WekgPLYxtMdQuEXNS5bUBwCfR2yZsZluIV8SdAHWrinSTGbDIU
         k1nA==
X-Gm-Message-State: AOAM531Q1yo9ueLZh++c3YxA2kyB0TjY+Qv8iL2Ri2oZS0lx3xwpMWMu
        DZhzlJ8yNIXTxPZ+Eh/y6p9i6zt6LX/zvbC7
X-Google-Smtp-Source: ABdhPJw2gTzmOmet7ojUy2S92pU4Ch23cuKQ+IcoNryJfpYw8mjKGFP3arFec6aAFahDj1tvyUNErA==
X-Received: by 2002:a17:90b:350b:: with SMTP id ls11mr13213037pjb.227.1636517682522;
        Tue, 09 Nov 2021 20:14:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z3sm20963130pfh.79.2021.11.09.20.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 20:14:42 -0800 (PST)
Message-ID: <618b4732.1c69fb81.72ab3.0b2f@mx.google.com>
Date:   Tue, 09 Nov 2021 20:14:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-12053-g6f9f2ed9499c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 668 runs,
 7 regressions (v5.15-12053-g6f9f2ed9499c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 668 runs, 7 regressions (v5.15-12053-g6f9f2ed9=
499c)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

fsl-ls1043a-rdb          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =

fsl-ls1043a-rdb          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-12053-g6f9f2ed9499c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-12053-g6f9f2ed9499c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6f9f2ed9499cee0dd377f4e8a175fae123529d81 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618b14a7959da6e6643358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b14a7959da6e664335=
8dd
        new failure (last pass: v5.15-rc7-176-gbfbd58926fc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
fsl-ls1043a-rdb          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/618b10ac6fde6ed2453358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b10ac6fde6ed245335=
8de
        new failure (last pass: v5.15-11821-ge562220410d1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
fsl-ls1043a-rdb          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/618b134afd6e19f33b3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-ls1043a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-ls1043a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b134afd6e19f33b335=
8dd
        new failure (last pass: v5.15-11821-ge562220410d1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/618b107f5734e80143335911

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b107f5734e80143335=
912
        new failure (last pass: v5.15-11821-ge562220410d1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/618b0c35baf982dad933591c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-mi=
nnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-mi=
nnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b0c35baf982dad9335=
91d
        new failure (last pass: v5.15-11821-ge562220410d1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/618b0d8beedc8204c13358e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b0d8beedc8204c1335=
8e8
        new failure (last pass: v5.15-11396-g61166c09fc60) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/618b0f04a62a12d0183358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12053=
-g6f9f2ed9499c/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/b=
aseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b0f04a62a12d018335=
8dd
        new failure (last pass: v5.15-11396-g61166c09fc60) =

 =20
