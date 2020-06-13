Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3A91F82F9
	for <lists+linux-next@lfdr.de>; Sat, 13 Jun 2020 12:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgFMK3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 13 Jun 2020 06:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgFMK12 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 13 Jun 2020 06:27:28 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89893C03E96F
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 03:26:52 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t16so4763720plo.7
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vyd5i/XuuMCy7QVy4WnlVuRmVFBbAX7elO/X1YjLv0k=;
        b=hA3MZ+yvb6HiVdvVYR9pnQ32pFoZDb1YQpX9GxTm9LoezG9dRFwKK9yAi+1iyyvTqu
         kc9YFL6ap/MIQZnbSFGtnwN5gftSFtAsYyNVA64gA18U5J94rlNu3TSX2MLCB3dJBpce
         +tHeO+t5qrVrBMI+TE1g5yfyOrTyefhOwsNzux1imHwThy1KMmtAzJEPAdztXfree5bD
         D6MAx5Jng7ig7OAKtqSXY06CCsXreqqY9/1q8A6qChc7G0ICSx+sT6s173bCwwyIYGC5
         n9CZspebmCy5JzUi747aQabSWmXwmKPRCnOhv2Y9AkVXDM+Vh8/O7F4cmhIcFlq6iHzZ
         FKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vyd5i/XuuMCy7QVy4WnlVuRmVFBbAX7elO/X1YjLv0k=;
        b=fVT4Zp1gROdJUlVN6hz1YrAp9gvC1xLZAilZW5LOqQJ8C02yihNSbfQCGM44FrwkmR
         K7CJv1TcEPTvWMDmSt51S3d9u3y5GMuQbyixFcph+n97J6poornDZWoI10DaKVBSBzG7
         EM4rDZmdVZUEoPK7UHd2x3pmxLSx60/AoaSkp78pqwd7mVfAKA+vE7eeKG6vs/UQlD2y
         zGbHOM7ju5PJjJtA6ZoGgpnkbZHFzqMmqD4I+t00L/tXZb0W7BGZvvtvfqfRrUNq7LuQ
         qKoX6HUOFBNWmUfcol8hnB83K4GqQjPUs9B5uBFJJNG5HiKXr8FD1uVPKa+BNHWrKyYo
         v9MQ==
X-Gm-Message-State: AOAM5308mbkpqCOsU+Sj93vVvQxYtplFw0U/2DQ+6B6g8U4s2aJEzXTm
        0wwplwe+D3ickH6IH8/gh7NBFm5vG4I=
X-Google-Smtp-Source: ABdhPJy+eqgxRjPMUWAdOJB3AB/FKC0LsZVJxNqEEV+6uYHQoVvlUK8aWjYmt5Gq7P90bIw8JGjGXQ==
X-Received: by 2002:a17:902:b608:: with SMTP id b8mr14597829pls.163.1592044001446;
        Sat, 13 Jun 2020 03:26:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 71sm8942608pfb.20.2020.06.13.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 03:26:40 -0700 (PDT)
Message-ID: <5ee4a9e0.1c69fb81.d6dfb.f506@mx.google.com>
Date:   Sat, 13 Jun 2020 03:26:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200613
Subject: next/master baseline: 126 runs, 6 regressions (next-20200613)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 126 runs, 6 regressions (next-20200613)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200613/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200613
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      64302eabdac76d4d7fecdc898ffba2d4bc742273 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee46dcffb53dc35f797bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee46dcffb53dc35f797b=
f0a
      failing since 0 day (last pass: next-20200610, first fail: next-20200=
612) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee46c9079ff70c09097bf1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee46c9079ff70c09097b=
f1e
      failing since 45 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee46d9a472922543c97bf1f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee46d9a47292254=
3c97bf22
      failing since 3 days (last pass: next-20200608, first fail: next-2020=
0609)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee46e0f3f4b7bdb2797bf22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee46e0f3f4b7bdb2797b=
f23
      failing since 0 day (last pass: next-20200609, first fail: next-20200=
612) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee46c351b7e0f44f797bf32

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee46c351b7e0f4=
4f797bf37
      failing since 0 day (last pass: next-20200611, first fail: next-20200=
612)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee469ce089a14e11397bf21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200613/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200613/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee469ce089a14e1=
1397bf24
      failing since 7 days (last pass: next-20200604, first fail: next-2020=
0605)
      2 lines =20
