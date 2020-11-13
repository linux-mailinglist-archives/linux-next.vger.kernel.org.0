Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178F82B149E
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 04:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgKMDSy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 22:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgKMDSx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 22:18:53 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B09C0613D1
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 19:18:52 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b3so3853440pls.11
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9hVdeOXnJMFVbk09Ki/+V/nWA4YZabAo4RrS5BUYqCY=;
        b=sHjofCdPMrem1srEbmRUxc8DF+VAGY7fgeq7TJxIPar6xeom9XdpVKlifhSErh54Hy
         5twkgv7M3Oe0J00SQeOmHwKvLDiI9QDaSTT63OgXBH7Hcv/4mYjtHAW6sr2NPLS8KdHC
         5T6UnPoWw9kzp/TJnP8LDC5uqyWFMlVGeg8WqECJs3vOsGd+PXZJvjmo9sKzc1s45yrX
         CRUMyVskWWPk8AM9iidvoVSjBbANc9eKFk8fTeuIFFQ8TXPsMqOlcnqD6K0HprMEcWzc
         Ioiyun9XahBHaGXOGbSRIAsm4HbBkrcIF7nQKMKNR8F9wguZNriWXeCP1hG73Ctj00gt
         D6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9hVdeOXnJMFVbk09Ki/+V/nWA4YZabAo4RrS5BUYqCY=;
        b=AkqrXBK5X7E4Tu7aSbW8WPYqcz+OzvY2c4WBmt7ezNohM9VM/Et7sHOxpG4ibGxek8
         P4B/lyhppnB2sUtdqfixy20IYT92BNa/iw1BFaRlmi2oSEB4hAAv+wtfaM6xWdmUZ2u/
         3iESpU0UhQr8Y7Nv2qu6PD6Y9nyQhyHBsoE0BOJ9RV5/C8BWBGD+WL3xYoiCMhL54WM5
         lTorO8rIcrpy4yARt6I7+ECgkP4PYXcmj77XvoN2EqMzT7mYGlrNDgVIZYR7dC7nzC9c
         gdj+iLTyN90P2WSevhgf4XW7uMYkoOiEyGR18XoweqwndCmBmZWfGeL3OmOpllBpV5T9
         3V/A==
X-Gm-Message-State: AOAM532pM8KBgatN3936g40zKVJI711eS8RD4PSTay9S/HqLpNbKy13m
        /Anca8ijXhxhpxT5B85imTI5SB5od1IPAw==
X-Google-Smtp-Source: ABdhPJyTJPsADfU5DbVfoqoouesWrth5RdNgKULQvDA7/KsYbe79mJY8bb7ZrC48T0TkDgEcanqFpQ==
X-Received: by 2002:a17:902:bf48:b029:d8:abd5:7670 with SMTP id u8-20020a170902bf48b02900d8abd57670mr344607pls.85.1605237531573;
        Thu, 12 Nov 2020 19:18:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r12sm7869294pfh.213.2020.11.12.19.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 19:18:50 -0800 (PST)
Message-ID: <5fadfb1a.1c69fb81.8fe4f.0c24@mx.google.com>
Date:   Thu, 12 Nov 2020 19:18:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc3-420-g5364e201065c
Subject: next/pending-fixes baseline: 288 runs,
 5 regressions (v5.10-rc3-420-g5364e201065c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 288 runs, 5 regressions (v5.10-rc3-420-g5364e2=
01065c)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc3-420-g5364e201065c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc3-420-g5364e201065c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5364e201065c479f2234e7b9de7511d0a5a97a74 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fadc6a44e6f13cc83db8871

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fadc6a44e6f13cc=
83db8874
        new failure (last pass: v5.10-rc3-337-ge83d2e1f2d190)
        1 lines

    2020-11-12 23:32:56.404000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-12 23:32:56.404000+00:00  (user:khilman) is already connected
    2020-11-12 23:33:12.163000+00:00  =00
    2020-11-12 23:33:12.163000+00:00  =

    2020-11-12 23:33:12.163000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-12 23:33:12.163000+00:00  =

    2020-11-12 23:33:12.163000+00:00  DRAM:  948 MiB
    2020-11-12 23:33:12.178000+00:00  RPI 3 Model B (0xa02082)
    2020-11-12 23:33:12.266000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-12 23:33:12.297000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fadc3cec15c824992db887b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fadc3cec15c824992db8=
87c
        failing since 18 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fadc6f2f8470d32b5db8860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fadc6f2f8470d32b5db8=
861
        failing since 17 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fadc3e36ce27c5b19db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fadc3e36ce27c5b19db8=
854
        new failure (last pass: v5.10-rc3-337-ge83d2e1f2d190) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fadc80706ddc9a494db8857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-4=
20-g5364e201065c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fadc80706ddc9a494db8=
858
        new failure (last pass: v5.10-rc3-337-ge83d2e1f2d190) =

 =20
