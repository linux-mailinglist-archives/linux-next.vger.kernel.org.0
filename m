Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2703237B3
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 08:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbhBXHKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 02:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbhBXHKp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 02:10:45 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EF4C061574
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 23:10:05 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id s23so724030pji.1
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 23:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z7WXnpEv8ADZwZTolyd5gjC5l+gdNZ5yv6rvpBJoBd8=;
        b=tbGlUN8slDUWYaYXNtDBuqoISNoCo2PqaAeDV/BUvp1VPczk8dUANCoVvLmx7sVJnR
         TftHSC8uqB1zIMpZRNvacfeLlyv5HRp9/hUY6+jUykOW81o8dRid1C2jDASfCKyikb/j
         XtPwpA095x1nVE9IuQM7NaKnmYCmM/Fl3nUY6EKTHjKyJLOJnSsIFKTUCdY1MTToRkUF
         YyTtt+VDihsbB7tToYQwi8G2DMoOLBN+1ftU5jindl5DiQAFrECX11PmBovX+VxzHGvt
         t4YyviF1UW6vP4ku15BtQbWWeAc+BO+vEANM4x7ful64VkifSAYnk5fIv0KuJxy4WvkA
         GzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z7WXnpEv8ADZwZTolyd5gjC5l+gdNZ5yv6rvpBJoBd8=;
        b=ENVfTksq7K1qrvSIGJqpUw72AITi5IjDDVWlIbcaGGhxGeMLHzAwp60XNM+bVyJsLp
         UG1OpIRjM2QdWXpT3nZhNOgolAQw/eyl5q+0WcO5kMKq2x1W8+6DFggDNPSkKduqPo54
         tnLD/9PsXWHGGmeFZg8N22lDbN4o07GX32Jp0kDhgpPlJ03Z32xSh4BK1UwIpMhweJvi
         V5C6JDVPwVL5IBwNe9+6KZN118DGt5/ORQF0gXpiBWovTTUxCehGVdDKJB+L0c3E8IQ1
         zwjUTz1mfxrxAjMBP0seFW77AlqnSq+YXoPMUzLkCSRyG/pux3s+Xow7iwqviBWk5f+Y
         VRfA==
X-Gm-Message-State: AOAM532wP76y5rRL/6GojS40PzFonk9UxDS6EzW9CdY4/Ee/zw24ds5t
        LT9bl2zKAwkxjIuq4U4W95NUc/0iKNQN+Q==
X-Google-Smtp-Source: ABdhPJwr0tK9YzrWkO0nmbch8xcOuHd3+dLXP9GtRctX15gLhAFP9rVPDW9J6d7dGf1TULLpB9O4cg==
X-Received: by 2002:a17:90a:ad7:: with SMTP id r23mr3065924pje.154.1614150604418;
        Tue, 23 Feb 2021 23:10:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 25sm1462873pfh.199.2021.02.23.23.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 23:10:03 -0800 (PST)
Message-ID: <6035fbcb.1c69fb81.6d308.3e8c@mx.google.com>
Date:   Tue, 23 Feb 2021 23:10:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-10049-g5933851d9e7bf
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 169 runs,
 2 regressions (v5.11-10049-g5933851d9e7bf)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 169 runs, 2 regressions (v5.11-10049-g5933851d=
9e7bf)

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
v5.11-10049-g5933851d9e7bf/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-10049-g5933851d9e7bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5933851d9e7bf62272d0212693e6b48e122a8974 =



Test Regressions
---------------- =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
am57xx-beagle-x15 | arm   | lab-linaro-lkft | gcc-8    | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6035c5e4a9c1371233addcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-10049=
-g5933851d9e7bf/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-10049=
-g5933851d9e7bf/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6035c5e4a9c1371233add=
cc6
        new failure (last pass: v5.11-5016-ge82d5d2555f2) =

 =



platform          | arch  | lab             | compiler | defconfig         =
           | regressions
------------------+-------+-----------------+----------+-------------------=
-----------+------------
imx8mp-evk        | arm64 | lab-nxp         | gcc-8    | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6035c671a08acad819addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-10049=
-g5933851d9e7bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-10049=
-g5933851d9e7bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6035c671a08acad819add=
cc2
        new failure (last pass: v5.11-9380-gef8173f75639) =

 =20
