Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7894E22CF54
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 22:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGXUUf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 16:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgGXUUf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 16:20:35 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B203C0619D3
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2020 13:20:35 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w126so5692779pfw.8
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2020 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IM4nUKCsGDYXPIniJVQOq1Z9DevQWpXvlY5u62Aelzk=;
        b=fk2crDFtRzIJO27DjGsndwN1OVDwy2+wyfr5T+PnK+rhziQE83QeGvcr/QCyWcr7ww
         swmFZO3x8Gx8z8yDD3/UMreDBkef55di8nV11RhkSinkRbHUH6wahRO7Dq3nI87Tk/mH
         NOwZbXQQU8ln+qrBnByOn4a6ScPdiW3mr0rR9H+/qFtFAg+QI2g6CfqDzcKdmvyCvK8d
         H7McMzGkrwN+D0O2elhdroCYxHKUq6kU3+WQuPPjvIUXsCwRKpPcaqVayW2nUJEuS7NH
         nTwWxr5e6iXVl+Yc7iMfrBfOjGC2YtXk0worm73kKHX9opPlmX+PUA64X3aU3QQNg/cG
         8Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IM4nUKCsGDYXPIniJVQOq1Z9DevQWpXvlY5u62Aelzk=;
        b=ZyiF6Masfes+syWhoc9DWO4iHTTkUvcxueY73C4x8TUMNNxIUWSZkyYK/lEvK5qfvT
         hJAOa3TV1XDfqCXe13Dd/XkT4VIibzhk+OgyKIZ6yNBKzr4Ij4UIMdKLYkfd4F9k/+6E
         Mb/+eaMu0u/uJ2lxM+1ElndZr2Bm+ZqpPIUwzpQPbquJaxcgc7PNHAqi6pw3fUF2fwUY
         nIN9XXxaPBhH1/LV+QZWjFWYMmNEXQQ4S0qfLqvzFOIun0trVtyvthg8qRmkuamR0YY/
         +odWMFahJIxwA3/kjs4AEj5+Bd82zDjXbj8S6+5mTLGHdjl+GCay6i3WPQRdQbTNSQGg
         sJKw==
X-Gm-Message-State: AOAM533czWmc+Y5e7DqXxOQjvecWDUOACJzlleOp/eAEWfF+LwXX88Hm
        9aNVNooOevZ4lEPpZHEAvBurrl8TYIQ=
X-Google-Smtp-Source: ABdhPJxmXVPhWS0b3MBS0qTaGNAcv8A1LxDcOHR51h1w3tQAon8ILkbI6JGA3sHS58tAR6DrITsmNg==
X-Received: by 2002:a63:4a0e:: with SMTP id x14mr10499557pga.271.1595622034083;
        Fri, 24 Jul 2020 13:20:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b4sm7404011pfo.137.2020.07.24.13.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 13:20:33 -0700 (PDT)
Message-ID: <5f1b4291.1c69fb81.0f1b.b736@mx.google.com>
Date:   Fri, 24 Jul 2020 13:20:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc6-327-gb1263ee340f7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 341 runs,
 4 regressions (v5.8-rc6-327-gb1263ee340f7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 341 runs, 4 regressions (v5.8-rc6-327-gb1263ee=
340f7)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
am335x-boneblack        | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc6-327-gb1263ee340f7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc6-327-gb1263ee340f7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b1263ee340f7bb07f084ecb6a5b669f4fb5ee81f =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
am335x-boneblack        | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a64907890d10e5b85bb3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-am335x-boneblack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-am335x-boneblack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a64907890d10e5b85b=
b3e
      new failure (last pass: v5.8-rc6-225-g65a378c84836) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a6063ac52f3de7185bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a6063ac52f3de7185b=
b20
      failing since 79 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a52c3206512889985bb2d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1a52c320651288=
9985bb30
      new failure (last pass: v5.8-rc6-225-g65a378c84836)
      1 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a547d121017e35485bb1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-32=
7-gb1263ee340f7/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a547d121017e35485b=
b1f
      failing since 3 days (last pass: v5.8-rc5-432-g6ded1a48da25, first fa=
il: v5.8-rc6-163-g19ae985ddbc8) =20
