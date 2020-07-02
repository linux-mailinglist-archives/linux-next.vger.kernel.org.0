Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A00211C1D
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 08:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgGBGqR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 02:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgGBGqR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 02:46:17 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3215DC08C5C1
        for <linux-next@vger.kernel.org>; Wed,  1 Jul 2020 23:46:17 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id x11so10913078plo.7
        for <linux-next@vger.kernel.org>; Wed, 01 Jul 2020 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yHTgB/TSpWLp4Ej2R34z+L/qDpFH6bGuUw3jFANaY9g=;
        b=MOiDNtNJtnpaJMxDRejTr5+Oni2dEI54/WnJ/OFVUcUFxKQTWsD7PYGoMDM47dvLKQ
         qOS3BXXLL+Oy+Gq0CMOV9c2jH6jmCASN6Btnjjs/Z1xgff/FOP/EBATIYmgMX+NmO3T2
         wu/JnwE7eTPC7/ZLqywrmem1FG/LIJhDtTgJ5RUD5JIc4VJd0VenX8cQmacjTgv0yto7
         Aq1pCE0xxi/P6cbjU5t1Iw7QomngSbg9IFMhWpLhz+L7/Z5yj4ydSZjlf5ADEtYIbZOA
         0Cm6vizP4CuiHMwKKEavb+ceb0v+YZz53VGL84X2VqnIFqdb9bj8G0acjwSzL5Fq5Qag
         FWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yHTgB/TSpWLp4Ej2R34z+L/qDpFH6bGuUw3jFANaY9g=;
        b=A2q9WfXnT/jOomD3n6Y5wVlFwtflcNJZ97LmOfSddDRV+FsqjamV0iBhIzxnnsx4mg
         Yxr9jFjplSKANLyGqD8CnILgXz34tha3rLXKPd5xEM1VNys1E3M9VsjP8N62MoSYbn11
         vV8SsJxQF3wqGX+nkN8Cw2mkPfNDAYndMQgcWrGt3uikoTtkR+DlB4OwYH78QqHX5L4x
         hdcPn4X/3Otxf/OA9JTSwHzd5dqeIHZ0U6BWHLi9zTThriMfwjgcUUY4XYJWXjVw2kuK
         Dnl2DwvduB6R1HIIDvQ5OLxc3ILNQlRN9GHq84Myi5lJrp4xwbT1wzye0cOgzxrOGd55
         /GNQ==
X-Gm-Message-State: AOAM531LS0jhFX1YkTv4Ui09f6nZrileEgszg0Pbuhb9G17Mnym+NYwp
        aWU7gsDts01+wM4U019j0+Gq70B04JU=
X-Google-Smtp-Source: ABdhPJzkMTBRt8SUH/WgOfTXEaNKpY4iD/xnDwWSTle7BQpFGc6q0FCtyLNvX49cPQWaTxkFtuvAAg==
X-Received: by 2002:a17:902:8a96:: with SMTP id p22mr26411774plo.281.1593672376223;
        Wed, 01 Jul 2020 23:46:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9sm8258990pfu.45.2020.07.01.23.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 23:46:15 -0700 (PDT)
Message-ID: <5efd82b7.1c69fb81.fdcc3.6303@mx.google.com>
Date:   Wed, 01 Jul 2020 23:46:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-311-g478674402fa5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 193 runs,
 5 regressions (v5.8-rc3-311-g478674402fa5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 193 runs, 5 regressions (v5.8-rc3-311-g4786744=
02fa5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-311-g478674402fa5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-311-g478674402fa5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      478674402fa50a4a8bff35390c90a7b7461a05a5 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efd4c78baf3f8b71e85bb3b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efd4c78baf3f8b=
71e85bb40
      new failure (last pass: v5.8-rc3-259-ga26ea8c1e000)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efd4e8aaa8f95ee2085bb25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efd4e8aaa8f95ee2085b=
b26
      new failure (last pass: v5.8-rc3-164-g155c91ddae03) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efd4700d46dc4027285bb1d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efd4700d46dc402=
7285bb20
      failing since 3 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efd472123f5726e7085bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efd472123f5726e=
7085bb1b
      failing since 3 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efd47450da0539e2785bb5e

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-31=
1-g478674402fa5/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efd47450da0539e=
2785bb61
      failing since 3 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
