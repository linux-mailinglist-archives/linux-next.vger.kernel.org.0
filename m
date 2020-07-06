Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0C72151D5
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 06:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgGFEoO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 00:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgGFEoO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 00:44:14 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A967C061794
        for <linux-next@vger.kernel.org>; Sun,  5 Jul 2020 21:44:14 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k71so12761336pje.0
        for <linux-next@vger.kernel.org>; Sun, 05 Jul 2020 21:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9/+jLbYqHGmhJNgbdbH++5i2atiALUedq84yqOw76DM=;
        b=Um/p2TJHe8a4f3qXpUpsORsKJX5t7cK0YtZnek+R3alkkIcslzmqXGN5hIaEXDOMN5
         ustlGuUHP+mBbQINHixa4vaEGIAD+CC/JCgbwqM7OHsegDKocpQzMArKFqAej5CUW19J
         6xjdGES1JQI+hmMItok1j07vQ1sXVEV1gjYFXQoWF0zb+IvJ9wD9YD6Uushmnb2m8IaN
         ALX4TLa9ik7RVJ45G2pvLLoClT9FfG2TEy6wXFhN6XXf5OgmJtBON96voPEo0lTt7uoq
         3MZGCMQRbQCif3LVphZExe0OnIa6Own/1ahYXqvn9A1k8zYq8UAexTLcRDa4FMIDaQ+D
         7RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9/+jLbYqHGmhJNgbdbH++5i2atiALUedq84yqOw76DM=;
        b=hK1oDJpJUwHx8UbfQ5PWEo5RNE6tcVxScjVdKv4n+Asv64dy7yZ0JycRTFnBZFziwo
         h4VUYvckKNhi1W4FUfpJDfuk5O/6T1TgbIHCN34RLEl/rUHNYqZF0MYU291ja0I7HdVC
         U8H9sqSI3i16vq6tRw3mllK+2OQYxdrecoHcmACXZdWCu2AepWcpvFSfJpfoL32M6ySE
         U9392ZYsZVWpotInQd+is0kv6i1wXiqCFhcAoEbA34oQEF3/IbrGbIsWs60ksYLFtKRT
         uI9mi/ICmCM8hFogxLs6uROlgRo99t8KBFQlWorTjugbB6yFxs1zUcLVg+ds/IQNgR1+
         fw5w==
X-Gm-Message-State: AOAM530PkpNeYLVaAZv/StaLkfHrGG6i1iXWuv//eQ6+tbGLBYz910II
        lFQ+Nc/xd60UBgd8rOTijYuNww0snAM=
X-Google-Smtp-Source: ABdhPJyRZxufB7pdbdZ4lUIIRD3tFvgBH+IVGSXfYsUPL+loefoy1muCmqTUWS/c9SGcbN7HF76VdQ==
X-Received: by 2002:a17:90a:3489:: with SMTP id p9mr50294469pjb.56.1594010652730;
        Sun, 05 Jul 2020 21:44:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j11sm2889289pfn.38.2020.07.05.21.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 21:44:12 -0700 (PDT)
Message-ID: <5f02ac1c.1c69fb81.33ba0.91f3@mx.google.com>
Date:   Sun, 05 Jul 2020 21:44:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-473-g661b0ff064b6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 164 runs,
 4 regressions (v5.8-rc3-473-g661b0ff064b6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 164 runs, 4 regressions (v5.8-rc3-473-g661b0ff=
064b6)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-473-g661b0ff064b6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-473-g661b0ff064b6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      661b0ff064b6304266aada06d6e6489392410f86 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f027b691f6579e0c585bb2b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f027b691f6579e0=
c585bb2e
      failing since 2 days (last pass: v5.8-rc3-311-g478674402fa5, first fa=
il: v5.8-rc3-345-g29dbc0a7c3d1)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0271334687f7766785bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f0271334687f77=
66785bb27
      new failure (last pass: v5.8-rc3-345-g29dbc0a7c3d1)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f02771397c41aa57885bb2c

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f02771397c41aa5=
7885bb2f
      failing since 7 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0276fb97c41aa57885bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-47=
3-g661b0ff064b6/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0276fb97c41aa5=
7885bb1b
      failing since 7 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
