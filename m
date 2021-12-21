Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D0547B9E0
	for <lists+linux-next@lfdr.de>; Tue, 21 Dec 2021 07:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhLUGMV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Dec 2021 01:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhLUGMV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2021 01:12:21 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B5CC061574
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 22:12:20 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id n15-20020a17090a394f00b001b0f6d6468eso1507663pjf.3
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 22:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=svCU/i3qbS4vx4lD3dWeD5dWUtjRaBR7yrWAQYFpxNo=;
        b=te/JIJbUgamKcTwwMyBp68yFTFL16jcyWPqv9xM+KDh7/5bkt6CHlPvyFw3/mM/tqS
         B4vXeana+Gj+88E1GanRjMVHflyFEpiHXZnWeqtsq+aw9oSfzRW6nsuSP3rFgDO5iAHe
         oBpxElKxc63JqMJL/GAVHGgdDfxbPm0XKpisZWAGnOR/PKKn9UaoaJHku+UCdc5Nu9NM
         VmsTff4hxrDkqFzLwqvqf3fRh2nVUqexcJC8CDnR5CnKBxWjZpKQjMIun1uQnOPyXHDq
         tjXyFQ+Jk01AYt2W0ilDagxSOCaV8WJAhsFd/2pAcg8PVkTGKCMi8Uv4HMNqhD4XUyxf
         2h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=svCU/i3qbS4vx4lD3dWeD5dWUtjRaBR7yrWAQYFpxNo=;
        b=tiQ1rjJ/lGSzT5Kj9Eu3sqYU5pY26h2qEFc3gU5PpKogWTRNMJQiY5oOSJUTEnWgSn
         18jYhlGER18jey0fvkxvoAsNykkqE80y2T13fQFv8aWtCtsbsV8Y847CM4RlDqXhxshe
         s/SvvSU5klbMaYkkk5g8xhdLJ/DirzoqvmOYZccaLxH4ciVKsQEqY8YwrsmnTf3GsA1G
         uh3Q0xmjq0F1zRkVM85oeMK2lUsNaj8I8H+e3lHNzxoFxbSXGt2dw4eHs+GhSKFKZVfN
         AcLKp92pSb5H0TinGYeMBmNb25qpq658T6X3BWLj2ThU+7f0txmD/UTZ3kS4QIH4nSAf
         KyqQ==
X-Gm-Message-State: AOAM532K78sgu5pNNVcWntHHlgzi3UVz/0eo4OxndFlWblV5pUse3FlQ
        v1utNXD6jZEfJ8N4+aqY2wijhIBpq2OQ2eg9
X-Google-Smtp-Source: ABdhPJzDKZQ1woVtaXv8ZASDXRkaTDsRo6qHfSlpWPXfw9EW1qm+IJ+A8IB5UmyiY9B4fXfZtsFiLA==
X-Received: by 2002:a17:902:7682:b0:148:a2f7:9d7e with SMTP id m2-20020a170902768200b00148a2f79d7emr1569672pll.157.1640067139699;
        Mon, 20 Dec 2021 22:12:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u17sm21895780pfk.179.2021.12.20.22.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 22:12:19 -0800 (PST)
Message-ID: <61c17043.1c69fb81.eac38.d11c@mx.google.com>
Date:   Mon, 20 Dec 2021 22:12:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc6-155-g25b50ce58687
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 479 runs,
 6 regressions (v5.16-rc6-155-g25b50ce58687)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 479 runs, 6 regressions (v5.16-rc6-155-g25b50c=
e58687)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc6-155-g25b50ce58687/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc6-155-g25b50ce58687
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      25b50ce58687d9e59b1c6a5d1487d7352188633f =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c149a2a372a30afd39712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c149a2a372a30afd397=
12d
        failing since 41 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61c133fc3d8dec3c4e397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c133fc3d8dec3c4e397=
138
        failing since 1 day (last pass: v5.16-rc5-294-g65d84bcc1bef, first =
fail: v5.16-rc5-395-g46f3b5d984fa) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61c13578aae23e5a5939719a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c13578aae23e5a59397=
19b
        new failure (last pass: v5.16-rc5-395-g46f3b5d984fa) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61c137a950ad8a59183971f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora=
/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora=
/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c137a950ad8a5918397=
1f1
        new failure (last pass: v5.16-rc5-395-g46f3b5d984fa) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c139624ef50aa0dc39712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/basel=
ine-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/basel=
ine-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c139624ef50aa0dc397=
12f
        new failure (last pass: v5.16-rc5-395-g46f3b5d984fa) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c13b7ef8ee7fca9739712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
55-g25b50ce58687/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c13b7ef8ee7fca97397=
12f
        new failure (last pass: v5.16-rc5-395-g46f3b5d984fa) =

 =20
