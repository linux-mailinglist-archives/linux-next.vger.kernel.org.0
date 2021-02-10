Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24083166E2
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 13:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbhBJMiO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 07:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhBJMgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 07:36:04 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F833C06174A
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 04:35:24 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id lw17so2898936pjb.0
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=st0igJ5ddekwWFRYxE3+4tuxwl+yMHn0k5YVC0r35Z0=;
        b=QYBKoBrOHbbPckoUy6lb9rKo7bByvaOXC4syAwP7hTQOjljrBqeKBmJDg/fzpGUa68
         DgVG7VTldgRRClXJQDFOYswYDGNxomEOSvVwZgXceqzwjyDOsGOiF0FZYdLVFA5CrdPk
         FXYkrii+y++DBncSYoYRD6g7oDkNedNhm4TtNmrTnj6dIq5dWiWJmDLIQeBPEj1VWkKb
         TRivkvl6H8kq/UtDrBAyorZruNDBAFVSlSqwphfRYexJMLrXPCi8ZscN6pJOyUN10VVv
         xIfQjzpdLvqUZNxDQNi6+cYhykVKhfjvBzlk7dbRWaZZ+yPaMm6jLN0BMHLeIDnrioTj
         fQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=st0igJ5ddekwWFRYxE3+4tuxwl+yMHn0k5YVC0r35Z0=;
        b=EmRJXpH82v4CSyry7/n7Igcf+X2XKmdMf0FR6ZkIPKnTrUknENciCCzx1BvbhlT5UW
         7JfLZ3gZYDeva8nj84cG4q4Ilj0dIVT64ujP7PoIXFQW6ZXG+WEGx3U2fFBvvoWCh29K
         JIThi0uSj62DkZ2zLyKhDwgUEj6owS53ExrRmkbbUb1416etHQBeVWAAZIx2kvPIsJ2E
         4IV8dBNYzwNrCvNoykRfj3m6w53rjp/nXshlCagWJc/39wYiB28f4OAgI0P3PWPUzeQo
         OcTTv8F+TRyovM7gboKyRJF0JptzPD++B3hcR8Bp83BFXSnnhidF2Qehdw8TLz4ViM40
         mVXw==
X-Gm-Message-State: AOAM531FBGsrP2a16bGXXKsMjDoZpHl9ifqevkU+ZwrCHSpcLKwu+KaC
        D274vFamksydfBJJV7oiB0QWVlu+uhF7OA==
X-Google-Smtp-Source: ABdhPJwbal5vJv3QUavX9m8fS4XyoHgos1oSxPnSLuucjHTUsK3ipzisPNkkyc6An0KqKRk7VfDF+w==
X-Received: by 2002:a17:902:8211:b029:e2:fece:59a4 with SMTP id x17-20020a1709028211b02900e2fece59a4mr2975069pln.19.1612960523570;
        Wed, 10 Feb 2021 04:35:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t22sm2535700pgm.18.2021.02.10.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:35:22 -0800 (PST)
Message-ID: <6023d30a.1c69fb81.34809.52cb@mx.google.com>
Date:   Wed, 10 Feb 2021 04:35:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc7-135-gfeb8c1ad740c
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 184 runs,
 3 regressions (v5.11-rc7-135-gfeb8c1ad740c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 184 runs, 3 regressions (v5.11-rc7-135-gfeb8c1=
ad740c)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc7-135-gfeb8c1ad740c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc7-135-gfeb8c1ad740c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      feb8c1ad740ce177a71a7c6523847f3254a0330c =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60239ab8720370129e3abe79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60239ab8720370129e3ab=
e7a
        new failure (last pass: v5.11-rc7-121-gdfed2943da0a) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60239ee7f8c1fb0f423abf6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60239ee7f8c1fb0f423ab=
f6e
        failing since 20 days (last pass: v5.11-rc4-275-g31be679b2913, firs=
t fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6023a237a5c64c4ffa3abf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
35-gfeb8c1ad740c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6023a237a5c64c4ffa3ab=
f0a
        new failure (last pass: v5.11-rc7-121-gdfed2943da0a) =

 =20
