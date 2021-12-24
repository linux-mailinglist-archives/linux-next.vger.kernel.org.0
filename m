Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCF147EB05
	for <lists+linux-next@lfdr.de>; Fri, 24 Dec 2021 04:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351197AbhLXD5b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 22:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235118AbhLXD5b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2021 22:57:31 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C37C061401
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 19:57:30 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o63-20020a17090a0a4500b001b1c2db8145so10417782pjo.5
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 19:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3ghVVpvvI9bvqmo4wo4c1c9E9FN3hF21n3FZHxZEG2Q=;
        b=uJ3d5z2R9Iha28QNh2GpBQ+O0fXT2il8mBk5XETuX3+kfjX5qI1tXRTgH46nZM8Yz4
         ZMRyo9Y+70QZ0ABTEMnNLDYut1Qtje6G8D6Mp9dPFaDuZifzb9LNyPinGSRKEnQC+h5s
         Vr2cfPst1FnPeEcLo8T5ds8bGR+Tu5JvwSFAplHl7UsdbyQBcb8G2+Au99+L3yeA+Lxl
         A0iBU22R51J5wQYeD9MrvU8pHUKfAwylmax3MHeYFJR2VD0w6Qrhge66nIlGKRp6OTHh
         d6CxsCvElIjvCHM+eDigB2rBSGtoyXKrgisNY3HPiaTHxxyq7O5cbWdbgPXObyPhwFcH
         XSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3ghVVpvvI9bvqmo4wo4c1c9E9FN3hF21n3FZHxZEG2Q=;
        b=NdZevUOd5v50QyHwYdQKqyWbdkFSqOXAyg1dzuHaWMk317+S5l0N2grU+F7YSgZLhm
         kW4ynBf+8elwJ8D9WXpBr9UJVc4+QDwvsTS9qlGnwxaSgUEgvcIRjJnuQ+3GEtHzP685
         UTc3JkFIZV0XQkicWUexb0JZRcDB4nQI3OLNEM7WFo2WwPUNYudPBPyx9iL6JLy/5f81
         52cV3tsCIn2mDeg9E9JEKYYqE9fHNiWaUsddziGAy7m01Q0VxpmyymWk5arK2u9B9bdt
         Dm8c4NoaKX06r7F1DX86BYp6N28GzsGvfZuBzRMEn6aqU3BSrFlip5PYY5XrfNP0mdFE
         1Y2Q==
X-Gm-Message-State: AOAM531/Vg1Sp34TsTsPhWmWP/r4hRt/JoEWXLsHGsR8kvVM8eSvHGGv
        x+9jvAghwMhV8Bue8BO/dtC+5HwzQA9rR3Cb
X-Google-Smtp-Source: ABdhPJzG0W+e0rkrPWXuo3g/s5thNPp9huFdo9usoqSTqNZv6jtD7X7cVc9ViT0CH4citeiyB/M/vA==
X-Received: by 2002:a17:902:ec87:b0:149:4910:e4dd with SMTP id x7-20020a170902ec8700b001494910e4ddmr5141799plg.36.1640318250354;
        Thu, 23 Dec 2021 19:57:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 27sm3951186pgx.81.2021.12.23.19.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 19:57:30 -0800 (PST)
Message-ID: <61c5452a.1c69fb81.c0b94.ce2a@mx.google.com>
Date:   Thu, 23 Dec 2021 19:57:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc6-233-g727655660152
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 662 runs,
 2 regressions (v5.16-rc6-233-g727655660152)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 662 runs, 2 regressions (v5.16-rc6-233-g727655=
660152)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc6-233-g727655660152/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc6-233-g727655660152
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      727655660152ca7ecf0b594cac52966638f71d74 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c51676fff6fca948397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
33-g727655660152/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
33-g727655660152/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c51676fff6fca948397=
121
        failing since 43 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c50ca718d5fc360039713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
33-g727655660152/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
33-g727655660152/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c50ca718d5fc3600397=
13c
        new failure (last pass: v5.16-rc6-213-gcac41c6f3ed1) =

 =20
