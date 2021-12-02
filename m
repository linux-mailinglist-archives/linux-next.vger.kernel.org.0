Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E24465DA9
	for <lists+linux-next@lfdr.de>; Thu,  2 Dec 2021 06:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhLBFL2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Dec 2021 00:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhLBFL1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2021 00:11:27 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3938FC061574
        for <linux-next@vger.kernel.org>; Wed,  1 Dec 2021 21:08:05 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id nn15-20020a17090b38cf00b001ac7dd5d40cso3654866pjb.3
        for <linux-next@vger.kernel.org>; Wed, 01 Dec 2021 21:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qeZss7Pu0fgBazeIH5E+2w44oAJa85lZwvlgBcxQZQA=;
        b=w9+D+RF4merJaK/8oRrmbfuhDe+QjZX+vrv5i4hkTasd+qoEx7hH+asMDfk5ksizg8
         qKtCDWrt6L7ut6ZreBwoqM3OPY2HQpKpPJON/SVcwwLQ1jyi3L6UerR8jX39tKT8V/FA
         OGyPjUodD/MdiffV+tB/uUmmP6ohSyyg7CnZ/fY5pOVb0f6I0H8wZCWeJAH/JFO9wIzZ
         9LCng78iL2eeuRulJHl+jNaWlgZxuAOEHk9pgCtCMU+HxVTOzyPV6mFJ9tE6XBkq6cqj
         9exStF1NuuVlEfqqnIU9t71JgEC/yvJEfDoXkZ+eng0997mHcFn0UXnojDNXZ6hgQCow
         d3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qeZss7Pu0fgBazeIH5E+2w44oAJa85lZwvlgBcxQZQA=;
        b=qZfHg8MyVErr2EchOtYuPVfiE+WC9Iv3dumqnm6+31v75pz6Qg4f7rVs4gxCiT49P3
         PrUYrT1smVC7c5htPQGk1RyBvNJuy7maGOuUmqdTctS7HZ7zU9WVOUNTuw6Ad/nDlj59
         OuniXJaE/G0I0NO5qzw1Ga3YpeK0QY2uRKYhyeSbK7UvMJwBBSM5p7dpWQY/8liyB/uv
         MnPl0+koHdriqJXtQWA9D7yHZy2SSSNq7fq3zvstUI/ccu1M/fdaJ6a3R5wlxjB4zy0M
         v7xsm+ChbQ9pXLcotZsZ5sSM2xx9n6RaoG4Q4VReVkiIzddnGT7ckGlh1j2eFO1/by62
         Wc4w==
X-Gm-Message-State: AOAM533a6pP1ix0nuOIAAy6g9t1pbc+8On1CXaJc9xHGbzbvi4IN3AW7
        KLNRaiMRRaEMXLr6aHNIUU3WBGmjqKlwSZNM
X-Google-Smtp-Source: ABdhPJyyaw7/LNNE4lcDDGSh4qlkhfMtm89LiiJZdG0ImIkPlPSK8ia18N7OvRrl7b7vYKtyyLi/DA==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id oj12mr3485178pjb.100.1638421684666;
        Wed, 01 Dec 2021 21:08:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j7sm959138pjf.41.2021.12.01.21.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 21:08:04 -0800 (PST)
Message-ID: <61a854b4.1c69fb81.f6c23.40a5@mx.google.com>
Date:   Wed, 01 Dec 2021 21:08:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc3-332-gcdb70004c3588
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 367 runs,
 3 regressions (v5.16-rc3-332-gcdb70004c3588)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 367 runs, 3 regressions (v5.16-rc3-332-gcdb700=
04c3588)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200        | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 1          =

meson-sm1-khadas-vim3l | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc3-332-gcdb70004c3588/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc3-332-gcdb70004c3588
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cdb70004c35884c2b0b07437b9b9221c21fa621b =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a829d60d04ee5ade1a94aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a829d60d04ee5ade1a9=
4ab
        failing since 22 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
meson-gxbb-p200        | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a823fa96cbe430221a948c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p=
200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p=
200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a823fa96cbe430221a9=
48d
        new failure (last pass: v5.16-rc3-229-gee9cfd4e60161) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
meson-sm1-khadas-vim3l | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a81b0952fb295fac1a9496

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-3=
32-gcdb70004c3588/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a81b0952fb295fac1a9=
497
        new failure (last pass: v5.16-rc3-229-gee9cfd4e60161) =

 =20
