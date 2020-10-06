Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96730285071
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 19:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgJFRFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 13:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgJFRFW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 13:05:22 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF1EC061755
        for <linux-next@vger.kernel.org>; Tue,  6 Oct 2020 10:05:21 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b26so6055571pff.3
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2020 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=u5JsgIjmwx61p/r1H6WWEkJTHDE8QBy6UQE/puxKwWE=;
        b=1JHeguAGorM1d0lmoFQFGtHEmyVXRMcE+FE4pS2phY2k88NcjR/dSo41C7a6Cxr11i
         79WGpZmlukVMEczOvk/U922EBfLn+6lu+yusc/cHgPP4O6GlG+njVxTL0O78RSXjY74t
         uxd0LLBCO93RDzCzxvuAHHRFi5OpEdDRPY5WVxpc/CfqBsz5SQxgQvqS6vhJvsOkP/4+
         DmZQeCIUT4NSDULggLFMj1INJ3Sd6ChGjHDq2aO8aHxQDQu62AOrzv63mco0xOWVbVNn
         ayuitFDnwvhxfqRxhxUUyfn9WPahedRo+WZjH4xC3SOJa4I73UcytnbuyaHCpGfO/Zt5
         pfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=u5JsgIjmwx61p/r1H6WWEkJTHDE8QBy6UQE/puxKwWE=;
        b=YPKId0foQ/YwtGaC8P5lOd/DHcOPB/UYLcQ2DkIjxhWEX5SMrvtWRapv/ghyBcLL5t
         VHVDqW0zUWzEmuuXkQ7KTrvpyUxHDPjo6gzkUwK+WwgfbJKxvkNEqsfjA3b+fSfCm7cS
         UqxKrYjnlegWRQlw7yo2gZP2iX+Gfb/EKc9n+tm+Yq9ahJL2B23qbQFewHp/PJtjh1Cd
         Mq4PeJHjk2AqBkMxkGBUtcY0jr9zyfS70i+puaxNlT0znw/5gAMvD1KA8YJSch/q5nYV
         eEsQjc2VXQ5G2asXol5vBeXIfCjqgcNyfgerADvsZMZfAtbvFb3rtOXfzSzwUqJMSSu0
         x4JQ==
X-Gm-Message-State: AOAM530nFVM6Z11QQtdsLipGGF555X9abc0Ug/o1Va4236kJCqTJLvpK
        UF54YFw28xw2UFv+0oslfICx5IZGgG8czA==
X-Google-Smtp-Source: ABdhPJwidgGno+nhufkgKCtUa9d6kfj1tKFULty+Jo/YjfH6Af2kph2ari+Nj3zmUTbhdpLhNOC8Tw==
X-Received: by 2002:aa7:8ad8:0:b029:150:7d36:cddf with SMTP id b24-20020aa78ad80000b02901507d36cddfmr5301800pfd.55.1602003920196;
        Tue, 06 Oct 2020 10:05:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o20sm3880702pgh.63.2020.10.06.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 10:05:19 -0700 (PDT)
Message-ID: <5f7ca3cf.1c69fb81.1723a.7e90@mx.google.com>
Date:   Tue, 06 Oct 2020 10:05:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201006
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 371 runs, 7 regressions (next-20201006)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 371 runs, 7 regressions (next-20201006)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 2/4    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201006/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201006
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a804ab086e9de200e2e70600996db7fc14c91959 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7c6913a27d8a24e74ff40a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7c6913a27d8a24e74ff=
40b
      failing since 161 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7c6a4a0b7fc77a314ff3ec

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7c6a4a0b7fc77a=
314ff3f0
      failing since 3 days (last pass: next-20201001, first fail: next-2020=
1002)
      4 lines  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7c6ce20b6682b7724ff44b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7c6ce20b6682b7=
724ff44f
      new failure (last pass: next-20201002)
      2 lines

    2020-10-06 13:08:42.520000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-06 13:08:42.520000  (user:khilman) is already connected
    2020-10-06 13:08:58.304000  =00
    2020-10-06 13:08:58.305000  =

    2020-10-06 13:08:58.305000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-06 13:08:58.305000  =

    2020-10-06 13:08:58.305000  DRAM:  948 MiB
    2020-10-06 13:08:58.321000  RPI 3 Model B (0xa02082)
    2020-10-06 13:08:58.408000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-06 13:08:58.439000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (384 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7c674b6e2cb777a94ff405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7c674b6e2cb777a94ff=
406
      failing since 26 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f7c6ca6cc89d0c4104ff406

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7c6ca6cc89d0c=
4104ff40b
      new failure (last pass: next-20201002)
      4 lines

    2020-10-06 13:09:49.420000  kern  :alert : 8<--- cut here ---
    2020-10-06 13:09:49.431000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2020-10-06 13:09:49.432000  kern  :alert : pgd =3D (ptrval)
    2020-10-06 13:09:49.435000  kern  :alert : [00000000] *pgd=3Dbcd8a831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7c6ca6cc89=
d0c4104ff40c
      new failure (last pass: next-20201002)
      46 lines

    2020-10-06 13:09:49.473000  kern  :emerg : Process udevd (pid: 108, sta=
ck limit =3D 0x(ptrval))
    2020-10-06 13:09:49.480000  kern  :emerg : Stack: (0xc4217ce8 to 0xc421=
8000)
    2020-10-06 13:09:49.487000  kern  :emerg : 7ce0:                   0000=
0000 00000000 00000080 936baa52 c4073810 00000000
    2020-10-06 13:09:49.499000  kern  :emerg : 7d00: bf0a50bc 00000000 0000=
0000 bf0a50bc 00000032 c068801c c4073810 c0f37c70
    2020-10-06 13:09:49.508000  kern  :emerg : 7d20: c0f37c78 00000000 0000=
0000 c0685d9c c4073810 bf0a50bc bf0a50bc c06862dc
    2020-10-06 13:09:49.514000  kern  :emerg : 7d40: 00000002 c4312800 c01e=
21a4 c06860d8 c4073810 00000000 bf0a50bc c06862d4
    2020-10-06 13:09:49.523000  kern  :emerg : 7d60: 00000000 bf0a50bc c407=
3810 c0686334 c4074f34 c4216000 bf0a50bc c06840bc
    2020-10-06 13:09:49.534000  kern  :emerg : 7d80: c4312800 ee832a58 c407=
4f34 936baa52 c0ec50b0 bf0a50bc c4257000 c0ec50b0
    2020-10-06 13:09:49.540000  kern  :emerg : 7da0: 00000000 c068502c bf0a=
49e8 eebc4540 bf0a50bc bf0a50bc bf032000 00000000
    2020-10-06 13:09:49.549000  kern  :emerg : 7dc0: c43127c0 c0686e4c c0ef=
9800 bf032000 00000000 c0102050 eea343e8 f10fa000
    ... (35 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7c6d5805c3b124514ff3e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201006/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201006/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7c6d5805c3b124514ff=
3e5
      failing since 76 days (last pass: next-20200706, first fail: next-202=
00721)  =20
