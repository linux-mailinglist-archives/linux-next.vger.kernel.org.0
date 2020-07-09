Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC2521964C
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 04:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgGICdg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 22:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgGICdf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 22:33:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6318AC061A0B
        for <linux-next@vger.kernel.org>; Wed,  8 Jul 2020 19:33:34 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w17so191156ply.11
        for <linux-next@vger.kernel.org>; Wed, 08 Jul 2020 19:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gj8Jo7jnyiH6tzKZeDAw7TuU15sWY0ST8UGD2RgP+MQ=;
        b=OR5pwL+I3RetGnFQi7mZvTlQxuKuTGE0Xfj5jtR77mfd+HDnr9UW3ANDt5nDf2aYza
         yJG8OsVOBewfkrDJEJvtiuZLLVHBg8pttDyl5WpibZLgdVaS5suwKOn9iVsnfIQ4UQJ0
         YBgGOIUGBWnrC4HApdOFYFOV8wzovoaJh3l9rOqStI/JMI0JMFehYnIApQZkdzIhUry4
         Hs+BRbnCBV0D7pbmFCauVA6eLNVIpf1HGOmh6aKb95RYeYdUeXjw9tCC9LfJ7VIAVOj7
         kAGTadxM7njzQ48ZmVnEAcfStuj5XesRqzeK5P7LDKqVEnzXkdTJ99oMzLpcqnVKS7dK
         t7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gj8Jo7jnyiH6tzKZeDAw7TuU15sWY0ST8UGD2RgP+MQ=;
        b=E34SpB+IiOguRWKnswP5kLQUe+RWW5iMEnOss6ACia9+luU54A9mvUchcZUbEAMNBu
         cWyFyVTHGXMKgqa/CuN3t65EfpGx6zh8IWD9b8tjChVWYEJoBKUZvvll5CM0SMF8Fj6a
         YJU1tkdmJ49uogGVZ6mkJUazKMxnN49b5ZM61b0Rbz7oCTeTLgEU3Yyd2XOd7rspjngV
         NcaiOl+f1cn28T1i7te6l/tcXLUvfbvMACgPcjmPQ0lSPHkehudhZAdIFOSkDmCFfMms
         43lw+NUmUF68GPVyM6aCw8gIeIFer294jTwaXH+GOEicdgtxWn7DFR0W5FzF6J2KldiX
         MWUg==
X-Gm-Message-State: AOAM531+79yOSk6K0qlQUnh+15Cy5yKJdxL4JvddDtX6kmwxQvMaESQW
        Jwx0XyB+c+leLgS33Uw3qegLhC+zTBA=
X-Google-Smtp-Source: ABdhPJyseygO2YW+stmhD6tck5gicjR7PH3gmsOz5KljEL0nJ3SUcpHAy5taBxBU5Yyw2Pa69D2hbg==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr27039378plp.160.1594262013403;
        Wed, 08 Jul 2020 19:33:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r2sm936021pfh.106.2020.07.08.19.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 19:33:32 -0700 (PDT)
Message-ID: <5f0681fc.1c69fb81.20bd.3a35@mx.google.com>
Date:   Wed, 08 Jul 2020 19:33:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc4-328-g1432f824c2db
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 236 runs,
 7 regressions (v5.8-rc4-328-g1432f824c2db)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 236 runs, 7 regressions (v5.8-rc4-328-g1432f82=
4c2db)

Regressions Summary
-------------------

platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =

bcm2837-rpi-3-b       | arm64  | lab-baylibre  | gcc-8    | defconfig      =
              | 4/5    =

bcm2837-rpi-3-b       | arm64  | lab-baylibre  | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =

qemu_x86_64           | x86_64 | lab-baylibre  | gcc-8    | x86_64_defconfi=
g             | 0/1    =

vexpress-v2p-ca15-tc1 | arm    | lab-baylibre  | gcc-8    | vexpress_defcon=
fig           | 3/5    =

vexpress-v2p-ca15-tc1 | arm    | lab-cip       | gcc-8    | vexpress_defcon=
fig           | 3/5    =

vexpress-v2p-ca15-tc1 | arm    | lab-collabora | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc4-328-g1432f824c2db/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc4-328-g1432f824c2db
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1432f824c2db44ef35b26caa9f81dd05211a75fc =



Test Regressions
---------------- =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f064844e9f96d1b4e85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f064844e9f96d1b4e85b=
b20
      failing since 64 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b       | arm64  | lab-baylibre  | gcc-8    | defconfig      =
              | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f06495c72e5aacc3f85bb4a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f06495c72e5aacc=
3f85bb4d
      failing since 5 days (last pass: v5.8-rc3-311-g478674402fa5, first fa=
il: v5.8-rc3-345-g29dbc0a7c3d1)
      3 lines =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b       | arm64  | lab-baylibre  | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f064a1996f3b012d285bb2f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f064a1996f3b012=
d285bb32
      new failure (last pass: v5.8-rc3-473-g661b0ff064b6)
      2 lines =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
qemu_x86_64           | x86_64 | lab-baylibre  | gcc-8    | x86_64_defconfi=
g             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f064afcaeb0e60a5e85bb44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f064afcaeb0e60a5e85b=
b45
      new failure (last pass: v5.8-rc3-473-g661b0ff064b6) =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1 | arm    | lab-baylibre  | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f064829218bce76aa85bb22

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f064829218bce76=
aa85bb25
      failing since 9 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1 | arm    | lab-cip       | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f064835218bce76aa85bb38

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f064835218bce76=
aa85bb3b
      failing since 9 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1 | arm    | lab-collabora | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f064831218bce76aa85bb2d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-32=
8-g1432f824c2db/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f064831218bce76=
aa85bb30
      failing since 9 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
