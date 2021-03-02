Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5D632A996
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345502AbhCBSfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344558AbhCBF0d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 00:26:33 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F22C061756
        for <linux-next@vger.kernel.org>; Mon,  1 Mar 2021 21:02:43 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id t9so1105593pjl.5
        for <linux-next@vger.kernel.org>; Mon, 01 Mar 2021 21:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XPmeoghwJ50BlAToAfADN/+5EiZ8dfTZZf66CTgC4GQ=;
        b=oSyBTcNE8nPeGKXdkdASG/gHqUc+YmvEAkRg+K3Jx/Pi160re6GFAdNsIFq2pidJO7
         Kg7ioQs3CONZshT+1VuKnlhauhCLrVJdWAdhIsGj11P2XHBiA1tv/8jz6gGCIDC9b+5t
         y8Z+w7e5B4ojf9Co8l8XGv52TM8zeN+dihMyy4yaU+bkrFdYFRbs18+ovo2aumP0HZQQ
         IsDqyBBfZtg1yrKnM6LjAFFWruxN2EXeZYOzywYELisF+TUlRQtWC9d/FQMlm469dz5l
         xitM6DIIpThqFH6pG+3O74Kfp7XvEAMuvWi9tkb/ppSknycfNc/PmW1fG55sxXzBpyYO
         huwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XPmeoghwJ50BlAToAfADN/+5EiZ8dfTZZf66CTgC4GQ=;
        b=EnoPzWez6A+59G31UMVQfdmL2swDOP7zq2QT9g8apyAEbHH7eB5+caIUPAdpCitzSH
         HhaI7nH7Wejic/krI8XcErUXr0TgWGDzTyR5zWfbkjCxU3KlG8/PhzIJI7lsSr45+M/J
         8h5zhJ7TKtHajVQM8+Sb08Ea42STsS5B10tixXzZMXwcm6DnyNHdhxlg21kqExK1YuCs
         sZEAFF/CyelYBE+PrIjLQJhXVXZNXI5bSRDo+yGXYl5MvVrRMMAIWHoFlsQ+7+0A7jZf
         ILZ6EZ8Y9W4Eb/8MbkP85VZrII+rjgItpgdcCf0MghS2tIc9mTWALTl/J4pwRir0pnNS
         pF7Q==
X-Gm-Message-State: AOAM533coDekbTwyYJcz4ZbYTNbEqBCmY+z5rm3vKa6DKy5Qx9TiCF8r
        fB1SiWt6N+FKcLzMPkA4FidOMKyFEywj4A==
X-Google-Smtp-Source: ABdhPJyU1f+GkPkZfSEtEjKuJXVgoE240V13bWug3C8PPFmbN/+sb8uXvyovKLd1fZ3hVcbTvttnRQ==
X-Received: by 2002:a17:90a:5d16:: with SMTP id s22mr2461174pji.219.1614661362488;
        Mon, 01 Mar 2021 21:02:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q91sm1219930pjk.37.2021.03.01.21.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:02:42 -0800 (PST)
Message-ID: <603dc6f2.1c69fb81.b4e3d.3ce1@mx.google.com>
Date:   Mon, 01 Mar 2021 21:02:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-190-ge8638196c4142
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 189 runs,
 5 regressions (v5.12-rc1-190-ge8638196c4142)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 189 runs, 5 regressions (v5.12-rc1-190-ge86381=
96c4142)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc1-190-ge8638196c4142/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc1-190-ge8638196c4142
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e8638196c41420c08216c671d1ab4823ef1f9cdb =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603d8e3c2e9df46e71addcd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d8e3c2e9df46e71add=
cd7
        new failure (last pass: v5.11-11896-g31549ef5d561) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/603d926d11a3ab296baddcbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d926d11a3ab296badd=
cbe
        failing since 4 days (last pass: v5.11-9380-gef8173f75639, first fa=
il: v5.11-11308-g1e0436e950f3) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d9089d9b0249a09addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d9089d9b0249a09add=
cc2
        failing since 105 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d8e511f7df8b77eaddcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d8e511f7df8b77eadd=
cb9
        failing since 105 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603d8debd6901e90aeaddcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-1=
90-ge8638196c4142/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603d8debd6901e90aeadd=
cc5
        failing since 105 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
