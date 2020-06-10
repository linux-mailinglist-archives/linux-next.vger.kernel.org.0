Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7576A1F4F65
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 09:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgFJHpW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 03:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgFJHpD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2020 03:45:03 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF54C03E96B
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 00:45:02 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id n23so605190pgb.12
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Wa23QjXPli0YG0G/g8HFBPAl12x8Y+egtx+xHWQFac0=;
        b=KC9REAhEIzmAs3Fei9NphFZVGBCbVR2Ue7RKRuS8z7N0H/F8T8EKdGe0iku7XkVGcI
         +uV9QqJ1mlSJHxtHgx5WyaAT77YlX/BQuBFmrz3nFsLY8gdxkFCAljdTy3H5hfkIQOkL
         U9W00ZcK2YxoxAIN0z/dKRcEXg6J692TT8pbxsSPG0FOSSZLY8QIh5SiSH2jOZCTEdKL
         cMnZeoROnckP7QeuC5S7blB4mjeoSPo8KpPOX4aq2oK2/lrOEwXo2iS8Fh/J1YSkT66x
         /uz5jguKxz3UgldRR2LgTpp6GXkHsOO2bP4zi2eLh1mRSfpp9Dpg3YLHcHQ6SuCc4/Kp
         kHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Wa23QjXPli0YG0G/g8HFBPAl12x8Y+egtx+xHWQFac0=;
        b=JautQ+DyPj7NawDxsQFNrX63+FKuXstYB0midW+pSjEhFARvJhLnvorxQTFqF2aq68
         aookChD60OtaNbMRYSXrF+UUuyIP0kdZwCxkUSjGVC6a5IHP33jXOkD6b5aYFzcarq9y
         MeRInxi5ZxQztyw7pTDaTprOze/FfRH5V2fe+8UaRbqTHxkwzMmFp5jwf0rCjqhrd0y+
         1l7o1aOwgELFA6Dm0YeEMwrRpBuabwf1rku8RJ4b2dEuIaafrVZlVq0VfLmDULzrQOCJ
         WDJsL6zXOzqBMCwBDqg5bl8Uu+5cepxHZK9TDGYelN/zkNgTNEZBa5K+G6x8Uby+cJMj
         SauQ==
X-Gm-Message-State: AOAM5301Uvka5AT1fPxYAQ0qfMxrsoRm8FrafzBJhdgPjrdBCC6rGIJI
        eZ4DLTjh0ArlzKIt5PsQ7qAS0gGFZ9Q=
X-Google-Smtp-Source: ABdhPJwFTN3fFKr2IUfmp4aO1HyunRPaPQrW55B9joy/9MCSTrfcONlP+X5MS/zUgUQER7NLUtE5CQ==
X-Received: by 2002:a62:8811:: with SMTP id l17mr1595505pfd.72.1591775101267;
        Wed, 10 Jun 2020 00:45:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u17sm10549382pgo.90.2020.06.10.00.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 00:45:00 -0700 (PDT)
Message-ID: <5ee08f7c.1c69fb81.9382f.3e7f@mx.google.com>
Date:   Wed, 10 Jun 2020 00:45:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-13513-ga8195ca429a0
Subject: next/pending-fixes baseline: 211 runs,
 4 regressions (v5.7-13513-ga8195ca429a0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 211 runs, 4 regressions (v5.7-13513-ga8195ca42=
9a0)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =

qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-13513-ga8195ca429a0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-13513-ga8195ca429a0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a8195ca429a0ab2f8e355e801d5e04a27883a92c =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee057e76980a1664297bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee057e76980a166=
4297bf0c
      new failure (last pass: v5.7-13207-g0a095ef39b5b)
      2 lines =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee05e56cb3913379497bf0a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee05e56cb391337=
9497bf0d
      failing since 5 days (last pass: v5.7-4607-g4ce9138f1bd4, first fail:=
 v5.7-8671-g086779e58c68)
      3 lines =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee05ebdbb9517bce197bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee05ebdbb9517b=
ce197bf0e
      new failure (last pass: v5.7-13207-g0a095ef39b5b)
      2 lines =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee05943508fc1a9b997bf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13513-=
ga8195ca429a0/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee05943508fc1a9b997b=
f16
      new failure (last pass: v5.7-13207-g0a095ef39b5b) =20
