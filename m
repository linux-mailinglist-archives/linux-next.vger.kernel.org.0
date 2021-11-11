Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339DF44D1C0
	for <lists+linux-next@lfdr.de>; Thu, 11 Nov 2021 06:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhKKFsU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Nov 2021 00:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhKKFsT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2021 00:48:19 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0675C061766
        for <linux-next@vger.kernel.org>; Wed, 10 Nov 2021 21:45:30 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id x131so4657390pfc.12
        for <linux-next@vger.kernel.org>; Wed, 10 Nov 2021 21:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KcMaABFqR69TK8wbVJmpD48/5hkEge7L0NMpkuG0Z80=;
        b=kc6joRsujJfkoxgDAt7CswadhIJ3UXs9pyoG3gc8VG83QAXkU6etHyGNU91/8bxyQR
         oM0SDfKZkAhZY6kLfY41OdGSFY+0V5EC8gM3b49sFuDt6VRl5gzUEvAAoEyRNMb6NBue
         I0x7VWjB1ufcouevv3oAJY/qaqRGBpWIxfHOzuX/VAq+s/892/iyWOJrrZGIW9srwVID
         0BgVdJ+4yKJLhTrTntFQBX08shsnwii/szuze+qrEXoGOAPLkskFv1BYoAVZq2OjRWhd
         96PmyLGyvFXZGRNz6eKZTwBL+bRv4ZkqqS0WrQ0nxond+Ik6gLm8riXhBIxfO1o4TV4n
         aMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KcMaABFqR69TK8wbVJmpD48/5hkEge7L0NMpkuG0Z80=;
        b=sntOwolgekhpuejmn+xYWzM9/2uqeOYGpEdL8B00IjiVh1b/ozpN+O8/88IPPnM0tp
         Umb3rbMRzRgogl7C+J3SCS4xVwjvkygA8y4rLsbB9Bw8/wJBnw0xiDVBoOUW328YDicR
         4IrUC+rUBOiNGPWpdrNmnnyNcUhDnutwBfyDQO7w9gHb5e8Bi06n0AbkKdjSZj8cET3w
         bCs/OtwsgKFlqhl4NgLJVX2lru5qK8EBxWWSYZNtjq1AsYSKUIz1sEHsdlMKuJ8ARED6
         ZLrSfL67mXV3d9f++uLb5sAbyj+rrru9T4QQQstZ7lL4DbUtQ0o/YdoTk6oAEQz96WpH
         x1GQ==
X-Gm-Message-State: AOAM5320jG5sPzKSIZdzWjw7nxOOaVDltMDlOfxL6uhJJCZdhzrZ9J93
        PnsHoA2bOqu4VckMQFWa3JseNj0QxPysLxm+WXQ=
X-Google-Smtp-Source: ABdhPJx2NIDM9+RZ36UsOzBUjV72ZbfcXl3iywWvrJI8RWB3eDOVKjJxQc9CK+0AIyAeKb26qk/QxA==
X-Received: by 2002:a62:1c58:0:b0:49f:d674:e506 with SMTP id c85-20020a621c58000000b0049fd674e506mr4496103pfc.66.1636609530320;
        Wed, 10 Nov 2021 21:45:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x193sm1548289pfd.160.2021.11.10.21.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 21:45:29 -0800 (PST)
Message-ID: <618cadf9.1c69fb81.090f.5de6@mx.google.com>
Date:   Wed, 10 Nov 2021 21:45:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-12344-g8c82a56b7923
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 498 runs,
 4 regressions (v5.15-12344-g8c82a56b7923)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 498 runs, 4 regressions (v5.15-12344-g8c82a56b=
7923)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-12344-g8c82a56b7923/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-12344-g8c82a56b7923
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8c82a56b792325956b81c32b5d3a4ace28ef749b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/618c74d7f97bc475183358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nano=
pi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nano=
pi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618c74d7f97bc47518335=
8f5
        new failure (last pass: v5.15-12053-g6f9f2ed9499c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/618c73d1bacfd7af333358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618c73d1bacfd7af33335=
8dd
        new failure (last pass: v5.15-12053-g6f9f2ed9499c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618ca6e5795d6b672b335908

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618ca6e5795d6b672b335=
909
        failing since 7 days (last pass: v5.15-2033-g53a1f94bc3ad, first fa=
il: v5.15-5907-g771bcd3baddd) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/618c9f73ea170be32a3358f2

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12344=
-g8c82a56b7923/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
618c9f73ea170be32a335933
        new failure (last pass: v5.15-12053-g6f9f2ed9499c)

    2021-11-11T04:43:22.582853  /lava-4947089/1/../bin/lava-test-case<8>[  =
 11.956070] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
