Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DEF209B5F
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 10:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390003AbgFYIgp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 04:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390001AbgFYIgo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2020 04:36:44 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84571C061573
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2020 01:36:44 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ne5so2707053pjb.5
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2020 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VUYyo6756uV7dDyqi7tjo3Ycf+BDgd9oRgHoJA08A+s=;
        b=vHYD1GxRSQATBj4ikZzfgBXuECKdiG+nozHVKbfUUrYinwUbcWUGG0TPiIJwVDYNw+
         ItHGSi9AHTSBiVkuEx5Dw0F6akXLcxI9DrFCBC6iGxLWWeIs4Z4ME/w+4wQJpEyni94H
         K4/m/2wcKkRiGJwGm5xXJxUKOkplVECzSBUsWEk9e7PXNs2JjDYlvRUY4o5SRzZEHTPo
         oMcJwO9DZDXe4pC2mL8ASMI9qcrWdy1iUqJhcmm5LUDIzfvMGcOU/nL/0f3n8y1L8i+E
         6v7D8r0wQcsQwxG5+IQmpCERoBL41sf69oh9veKK1WZC6o3KzhdyajrNQVLqyz9/1XIe
         7rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VUYyo6756uV7dDyqi7tjo3Ycf+BDgd9oRgHoJA08A+s=;
        b=npA2phh5RI0VCn8D3rGuRm2oyUQ0baSlbjoipdstkXh5JeMRvWSr8t/fVvqxB7hyj8
         YtAa/8VsfMstgB3aCHn0/lHaBlyl6du4Kub2MlPS9wqg48kVeMiTvlV7O2BF0/dfkpIf
         1mS0yh3IOL53g/ehSE0dmgrKHyj3G7QoOUTXd1oHcCIZtA92ZLGPFt0KURnl1NMhi2To
         AT3wHiSFzTv62XvmBJyJLdMPRQTz6ipqmS8cK52Fu3Sf51gyp0icpRm60paDMih1ZFVI
         9AKqXMm9fY1sWlqSOZ302H5cM17gMtjg8Cn+iCB9Q55v0+TZIpclU6p7/wkfGsLdm0XQ
         VXdA==
X-Gm-Message-State: AOAM533fekyBm7O8zxweXfKScxFA6fzs63jBjvxSLUohIMmJyGraRd3R
        skcl9XF7dZXDB9DHoHZtoyYiMeKypYY=
X-Google-Smtp-Source: ABdhPJyg1AIypr0n9AqkJJTpTUnYLbA6p2EfR4kQ96iRstEwwpxT7ukVj46n6ql07pva/lfj381VWA==
X-Received: by 2002:a17:902:d392:: with SMTP id e18mr31806617pld.295.1593074201663;
        Thu, 25 Jun 2020 01:36:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b19sm7422848pjo.57.2020.06.25.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 01:36:40 -0700 (PDT)
Message-ID: <5ef46218.1c69fb81.8f1a1.5ecd@mx.google.com>
Date:   Thu, 25 Jun 2020 01:36:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc2-453-gf59148f15013
Subject: next/pending-fixes baseline: 127 runs,
 4 regressions (v5.8-rc2-453-gf59148f15013)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 127 runs, 4 regressions (v5.8-rc2-453-gf59148f=
15013)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc2-453-gf59148f15013/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc2-453-gf59148f15013
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f59148f15013da68fca4dbaceb46c1692d106524 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef4286bd7fd03e70d97bf38

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef4286bd7fd03e7=
0d97bf3b
      new failure (last pass: v5.8-rc2-376-g1c7e639860a8)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef42d193563e3d2c497bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef42d193563e3d2=
c497bf0c
      failing since 1 day (last pass: v5.8-rc2-295-g0780e0d6abd0, first fai=
l: v5.8-rc2-376-g1c7e639860a8)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef42978a071c05e6797bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef42978a071c05=
e6797bf0e
      new failure (last pass: v5.8-rc2-376-g1c7e639860a8)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef42d65defd7422ce97bf1d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-45=
3-gf59148f15013/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef42d65defd742=
2ce97bf22
      new failure (last pass: v5.8-rc2-376-g1c7e639860a8)
      2 lines =20
