Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616B243D0F7
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 20:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243605AbhJ0Sp5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 14:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240472AbhJ0Spz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 14:45:55 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B360C061570
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 11:43:29 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id a26so3523967pfr.11
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DtHNDzQgoW2qLm0MxOdD0Ai97j2XTccBgseySuKYmk0=;
        b=v65oM0tiaHCNYlR2nqOaqgJLbb0+5IwZH4CHko+5NenghW20LTbTlZN2nk55nSVdfb
         M5sWHl53N5hTncCPKJV1HNJlRXyEYI3ZCFiTn+7yQI8Gf8wHYS2g/xNHU3c6v09JpOFn
         r9QyRtxUtZjckBHa9ylMhWZRgjE0rt7I6mF0/U2wFGkLbi8yN+tQ62g7tb64oQespFKl
         kCa7bCVQmuIdMuKUEsRoiCDj3vHxASX7HzT7dVii2vfZgopN81beOW2S7JtZN2KNS4zZ
         NV9z6tQson6bxATVEJyN0s7BOyxvzTD9jZhh5tiMM/LlZVvsdvW6/m9d4VtTR2ExcGAo
         qTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DtHNDzQgoW2qLm0MxOdD0Ai97j2XTccBgseySuKYmk0=;
        b=hJ/jZ2FoW8P9rqKUNFVxUOUI70DwaxXMBOTpij0D5GdV89z1LoQlR/iD9zGdtSsXUi
         DmwyPiYAM2L0kWGS/iDl6K+66O2Il0mdBvhQSegoMP5dHNIu7uwN4G10Gmz6Dje9mD28
         pIzAhyvkLTs/QC6oIvJWt5lI/+k1ymjTEzRPeEpWU9bQ0/G9QFq7qHjJY8glqHLpaK3y
         0AILGAo+PVrDKK57V4qXBmo7/iB0fzvIf3ft/eoq4SOHALwMFZUajt2vJI06tM5FzN5r
         S4oUkYVF+L+dkN4WWR1R9kBea1qNAddoR9CGLzpOCfjJjQ8bABF86WO9vhiWs9utRn4U
         W/AA==
X-Gm-Message-State: AOAM532jq6y0DulqgP2dtwyLtPQ3W45b3gpuaOtje5WYJ+pW+6HRCFfm
        VjmEzBehC36t6Agkbk1PYykkLqfTGlMZknAD5FI=
X-Google-Smtp-Source: ABdhPJxKGJKCECxThVAGuGLKpNGzIereEwUHmRbGpY1fZhHSTvAD7cElGgdWv03LMXTBXMfFIbJsUQ==
X-Received: by 2002:a63:b002:: with SMTP id h2mr13148194pgf.464.1635360207981;
        Wed, 27 Oct 2021 11:43:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10sm679305pfk.6.2021.10.27.11.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 11:43:26 -0700 (PDT)
Message-ID: <61799dce.1c69fb81.2cd4.2915@mx.google.com>
Date:   Wed, 27 Oct 2021 11:43:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211027
X-Kernelci-Report-Type: test
Subject: next/master baseline: 244 runs, 2 regressions (next-20211027)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 244 runs, 2 regressions (next-20211027)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig         =
 | regressions
---------------------+-------+--------------+----------+-------------------=
-+------------
beagle-xm            | arm   | lab-baylibre | clang-13 | multi_v7_defconfig=
 | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211027/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211027
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae5179317e794160e471db0e122c6ac811a97235 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig         =
 | regressions
---------------------+-------+--------------+----------+-------------------=
-+------------
beagle-xm            | arm   | lab-baylibre | clang-13 | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/61796389343820fae43358f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211027/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211027/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61796389343820fae4335=
8f4
        new failure (last pass: next-20211026) =

 =



platform             | arch  | lab          | compiler | defconfig         =
 | regressions
---------------------+-------+--------------+----------+-------------------=
-+------------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/61795b47c5a1ea25813358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211027/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211027/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61795b47c5a1ea2581335=
8de
        new failure (last pass: next-20211026) =

 =20
