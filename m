Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F7442FB65
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 20:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241554AbhJOSti (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 14:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbhJOSti (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 14:49:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8520BC061570
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 11:47:31 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 133so9374062pgb.1
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k4Wzmg2APaaXckjPO+eZF+6Jl9+kvvIEu3SxAODs0zw=;
        b=kgNshPmo4uk90UOw/gC+wPDzKm0zHzFpopH+D4+vXWDMLXU9D80kgcJehc5F6lKSBl
         dyys7bFo07PziRiDfKxczuJSM7CM4/Nnd25AfKmQax/LKKR+4lz/qxpUWQ02bAzSMvu3
         yxPZqF3GgEn+0EuNaNqNQYMFKYeHicsIgTSWMfeWB2Cb+I++mcVEp5RP9MfGPS6QhVmS
         nw3KTf9DzEcnVzsT6I3WGGSkLPqeKeTKP2Qcuadx+8K/FRRB4jahJlviAncMcSmKblxG
         hte/g5CR9Dx+RDS+/UbzVzZ6U7bWPZv6+2hoNVIHtEGhsruvKg++FAeCsl/3BEPX/lxF
         jUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k4Wzmg2APaaXckjPO+eZF+6Jl9+kvvIEu3SxAODs0zw=;
        b=ht7feNycGukhB3xRAWmLzCubkeeuq0qIBalT3cfX3LAgQEKEybIWq6JBmI7uffn/1k
         izMoCS3wBeEF8qyjEfwlGN66QPbM2/Sp77OZbVx1xSudgI9+A8KbgHyttrVb4jvVWvhe
         P9NU+/uXEv+RF1inNJiQXam31W0cxvZItlUSP6xCEp7EQ3x/3EMOTtUsCL3in7N/ejXb
         Hm8KgGJ1OYuMiuDoBuaIBSQYRbPaTxCZVKABQgKETWX3wdzNRBqVaT1OLoaYQCLJ+sxw
         TER2AqtqT75QhwrFlZ+QhZha0EW7pmTDLDRxzmRF+NHAXpahy8qNYOnN82y5h57eb/H+
         CBhg==
X-Gm-Message-State: AOAM530UH/kKRUITPRKYv5+4qiysrlAeJLTi9QsBKQYErip4/Xdo/Nw1
        +qlCsQJqND6kcgLEjiDFJosoNZZHuY79fI6q
X-Google-Smtp-Source: ABdhPJweVlCTM2LRNOkyg2yuogPBnLKDpdaHXXZRDKL6iPuIwIVB7QK83mJUSj5XL7ypqkIRVFy1tg==
X-Received: by 2002:a65:6215:: with SMTP id d21mr10563387pgv.62.1634323650872;
        Fri, 15 Oct 2021 11:47:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k14sm5643959pji.45.2021.10.15.11.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 11:47:30 -0700 (PDT)
Message-ID: <6169ccc2.1c69fb81.f5718.1daa@mx.google.com>
Date:   Fri, 15 Oct 2021 11:47:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211015
X-Kernelci-Report-Type: test
Subject: next/master baseline: 114 runs, 2 regressions (next-20211015)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 114 runs, 2 regressions (next-20211015)

Regressions Summary
-------------------

platform      | arch | lab     | compiler | defconfig           | regressio=
ns
--------------+------+---------+----------+---------------------+----------=
--
imx6q-sabresd | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =

imx6sx-sdb    | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211015/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211015
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7c832d2f9b959e3181370c8b0dacaf9efe13fc05 =



Test Regressions
---------------- =



platform      | arch | lab     | compiler | defconfig           | regressio=
ns
--------------+------+---------+----------+---------------------+----------=
--
imx6q-sabresd | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61698beefc2edfc3213358e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211015/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211015/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61698beefc2edfc321335=
8e2
        failing since 354 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform      | arch | lab     | compiler | defconfig           | regressio=
ns
--------------+------+---------+----------+---------------------+----------=
--
imx6sx-sdb    | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61698b003503f1fba73358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211015/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211015/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61698b003503f1fba7335=
8dd
        new failure (last pass: next-20211013) =

 =20
