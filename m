Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935AA20ACD3
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 09:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgFZHLq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 03:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgFZHLq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 03:11:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CC2C08C5C1
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 00:11:46 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id j1so4271908pfe.4
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tVVBTeFjjJRioyhTjA8iVdQZwzmDuaO1Xp2MXIBIJS4=;
        b=XIv5pwNgwAWWHlwzSW81UapeG/A/hiE9pgUyWRPemgci0F+yYnGYY5VJlG/r8VhiKt
         uGoJFa+6oELMkNrr8yQLHVD9VS5RnwhJhpuvXB/89zChGBKEagxXKSKG4qA3zzy3hhsD
         QMNKYnX15qgs7t80TDYv7hX7KrcmweAg8SSt/0oVbO0MT7O1o/VIXoWQ4c71/R27m9ZI
         2+y3n7eRSfKH70Ial5HK/lCAkmEhUXN56nQNyRm3jwEM+Z7bwq4SCtQx8XdVydp7aefO
         2KhsN8PY+ZdEEqGPhXASsjLG8Km+GZQes1jKUfzswjmM7iCZKhBBjpiubdMw2rnRq/hS
         kTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tVVBTeFjjJRioyhTjA8iVdQZwzmDuaO1Xp2MXIBIJS4=;
        b=EkcdWkBemAyf6/D1OahjFKAhs6kApuw6nodIF4KYz64QEjpOTCBGFhrLpBpRRZ1TQ+
         55Zj78NupTNUgDeZZ1xZ7JyzNWMTvuwZ8MlmfiBlgFvUavfv/N2suhU0UDHRIjwg8o8S
         7IU1TUGU23076amfoSFttIrIq3UOerjx4rui7EdS/C12HH1J52ddkpTLVhLm28cLYgjl
         Am/41h1cqtVQkuWHVNleeqx1kt8roM4XztK94z41jCBH5KRPSBHpUSpyUGrfpijo/NrU
         iJpql9w6XuUXAizJboeMJfXAbqlxVBEQ2pAGM9kpYo8Ducu4u082Xj9n/eaj3Zc2YoXI
         vYKQ==
X-Gm-Message-State: AOAM530mm/xEjcRBLywrREKpV/dMeLanAWli8SbwKifyigwHc9Q//mmG
        CwQtpBXnc7om71NZiUODoYr58wqg7Aw=
X-Google-Smtp-Source: ABdhPJzsmkFZJ+l7XFPgxvceBbbs2lL2w/3xie62hfkKFYgCDb83vUj/OMCuvnTiKNbABnNJ3FeVRQ==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr1569313pgv.410.1593155505384;
        Fri, 26 Jun 2020 00:11:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 10sm3106914pfx.136.2020.06.26.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:11:44 -0700 (PDT)
Message-ID: <5ef59fb0.1c69fb81.1d3fb.7f48@mx.google.com>
Date:   Fri, 26 Jun 2020 00:11:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc2-535-g3ea20606a997
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 119 runs,
 2 regressions (v5.8-rc2-535-g3ea20606a997)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 119 runs, 2 regressions (v5.8-rc2-535-g3ea2060=
6a997)

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


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc2-535-g3ea20606a997/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc2-535-g3ea20606a997
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3ea20606a9977747190775f34cb7193f8af4332a =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef56da783672d5f8b85bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-53=
5-g3ea20606a997/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-53=
5-g3ea20606a997/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef56da783672d5f=
8b85bb1b
      failing since 2 days (last pass: v5.8-rc2-295-g0780e0d6abd0, first fa=
il: v5.8-rc2-376-g1c7e639860a8)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef569115de2d8cdd985bb50

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-53=
5-g3ea20606a997/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-53=
5-g3ea20606a997/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef569115de2d8c=
dd985bb55
      failing since 0 day (last pass: v5.8-rc2-376-g1c7e639860a8, first fai=
l: v5.8-rc2-453-gf59148f15013)
      2 lines =20
