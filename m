Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569CA1F019E
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 23:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgFEV1o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 17:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgFEV1o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 17:27:44 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC21FC08C5C2
        for <linux-next@vger.kernel.org>; Fri,  5 Jun 2020 14:27:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id jz3so3183523pjb.0
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2020 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lanCfgWMyxLytgCa4ypMtJFQob7032KYznsZzvBCyXs=;
        b=z0mx4VUNe8MxKwGb4j8A98utcZk5uNslllfZGZQI+9R7ethnlfLyPWUgTiltbkifSN
         nSrRG51GfmVM2su9u2XcGnefz35plk9C8Ar9nvqozgnzk2gWoxCaReU1MBqhP/RGaONa
         y6+qmrb5P/ENklnSmP5ZvXc9B4XGWhP39cQkqH9KmhTQvWrNGp3eIxHvl/EO7PVyTVEz
         CgwZDKQpJSvTwfVTww53mZGBrilEqFkAe5shbTV24+MU8gk9kacm6IVahkVWn9AVBhio
         5rYCjEMsnoCxVh0hSWL2KGK4zrfmluATBkZ4wNS4xHPvFVEzpra6Fc2v7cczYQ/wf6x9
         Ytpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lanCfgWMyxLytgCa4ypMtJFQob7032KYznsZzvBCyXs=;
        b=EJXraHTkun0jzRw2eA/kT2yquuBnSYkENgC37yRifI4hYkxc+re9NEoluhenLasEXi
         yX72VOZYH1g9Vi30NkeoDrcCSvbu2W2l5MXep62r+YPpv8AEnex2O8gy049s1xS1cgWc
         yURsKqkAFTqsZSkok2rOpiCqEapDlR6PXB8KE/h+FmVN6Ivz/KHuEbQD8/Lc9+saazXa
         Ymx4E0rstKHAnKrZXiFCLZh4cD6irHTliooBMfqSK3Qdt0tofjtfAM7n7k7t/9dMLTqa
         mrtQzABnQAEh+Wl8b448883zsnvkSpPwq4uYI6avL02t2olVKWfrCbrLB21Z3HujRaN1
         i2Eg==
X-Gm-Message-State: AOAM5323/lH5tJbyMZAg6/obfc/F7E1NZVsoJZWOgHg84WuuUD6FF1Ha
        luLEDVNLIpJJMBA6N3iS3tR+RQCsIWM=
X-Google-Smtp-Source: ABdhPJz/UzV0oJIjdPw4Tp0PQH7Med4EuUnhOu8uOG71Hllndq5CtC1jX/vftMtT/5KtwiHnXTZb3Q==
X-Received: by 2002:a17:90a:c695:: with SMTP id n21mr5459033pjt.206.1591392462529;
        Fri, 05 Jun 2020 14:27:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 14sm458792pfh.118.2020.06.05.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 14:27:41 -0700 (PDT)
Message-ID: <5edab8cd.1c69fb81.ebd8b.6af6@mx.google.com>
Date:   Fri, 05 Jun 2020 14:27:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200605
Subject: next/master baseline: 162 runs, 4 regressions (next-20200605)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 162 runs, 4 regressions (next-20200605)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200605/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200605
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      af30725c132e2e5c5369b60369ff0771fde7d4ff =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eda77d79869096be897bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200605/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200605/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eda77d79869096be897b=
f11
      failing since 38 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eda7d3be0cb4f06ac97bf23

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200605/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200605/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eda7d3be0cb4f06=
ac97bf26
      failing since 1 day (last pass: next-20200602, first fail: next-20200=
604)
      3 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eda825665223facfc97bf37

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200605/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200605/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eda825665223fa=
cfc97bf3c
      new failure (last pass: next-20200604)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5eda7ef357ae56026197bf1d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200605/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200605/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eda7ef357ae5602=
6197bf20
      new failure (last pass: next-20200604)
      2 lines =20
