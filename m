Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1061F5B0E
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 20:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbgFJSSi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 14:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgFJSSh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2020 14:18:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D78C03E96B
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 11:18:36 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id h185so1458405pfg.2
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BEQRIE1r8vWb+SnnLdJVmH1pC6E2Doro6QkMMh9pceQ=;
        b=J7ZSgRiKutCybg2jebEt+GTTKjXHXpxikqoR3ou/hujJwF0W1d6PUuYWE/xRVIeCyL
         BS8Um/Xkl5CV78gt7mPwndAvWJ4Dhpy5eQ+7LFarEj3INTAN7HXnsh8v8bHSWEPiUfPw
         +Z/5FYW5HfPeEhkHeAMIgXju22Cp7P+2YoWH9UHLxF9FG+DRZPF0vO7bLGTRNnaKrBZV
         Oorp4fiEFJ2yNlNCJDOHk1rP3Bay4gPaRcCtNYMGKp83xyWJ3oXmsknBKmQgAgTK9Z1r
         kJGTl/5iS2erOs6GUsUrfgVsc1NtCxGJgY2P0AkwbwTXrjAujTZX7u0dTKR77QxDzxJe
         j4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BEQRIE1r8vWb+SnnLdJVmH1pC6E2Doro6QkMMh9pceQ=;
        b=QYk70DbUYFRMHrcEobwnsTcXagLbxmvD7jdoM7SttSicIEa7WfyCpxCTykhw8sZs/Q
         HV+DM7+bEPik+pzpOF2DWc66bYNYs+OYbK1SLYL0Rgh/YsV8+fxFElFjn7JWm+XA9078
         fHQB+HX6hWbwM1BOJ+lDgtbL+aqnoWQioEw12zmik1vBdJdgPYxxq2fRjndbplFFzRGs
         0y5qeVRjzUPbWua0lvj1xGO5k2Yy1B2VXkVct1QyCCVNKzAJQ+5gm99XZnKK2s0bmyv2
         mM7v1IdPoXFO2GO2IKKHVZH5ZTEf3spCjCqffkcLq3o9cebm5rukkb3tGiJDJAHyQoc0
         gBSw==
X-Gm-Message-State: AOAM531uMqTYrBUmoVw5FYdS32R0GyvIRv29hz0iG9DcSXLDgviStkNB
        LAIKjsAPYQ+iarPkrZfC5ew2HSezAGY=
X-Google-Smtp-Source: ABdhPJyik84NfI9t/4r7o/64SjviCPv8kIQipcRsf8V9o8P9c7NfETf4B5hahaEK+E62leAf9WJzZg==
X-Received: by 2002:a63:6dc2:: with SMTP id i185mr3596012pgc.250.1591813115385;
        Wed, 10 Jun 2020 11:18:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i34sm425469pje.10.2020.06.10.11.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 11:18:34 -0700 (PDT)
Message-ID: <5ee123fa.1c69fb81.f8645.132c@mx.google.com>
Date:   Wed, 10 Jun 2020 11:18:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200610
Subject: next/master baseline: 202 runs, 3 regressions (next-20200610)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 202 runs, 3 regressions (next-20200610)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200610/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200610
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      976c320052ff22a7f9b8be0d56aefacb3a40f466 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee0e6a5c0d68c7ee197bf31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200610/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200610/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee0e6a5c0d68c7ee197b=
f32
      failing since 43 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee0ebce654a7969b197bf26

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee0ebce654a7969=
b197bf29
      failing since 0 day (last pass: next-20200608, first fail: next-20200=
609)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee0ed092932c24ea797bf14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee0ed092932c24ea797b=
f15
      new failure (last pass: next-20200609) =20
