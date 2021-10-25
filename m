Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9293743A5AF
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 23:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhJYVUU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 17:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbhJYVUT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 17:20:19 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056C6C061745
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 14:17:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f5so11910226pgc.12
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VXHWgb3pdRdnt7O5HpU0H5bQOzfmvQcH/rWz6WKPJ1Y=;
        b=4uvkyFlxYaw0A0uxdQOvSTJ/SXl+Nz3HIVQ0tT1f+23tWBcXM1po4ABLNS29QGUMEp
         RQCN1RPmvZL+kZOlnnwiDcNkz55A5aS72QF1qZ8w7KFTzX8JV1FNra5l2DnEipAru4h7
         +4H3FNiEhwVx2W+LOG12zoeZ6lYkvU/+XMhAwlGpuKgXGD0DoxT9/NjXjYU5YgDbroPq
         jy/gaTWKsRTSFYEZ30LrNvcLbM5D2erii7Y5VFaxeCKgnLzaMbq1gHg9HpAlQFrX+vSH
         /CJnBJ9cOuvH/FxAXQVMuTylQxd4ASXcvTdJCBYNjNWkQPKe1CxK6STf3hKp8Mnweiir
         N5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VXHWgb3pdRdnt7O5HpU0H5bQOzfmvQcH/rWz6WKPJ1Y=;
        b=gng+trrq6TtmbSEkNjSxkholfDvoxjMPDzflx34AQwZSkeI5wnv+2QO+UdlXIyPGM4
         G+j8sjnehYrtO0+6Eof70nLZTLW5ONLYWmdVxon6IB7/b7w+wYVOo8r5hxb/cjyShi95
         Eaal1HqA16TMff5hA8/lp25+4AdDDMFSx45ntm/GY4AgXm9Fy0WF2VSRU3FNheLrKf37
         yb3+nIq6xyKEF/6VzTM8nFweZydLyem5gbZ935Jo8PacGBcfgVC+hsDEvB+i8vMnAJfr
         zXxVupTyu7UwSV+wBRDx5fKh+b4IOFagpMD6A31cF+rFs5nu2UXyrjchV6ejyyZikYgZ
         akdA==
X-Gm-Message-State: AOAM532rpcIikE/QOpTnPV0refYd25znnbHXTDzghBv3jlsj69lc6mf4
        QzjDcDAxmiBWzC41+ceGdgOo/P5/9oeFHN90
X-Google-Smtp-Source: ABdhPJzF0jcCzU2FhsgK+CALfg41tRFV6B90XYPSYhPMMy+w23AGG2yv8v8elYlWKkBoVCDezfRlVg==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr15694148pgl.376.1635196676183;
        Mon, 25 Oct 2021 14:17:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z12sm21923196pjh.51.2021.10.25.14.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 14:17:55 -0700 (PDT)
Message-ID: <61771f03.1c69fb81.f8f06.bd59@mx.google.com>
Date:   Mon, 25 Oct 2021 14:17:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211025
X-Kernelci-Report-Type: test
Subject: next/master baseline: 608 runs, 9 regressions (next-20211025)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 608 runs, 9 regressions (next-20211025)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp       | clang-13 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-13 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-13 | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
             | 1          =

rk3288-veyron-jaq     | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211025/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211025
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9ae1fbdeabd3b3f668ad0bcb47d64b3a9fb4f8fc =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp       | clang-13 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6176e92c33fed13d2733590c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176e92c33fed13d27335=
90d
        new failure (last pass: next-20211021) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-13 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6176eb097e28b56a9c335900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176eb097e28b56a9c335=
901
        new failure (last pass: next-20211021) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-13 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6176f01f758c6c49ce335908

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176f01f758c6c49ce335=
909
        new failure (last pass: next-20211022) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6176e49e5c7604df253358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176e49e5c7604df25335=
8dd
        new failure (last pass: next-20211021) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6176e5cb69e7e5b5e73358f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176e5cb69e7e5b5e7335=
8f9
        new failure (last pass: next-20211022) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+ima   =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6176e6f7bd1410f5d2335910

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176e6f7bd1410f5d2335=
911
        new failure (last pass: next-20211022) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6176ed24d4a2b517963358e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176ed24d4a2b51796335=
8e1
        new failure (last pass: next-20211022) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6176f081f51d1c5c413358df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6176f081f51d1c5c41335=
8e0
        new failure (last pass: next-20211021) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3288-veyron-jaq     | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6176fcb50c8d9cd4333358ff

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211025/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211025/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6176fcb50c8d9cd433335940
        new failure (last pass: next-20211022)

    2021-10-25T18:51:04.082619  /lava-4831397/1/../bin/lava-test-case<8>[  =
 11.827285] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
