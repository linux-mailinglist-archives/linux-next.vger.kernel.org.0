Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E0344E0C0
	for <lists+linux-next@lfdr.de>; Fri, 12 Nov 2021 04:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKLDZb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Nov 2021 22:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKLDZa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2021 22:25:30 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAD4C061766
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 19:22:41 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so6462241pjb.4
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8oTOph8SBdge6i2UGFFzpJt3F4d6rCFsxDuOK5bLgqU=;
        b=DPHQ8s7BD8TbgBZyGedHyp/nAgvpVR288XrRAYAr7VYNSlvan6O53n+n8BIQ6iB8Qb
         Eowd6bUqpmd5UigLftXHOPuh/Ag4oeNmdfEV8VP9LO37fNNwqCpY9VnflIVd7fke68YR
         +EILAnj/z75dlrLlhNL0WOZj8ZCOqngSE4Pk/D8UIAkgms0zzZCoK13BYf9F/bkz6wwl
         zmp/QEloJk52ceqjXkbYjjLQuHkdLl8EiSV3+nTOy4w6Fej7dQmeQq++/uynzF7coWx3
         BTKhKbQeJc19eQd5hupWNIfuDkBU9S1ehGx3GOVQgP2bZJHpl1tmws/mOb4aUGj5AItV
         KGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8oTOph8SBdge6i2UGFFzpJt3F4d6rCFsxDuOK5bLgqU=;
        b=ePvXBuM1EGyFgnVflW43udvFC2y5VYL1gzM3+QNtB5ZjTLA1j9zo39H35pd0fg1PjU
         B4CUMTlDpdlTsArkAK7QWnHTMusJQKz1/xU31J0pT6N2Mg1vLdL39eZRepS2Ttx8hMB0
         LTBIJtt3uV4ssq/5RyPWE0ZHVKcvAKzieCt+EDL1eBPbToCnMH4XBTUOORbwW1fgIoPK
         4lN5X/S3r36i9aTZ2rOX9mXZ46iD5tyBtXNOUGHfxWnnVmVHciO/RnEGaRrgTaeXYm2R
         OeRzArxg5ffD6JFBitm0QHeU/BuqOcOvaaGFJhN1FfMqcdiPAD0O2qlDF0XK3C59w3vN
         mRkg==
X-Gm-Message-State: AOAM530P6QitZW9zE0lJLScPsXhGYzxKOs5TImpsResBZH23Z/kfQiqt
        uDifVmf4tQqULWOvhBWI3rwwkmYwm5pnIZALs80=
X-Google-Smtp-Source: ABdhPJz3jNBzVoVyeuute+CPo+0gr6fIDVkTPwp2RWqKp7Iwb/FPtBocXPp0VyVJQfHEnKWedbsLEw==
X-Received: by 2002:a17:902:6b47:b0:142:82e1:6cf5 with SMTP id g7-20020a1709026b4700b0014282e16cf5mr4536064plt.28.1636687360341;
        Thu, 11 Nov 2021 19:22:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c21sm5044070pfl.15.2021.11.11.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 19:22:40 -0800 (PST)
Message-ID: <618dde00.1c69fb81.77f51.f9ab@mx.google.com>
Date:   Thu, 11 Nov 2021 19:22:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-12549-g95867f15dff8
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 634 runs,
 4 regressions (v5.15-12549-g95867f15dff8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 634 runs, 4 regressions (v5.15-12549-g95867f15=
dff8)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-12549-g95867f15dff8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-12549-g95867f15dff8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      95867f15dff83f5fd35d279475304fa5f0d9a2e6 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618da7d5865d87208a335929

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618da7d5865d87208a335=
92a
        failing since 1 day (last pass: v5.15-rc7-176-gbfbd58926fc5, first =
fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/618da1d6906677bbfe3359f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618da1d6906677bbfe335=
9f3
        failing since 0 day (last pass: v5.15-12053-g6f9f2ed9499c, first fa=
il: v5.15-12344-g8c82a56b7923) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/618da6b5d1911a4aa73358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618da6b5d1911a4aa7335=
8dd
        new failure (last pass: v5.15-12344-g8c82a56b7923) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618dad459b6fffaf153358ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-12549=
-g95867f15dff8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618dad459b6fffaf15335=
8eb
        failing since 8 days (last pass: v5.15-2033-g53a1f94bc3ad, first fa=
il: v5.15-5907-g771bcd3baddd) =

 =20
