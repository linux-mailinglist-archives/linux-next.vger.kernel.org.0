Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB4846CBC4
	for <lists+linux-next@lfdr.de>; Wed,  8 Dec 2021 04:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbhLHDzn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Dec 2021 22:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhLHDzn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Dec 2021 22:55:43 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F832C061574
        for <linux-next@vger.kernel.org>; Tue,  7 Dec 2021 19:52:12 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 8so1323135pfo.4
        for <linux-next@vger.kernel.org>; Tue, 07 Dec 2021 19:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ST2bxl6UaNmfF26dFaxCYPwHecwO8vtclz63X4MIhi8=;
        b=KBNVFHnc6jv2vurrv7bVo1wt2eit2PK/raL+hgOOo/6TMMbGb7GNYkYh3V4XuNYrW9
         edFPEopsVXGJFwKEm/+pvPw7HNKVwpmwbT31J8wxO+wkyGrN7e15s+1tOlqdSxQWZm+8
         w34Z+bqtBJFjqEjWSVVJQ0HZI60OiA6mjIIhBRRMeTFZOAToaEzjSPrUeWrlQmm/F7cj
         3eqf6lT9i5/4e1QkvJplzfagjcYT/fBtNW+3/5zWd1HwpYd3yn5HZJ+ohWPGp5/uG883
         6Kw3JJJkE5gHMG3DXzck+PvrCaNZ6vkaHCVWuOVwiSxECtdttgAM6HM5qZ2l4xzL0f6n
         5geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ST2bxl6UaNmfF26dFaxCYPwHecwO8vtclz63X4MIhi8=;
        b=I3Lw20HHZ06epip5ZiZT7abjoFAMdzn0kZl4fywzZKbytjYngjpNe4olFIm7Syh3b5
         ni80fOU9WMIBa6kuUaPbZZjK1nWdRSxMsh4kVjtMJsYtv0GB0DWQ5V9QjYkGpwuxfITf
         2MrhONb2rVxW9IqsFxbu8UKpJbLbHegeeQcw0XrQpYhs4ncMrU+Ie5cD+fOGbYXXrlp4
         fhu+bCM1O45y/4e/2Wzczfir/29H13lVdRt8vpYBJE6fi0uY9AdtUf7hMOQb3VI8wRJ8
         Kvcpyazi5gdU7o7hu9mJrcO3qvZ2x9zOVu1EYxOzq+4z/hem86Q+s3CNv9SnjNHuEWnk
         jq6g==
X-Gm-Message-State: AOAM533NY+ghZPGRDKg+ZQg71mBx9cm/ceEaHlbHJZjrSNblD528zK08
        oULVH7EROPKhgnnfrCI0s15WzQTsujtIEp83
X-Google-Smtp-Source: ABdhPJxO1zEa0N6oum8YGGd/2rLDiXXXEurTvciU+ZkRYsBqd1XB+Y7HeMLDuCoW5mxk67V6c7Bs7A==
X-Received: by 2002:a63:2013:: with SMTP id g19mr11749219pgg.505.1638935531486;
        Tue, 07 Dec 2021 19:52:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p15sm1326233pfo.143.2021.12.07.19.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 19:52:11 -0800 (PST)
Message-ID: <61b02beb.1c69fb81.9a4ec.5e00@mx.google.com>
Date:   Tue, 07 Dec 2021 19:52:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc4-241-g3e464b455df7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 691 runs,
 5 regressions (v5.16-rc4-241-g3e464b455df7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 691 runs, 5 regressions (v5.16-rc4-241-g3e464b=
455df7)

Regressions Summary
-------------------

platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defcon..=
.ebook+amdgpu | 1          =

meson-g12b-odroid-n2  | arm64  | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3 | arm64  | lab-collabora | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x   | arm64  | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc4-241-g3e464b455df7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc4-241-g3e464b455df7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3e464b455df77f801874050cf91839f0b721b2fa =



Test Regressions
---------------- =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61affbd480e70d96401a94d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61affbd480e70d96401a9=
4d3
        failing since 27 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defcon..=
.ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61affe3a84eb1e70661a9518

  Results:     17 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61affe3a84eb1e7=
0661a951b
        new failure (last pass: v5.16-rc4-196-g38a22b258a2d)
        1 lines

    2021-12-08T00:37:07.033791  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector
    2021-12-08T00:37:07.043583  <8>[   10.410467] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
meson-g12b-odroid-n2  | arm64  | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61aff192b6be506b8b1a948e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61aff192b6be506b8b1a9=
48f
        new failure (last pass: v5.16-rc4-196-g38a22b258a2d) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
qemu_arm64-virt-gicv3 | arm64  | lab-collabora | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61aff1ce8ef2b988a91a94ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61aff1ce8ef2b988a91a9=
4cb
        new failure (last pass: v5.16-rc4-196-g38a22b258a2d) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
r8a77950-salvator-x   | arm64  | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61aff1a61ec37f0ef71a94aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-2=
41-g3e464b455df7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61aff1a61ec37f0ef71a9=
4ab
        new failure (last pass: v5.16-rc4-196-g38a22b258a2d) =

 =20
