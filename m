Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17570324DE3
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 11:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhBYKSp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 05:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbhBYKPr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 05:15:47 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE89FC06174A
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:13:46 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id a24so2916729plm.11
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X54RFClwcXqB/1UofqcFe5e+kL+Nr4BFCbhBOfYR2Hc=;
        b=Km23wriBV9qigbgR+kC/7Ty92DoGjsVl0RP2uIBieS9QGyCPoKfR/i1ESYjZepvIZd
         0zYbhZC2S/pz/2xO9ud439RHCB3hzs388mNz1GwR4cmCosNwAuTxfC1Arcoy6u8p+RQ2
         a1itlTFDageVgJhXUxM4MSnRmsZtiQELf/8fpy/YUotUdmHzqRDogXwCCeZYi87z4vjC
         RNbtjtmI2goiZMhl6oS/p1EKDrL8NEs49q81oTMYZ/wf1MvlT8j93kwQamJrOAh6bdAl
         KK6gzUdpgz+LxLle/tla2XtNjFi33UF+2H2weZocAxThUvxdj/6kKavqJKm0RltcOvxg
         HPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X54RFClwcXqB/1UofqcFe5e+kL+Nr4BFCbhBOfYR2Hc=;
        b=Jaa66+gu1eRJMiKw9fOH0HOrYlGNdjjR3NGyKacDNvDi2rMrb77YF3lQLxm5CKvsWr
         IXfwxyFBj/WxCQ08XTUvAEkM0dWLOOSOTJ8vPaXA2k3LH0EODnG4FzOqWs/EIKRbdekA
         pqNgMCdqvcE8hbL75OIRhHDKk/Q5D1hKVTyhr7lk4uqBCHKGUzltzHjWQuh5lTh9jS2t
         ccOCo/1bbZRck3SEAe0YFVhzQCPy6bB32w5JWz1Bf7Tau5wa5xshx8e/NirkWzQ4lPco
         yjGWyxa1D60oKX6pm12nC/A3xR3jOJ2zwLtEA3oXEVxu2NnZfc7l7E7IB+DXoGD9NnNT
         LZSQ==
X-Gm-Message-State: AOAM531N31ukrapx/azhn1UG7LnDLF/sCBuKWzJO67ZNsgj7zx60sJtf
        wJeCpxzi3tXwYq5VD5UH460GMG8R25i/5g==
X-Google-Smtp-Source: ABdhPJzlhQSwgMm8L/Y8FijjlcoQ3KMy74bWgH5t50DV2SNjlMQ4/caYMFJLQyyXWspv1BZH5pBCQQ==
X-Received: by 2002:a17:90b:4a0b:: with SMTP id kk11mr2594592pjb.95.1614248026200;
        Thu, 25 Feb 2021 02:13:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x22sm5614016pjr.49.2021.02.25.02.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:13:45 -0800 (PST)
Message-ID: <60377859.1c69fb81.6082d.c068@mx.google.com>
Date:   Thu, 25 Feb 2021 02:13:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-10823-g633a3e57c64c0
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 160 runs,
 2 regressions (v5.11-10823-g633a3e57c64c0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 160 runs, 2 regressions (v5.11-10823-g633a3e57=
c64c0)

Regressions Summary
-------------------

platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
am57xx-beagle-x15 | arm   | lab-linaro-lkft | gcc-8    | multi_v7_defconfig=
           | 1          =

imx8mp-evk        | arm64 | lab-nxp         | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-10823-g633a3e57c64c0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-10823-g633a3e57c64c0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      633a3e57c64c04fa49bc60a0139a14d2e9d48338 =



Test Regressions
---------------- =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
am57xx-beagle-x15 | arm   | lab-linaro-lkft | gcc-8    | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60374cd45cd295b60faddcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-10823=
-g633a3e57c64c0/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-10823=
-g633a3e57c64c0/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374cd45cd295b60fadd=
cba
        failing since 1 day (last pass: v5.11-5016-ge82d5d2555f2, first fai=
l: v5.11-10049-g5933851d9e7bf) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
imx8mp-evk        | arm64 | lab-nxp         | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6037433ccf7b408660addcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-10823=
-g633a3e57c64c0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-10823=
-g633a3e57c64c0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037433ccf7b408660add=
cc5
        failing since 1 day (last pass: v5.11-9380-gef8173f75639, first fai=
l: v5.11-10049-g5933851d9e7bf) =

 =20
