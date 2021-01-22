Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF762FFBBB
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 05:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbhAVE0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 23:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAVE0j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 23:26:39 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E19C0613D6
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 20:25:57 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id r4so2493122pls.11
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 20:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=T86SZQIsGGT+uoUxx75XDZZdC0aoOv29jpArdGUUeUk=;
        b=HVIxK1n3NL7KYJAxN34rzttxS1NJaUVD3TjAndHV+G8tMuhJM/i2y00vyZREQq458D
         IsIqt73QIpV7O/F4FVzbc2109aWo8FBqurW5CofRk2zV+nZyyl4WxQ0K3vgjJjLjlBV9
         1VEuY3Fxv8CQIKMQixfQuXZaYeHeADyA8+tJcX/cVm5lzn14tL3uCd/QbYaKLy2dKYMt
         fReA5EQYlG7aBJTbR7bNrVzG7X/EygEYgLVSsaVgCaOTXXC06VkOvnHZ2XQ7ywH7Yym0
         jxbxLZt236fj0n31aYoaFzx3C39c1e9qy69zaWdzKaQ4MPpOLPQdn750mO8C1urpdHHT
         UAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=T86SZQIsGGT+uoUxx75XDZZdC0aoOv29jpArdGUUeUk=;
        b=qXx4UEmbNawQqe8dkmiTeOz+oPchk9QYWDR4wbiG9niwB1BbCIH3oa9Ygu6rZnzeOQ
         nrC92ZOMW5shiEaO7FKM9L1grdYwX0RZCK1REDIaAuHifVYAFlbemrYvk7MSTzn3V+XA
         Ei8mGvG4ThEwlg3dfUR3b8xrkT2EQ/9t6nlg8WbhpRrWZFQQwVK+2zMivPIiWlUWPpCc
         TAUkfjp6ph86Wcn79GhaTxQ6dQ0TaNruo++UCJL7tPAc0UtE6L1edXIOvziFsC3EHoM2
         9sogMrjk7BhFnw4vhr3+ykjnEw16wjK8nvqrnMZOWgrR8PXsmUpL57//us91L4dkotc9
         cROg==
X-Gm-Message-State: AOAM533wB4iyTqcHXdvAl6EKSpjXtx9nGJMxuHsnpfbvJi9BZ6zpLXFy
        6v37yEbWMXNVcH//UdVn8PGKqwKAOoI24p9A
X-Google-Smtp-Source: ABdhPJz6b2+uw2jhJjxhnqmBbtfLGGIFiqkCjnKAaq9nDEmEbT9hl8iUYTgsAco3BJWwtZND5aN+MQ==
X-Received: by 2002:a17:90a:4a4:: with SMTP id g33mr3011970pjg.221.1611289557101;
        Thu, 21 Jan 2021 20:25:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3sm7037314pfg.120.2021.01.21.20.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 20:25:56 -0800 (PST)
Message-ID: <600a53d4.1c69fb81.a530e.1cd1@mx.google.com>
Date:   Thu, 21 Jan 2021 20:25:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc4-379-gdd9d91177430
Subject: next/pending-fixes baseline: 325 runs,
 6 regressions (v5.11-rc4-379-gdd9d91177430)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 325 runs, 6 regressions (v5.11-rc4-379-gdd9d91=
177430)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm  | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc4-379-gdd9d91177430/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc4-379-gdd9d91177430
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dd9d91177430a8212c067d7c23556d7b0a359d03 =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm  | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600a20e4c71f66aca6bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a20e4c71f66aca6bb5=
d0c
        failing since 88 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600a24a4d5a7fb9a63bb5d1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a24a4d5a7fb9a63bb5=
d20
        failing since 1 day (last pass: v5.11-rc4-275-g31be679b2913, first =
fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600a1e081fd2f246babb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a1e081fd2f246babb5=
d0c
        failing since 66 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600a1e3301f977274bbb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a1e3301f977274bbb5=
d0c
        failing since 66 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600a1ded1590b28ddfbb5d1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a1ded1590b28ddfbb5=
d1e
        failing since 66 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm  | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600a2867fa4e095b85bb5d19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
79-gdd9d91177430/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600a2867fa4e095b85bb5=
d1a
        failing since 66 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
