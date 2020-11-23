Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E075E2BFE12
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 02:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgKWBtu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 20:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgKWBtu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Nov 2020 20:49:50 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5A9C0613CF
        for <linux-next@vger.kernel.org>; Sun, 22 Nov 2020 17:49:48 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id j19so12775457pgg.5
        for <linux-next@vger.kernel.org>; Sun, 22 Nov 2020 17:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l2izopWwb0AKI7Mj7y3dMC7n2uKY42m2q4TKqtMQHN8=;
        b=Lh9le4ORjxLwngTm5ew8SBPYaNlz7gHDF6S2DXvWllnz4B3uwKNE+X32t+T1yc1Vbe
         zDm3EsVuBvmdGI8acjc0cV23nHuO9RJxtQUAbi3iFlUYOADjJjQHKx5DhCTHVS7hO0VB
         wkxBrCEc+mftPjRXky7b8WXIOIn+rEwNUvZqfaJ//cCnpztrxrzVUfp/HhiHBjUkK65H
         D0TCcQLML1SLa72clti7x5r3U/lx1PlJHagJb/a5giVS4V1F+dDDrjB5dVJK7F3fpQJU
         JyAFsruvo+1z/OKkjTlYNiPhPtvLXTS6w3dd1T6cUSyvMy0stSe69cmXU+N19KmvWsNa
         l8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l2izopWwb0AKI7Mj7y3dMC7n2uKY42m2q4TKqtMQHN8=;
        b=TdXdSlhi7v7VRAm8kl6ysXi3Y/FWanc3yxRr7l4jkuW++w9E125S3eAwvJtqZoHpkC
         DskMBDSCMh6KeFIUBtUxyv6JTEMbGcBxrWF0noaIL0c61ai/ZPDopMUL4LM44jymAeBk
         dguOMi0IW3GCU9ucryPpAhPrOA23BxZT1cY194sCvrPuNc/Z4AguOGfIgILkaEB9t7pA
         SfZNcCT0hOYJa2p9tbUUBliUqOovSExkEcJLLabQ3lS6Ogx9yvajkPGsc8f3x0psqe2W
         tDhLyYOQ7C/DlSgjfDHW9Zvi/JLKo7awqOexWWszabVS2Y5amEJwUbdkBAQufgjeepzg
         DQVg==
X-Gm-Message-State: AOAM5306qSeuifNaqNoAZuzmZtVN1r2s3Su/BVddHoBvU5/XaDqGwlIU
        +r6OLFE7wC3IfU1P2lut0SUue1+QEJCbtQ==
X-Google-Smtp-Source: ABdhPJz1XzDKUGeDuMKGL7HofNEGTurHbZKL+KcjPpqmzdSVHHQoTYYFlnqyVPI6grv9rQqqTlzV+Q==
X-Received: by 2002:a62:2cc1:0:b029:18c:85f5:864b with SMTP id s184-20020a622cc10000b029018c85f5864bmr22725305pfs.29.1606096187705;
        Sun, 22 Nov 2020 17:49:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z17sm11568721pjn.46.2020.11.22.17.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 17:49:46 -0800 (PST)
Message-ID: <5fbb153a.1c69fb81.234ca.98db@mx.google.com>
Date:   Sun, 22 Nov 2020 17:49:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4-615-gd0b6b0cb24dad
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 357 runs,
 12 regressions (v5.10-rc4-615-gd0b6b0cb24dad)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 357 runs, 12 regressions (v5.10-rc4-615-gd0b6b=
0cb24dad)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained    | arm    | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =

imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+kvm_guest   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc4-615-gd0b6b0cb24dad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc4-615-gd0b6b0cb24dad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d0b6b0cb24dad48842c47a013064e2f9af32bb16 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained    | arm    | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbade98fb484dbd5dd8d900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbade98fb484dbd5dd8d=
901
        failing since 201 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbae223f747e9e498d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbae223f747e9e498d8d=
8fe
        failing since 27 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fbadfdb2395df7b80d8d91d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fbadfdb2395df7=
b80d8d921
        new failure (last pass: v5.10-rc4-520-g40cb4fecf2509)
        4 lines

    2020-11-22 22:01:27.322000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000004
    2020-11-22 22:01:27.323000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-11-22 22:01:27.323000+00:00  kern  :alert : [00000004] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fbadfdb2395df7=
b80d8d922
        new failure (last pass: v5.10-rc4-520-g40cb4fecf2509)
        49 lines

    2020-11-22 22:01:27.365000+00:00  kern  :emerg : Process kworker/1:1 (p=
id: 52, stack limit =3D 0x(ptrval))
    2020-11-22 22:01:27.366000+00:00  kern  :emerg : Stack: (0xc2455d50 to =
0xc2456000)
    2020-11-22 22:01:27.366000+00:00  kern  :emerg : 5d40:                 =
                    c3b40bd0 c09b0ef0 c3b40860 c09b56a4
    2020-11-22 22:01:27.366000+00:00  kern  :emerg : 5d60: c39161b0 c39161b=
4 c3916000 c09bb24c c2454000 ef83eaa0 c09bc644 8020001a
    2020-11-22 22:01:27.367000+00:00  kern  :emerg : 5d80: c19c7640 0000000=
c c19c765c c2001d80 c2357a00 ef83eae0 c09c89d4 c1448e4c
    2020-11-22 22:01:27.408000+00:00  kern  :emerg : 5da0: c19c7640 4acb695=
f c19c765c c2355700 c233a280 c3916000 c3916014 c1448e4c
    2020-11-22 22:01:27.408000+00:00  kern  :emerg : 5dc0: c19c7640 0000000=
c c19c765c c09c89a4 c1446b74 00000000 c391600c c3916000
    2020-11-22 22:01:27.409000+00:00  kern  :emerg : 5de0: fffffdfb c22e0c1=
0 c3b90ec0 c099e8e4 c3916000 bf026000 fffffdfb bf022138
    2020-11-22 22:01:27.409000+00:00  kern  :emerg : 5e00: c25bb4c0 c3a6610=
8 00000120 c328c740 c3b90ec0 c09f8240 c25bb4c0 c25bb4c0
    2020-11-22 22:01:27.409000+00:00  kern  :emerg : 5e20: 00000040 c25bb4c=
0 c3b90ec0 00000000 c19c7654 bf058084 bf059014 0000001a =

    ... (38 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbaddb7c07b377f04d8d91b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbaddb7c07b377f04d8d=
91c
        failing since 2 days (last pass: v5.10-rc4-415-g1a6722b3cb3e, first=
 fail: v5.10-rc4-520-g40cb4fecf2509) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadf519a4695621ad8d928

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadf519a4695621ad8d=
929
        failing since 9 days (last pass: v5.10-rc3-337-ge83d2e1f2d190, firs=
t fail: v5.10-rc3-420-g5364e201065c) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbaddd144ca4568acd8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbaddd144ca4568acd8d=
8fe
        failing since 6 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadddc23ea806c14d8d96a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadddc23ea806c14d8d=
96b
        failing since 6 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadddb9fe6e41456d8d906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadddb9fe6e41456d8d=
907
        failing since 6 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadd7f90e453d15bd8d91f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadd7f90e453d15bd8d=
920
        failing since 6 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadd82344c43e137d8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadd82344c43e137d8d=
910
        failing since 6 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-8    | x86_64_def=
config+kvm_guest   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbadf780f24cd790fd8d912

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-cip/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-6=
15-gd0b6b0cb24dad/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-cip/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbadf780f24cd790fd8d=
913
        new failure (last pass: v5.10-rc4-520-g40cb4fecf2509) =

 =20
