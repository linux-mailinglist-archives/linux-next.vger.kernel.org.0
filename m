Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C0A2A75DC
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 04:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgKEDDI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 22:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388504AbgKEDDH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 22:03:07 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BC2C0613CF
        for <linux-next@vger.kernel.org>; Wed,  4 Nov 2020 19:03:06 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id g11so57436pll.13
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2020 19:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NJ0PckM96HJgs+z+0tfxPhwMVkk0ZpHZbqe+oLYx4eI=;
        b=OsDQNKEcmKVa6De3+7S5sjgrUlcVhDchxivcfy7mP7Z5PMr9FdWovwHNv4n8DO8JKZ
         QRXOD3XiHDouWq5qsi+4u7y6XuJZy58KvVFGVaNTnKPgSSjJjcwCYsWh+n6WtUBWwS7r
         xmggGxfxPT3cPk1rZVKAyFX2ovZvZsWxihRPj2b9qVuExL59T/sAbD8h8u/Aks44MA0I
         BQXL2VuAUgFC1dgUKWckbARD9gra8sm1wF/p0He1s+bIb5tl6Y5GybVUuJp0JIv6jxul
         wWnQSZep6IzB9CoBPM/4ZOqGx6bmOpXs3t6ZqJAps4+3u89xO8+5zUo+WG/ByUjuvQWN
         PHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NJ0PckM96HJgs+z+0tfxPhwMVkk0ZpHZbqe+oLYx4eI=;
        b=Og79VunjNXDs6cP0dNHcDdB0OizrONDiDzhgn+M6lbwW/NOQa6nUcwpkNKn63NyEVM
         WNQGBfVHBTQaynKEGg8J5B4vZltHglMJKpVoGf5yx55E9objJUeypbuCyatfQfGkrwIC
         HS24tjvh41akSRD4ZTq7enLUGvTRLyuZCfMakKPlfVAc/UJvO/OsTPmjylHCQg3qeAZ0
         Cc2tLrktL9RurlMRPaw0FIXOBYlH6dn/jglbykkbJxsEaFmOABqquAo4/dCVT1FypVuZ
         H/1i0XVLeUhJLTqBVuSsRtgn0+O29iE6U8AcTTVoV29CvER8UxygoAaDuGupy7CriiIs
         RnsA==
X-Gm-Message-State: AOAM5326gFlTUOBXp2HBzVIJ5XQNwxkHcIEnUcge6WTr8aJE+POoQD2p
        naNuqJgvRjNt7qUo22tnCq+4N4DlxZ67cg==
X-Google-Smtp-Source: ABdhPJxxt9RRxy+tE9ePSdBsafsyee6YJIgsF8o7iZuWISvrrIaGTiQmcrw+oZ2ETMZaxcmSDMeTMw==
X-Received: by 2002:a17:902:c253:b029:d6:a357:3a60 with SMTP id 19-20020a170902c253b02900d6a3573a60mr260696plg.26.1604545386067;
        Wed, 04 Nov 2020 19:03:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 194sm262422pfz.142.2020.11.04.19.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 19:03:05 -0800 (PST)
Message-ID: <5fa36b69.1c69fb81.bbdb8.0f3d@mx.google.com>
Date:   Wed, 04 Nov 2020 19:03:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc2-396-ga212a20610dd8
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 327 runs,
 7 regressions (v5.10-rc2-396-ga212a20610dd8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 327 runs, 7 regressions (v5.10-rc2-396-ga212a2=
0610dd8)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

meson-gxbb-p200          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc2-396-ga212a20610dd8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc2-396-ga212a20610dd8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a212a20610dd80ed34b53afaf8da8549471740ae =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa33106013c02dea7fb530f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa33106013c02dea7fb5=
310
        failing since 183 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa333018907462d4efb531f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fa333018907462d=
4efb5324
        new failure (last pass: v5.10-rc2-346-g3261d524354a)
        2 lines

    2020-11-04 23:00:02.405000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-04 23:00:02.406000+00:00  (user:khilman) is already connected
    2020-11-04 23:00:18.886000+00:00  =00
    2020-11-04 23:00:18.887000+00:00  =

    2020-11-04 23:00:18.903000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-04 23:00:18.903000+00:00  =

    2020-11-04 23:00:18.903000+00:00  DRAM:  948 MiB
    2020-11-04 23:00:18.919000+00:00  RPI 3 Model B (0xa02082)
    2020-11-04 23:00:19.007000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-04 23:00:19.039000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (384 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
beagle-xm                | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa333b1cfad667c0bfb537a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa333b1cfad667c0bfb5=
37b
        new failure (last pass: v5.10-rc2-238-g6462cab89467) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa33577464660159bfb5312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa33577464660159bfb5=
313
        failing since 9 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa33798dec8643fecfb5308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa33798dec8643fecfb5=
309
        failing since 9 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa334b47aa0ddc7f9fb530d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa334b47aa0ddc7f9fb5=
30e
        new failure (last pass: v5.10-rc2-346-g3261d524354a) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxbb-p200          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa3312cd1b063efbcfb5317

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
96-ga212a20610dd8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa3312cd1b063efbcfb5=
318
        new failure (last pass: v5.10-rc2-346-g3261d524354a) =

 =20
