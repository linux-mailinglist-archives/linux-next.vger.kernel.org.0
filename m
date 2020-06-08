Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6E41F1241
	for <lists+linux-next@lfdr.de>; Mon,  8 Jun 2020 06:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgFHEgz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Jun 2020 00:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgFHEgz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2020 00:36:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8A9C08C5C3
        for <linux-next@vger.kernel.org>; Sun,  7 Jun 2020 21:36:53 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y17so6152730plb.8
        for <linux-next@vger.kernel.org>; Sun, 07 Jun 2020 21:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AOHJKV7L/VyaKMX0cf5GiYXNkp5zwkoEMaoo5myAL4Y=;
        b=pYC0Vfbt7jjSKTaJDkMKH2l07EsmFjxe/+o6vLUGdmuW0nonHru67RF7MPJepwnfgm
         W2zQ86SE4p7RdfoXxjlKOSGMpZSaeJkHSv1/NWvACT4frwNBL/J3EYOXFwF6HN8e3qIW
         /AcuI0hlAswKrJpbIUqtmr/UfSWoUiLx/yCK5gyhv3t8kh67vbsLQi35e9qTA2cp6yoU
         5qcIrm4bNHKdLiMflohQIyvJ6zki7cnTDTGXpD4ki1t8CUa7DWnp4Vb4GQlsNiNlwsDw
         lt3KSAFh5ibenlAUNqLwOcQmcTEF8rLN30h4iDTPZQT0PL7iaXgb+3rOJVNNKLwjcKoz
         momg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AOHJKV7L/VyaKMX0cf5GiYXNkp5zwkoEMaoo5myAL4Y=;
        b=CfdLs/78Mn1jgZ++jRb9f5c6foEXTBYn5XgLPPusZnJJmOFrErJtgscsd/LhMXmvKt
         drVJQ569lF0ALwEg6/MV37E6aUPmG4G3z+V/+PK45Uk2AdlVHkk7l+v/n8DMvNHImx6m
         dTKjzOzh0E0YVSa3sMc+KbrtcQUbX0WnDy7JEdri8GXl6zaFUJPsMRYYtbLrQXq4HnFT
         FH4EUI/cCJ5x/m1CsUsWMuOttCedwVnQvks56zuNZIsXWYbxhDD8iqnsyJDsF/wLs+D7
         5NFBsj4JoB0wK2ZDq0YudTIYoydHSX7JhjjpC12PfiJoOamQ/VZzFEe25R0sEk5eSccF
         cv9Q==
X-Gm-Message-State: AOAM530eRX9v+wZdnkN6WEdDaXgtCBefSox+X4RiW9jYmf0QjEwnDkjW
        oK25MxWWaTZJGUEZwrmAhaVHKXLK11Q=
X-Google-Smtp-Source: ABdhPJzNTpBW5wRy4wgg+yqNEEGezsqYKmLzt2MBgoJLkj4s390wnBffQ5qWmfaW2n5nLRRpyRz2iA==
X-Received: by 2002:a17:90a:2070:: with SMTP id n103mr15631188pjc.109.1591591013175;
        Sun, 07 Jun 2020 21:36:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j130sm5749819pfd.94.2020.06.07.21.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 21:36:52 -0700 (PDT)
Message-ID: <5eddc064.1c69fb81.71368.8881@mx.google.com>
Date:   Sun, 07 Jun 2020 21:36:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-12631-g7925a52a5e45
Subject: next/pending-fixes baseline: 132 runs,
 3 regressions (v5.7-12631-g7925a52a5e45)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 132 runs, 3 regressions (v5.7-12631-g7925a52a5=
e45)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | results
----------------------+-------+-----------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre    | gcc-8    | sama5_defconfi=
g              | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 4/5    =

imx6dl-riotboard      | arm   | lab-pengutronix | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-12631-g7925a52a5e45/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-12631-g7925a52a5e45
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7925a52a5e453b2151588051b25ec3fbc175499a =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | results
----------------------+-------+-----------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre    | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5edd89c6ee4bb6509a97bf17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5edd89c6ee4bb6509a97b=
f18
      failing since 33 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab             | compiler | defconfig     =
               | results
----------------------+-------+-----------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5edd8fc8499f52423b97bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5edd8fc8499f5242=
3b97bf0c
      failing since 3 days (last pass: v5.7-4607-g4ce9138f1bd4, first fail:=
 v5.7-8671-g086779e58c68)
      2 lines =



platform              | arch  | lab             | compiler | defconfig     =
               | results
----------------------+-------+-----------------+----------+---------------=
---------------+--------
imx6dl-riotboard      | arm   | lab-pengutronix | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5edd8e292cd6ef8bd297bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/b=
aseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-12631-=
g7925a52a5e45/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/b=
aseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5edd8e292cd6ef8bd297b=
f0a
      new failure (last pass: v5.7-8671-g086779e58c68) =20
