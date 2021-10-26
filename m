Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C57B43B57B
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 17:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhJZP1r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 11:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbhJZP1q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 11:27:46 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3148C061745
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 08:25:18 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so2003040pjb.3
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FAza7di6Bt+Tkw8jEryuW6JKwn9f7hUQnyn3ohXsQ8w=;
        b=L6MrKxKsGhkUgPUrB54BTAq7UBaL9PcAcFHSEmfHSd2sph4Uh9bn8F7N/w8TYyxAGq
         oFlFtvns2lMRbN4j5gPRijgjl6IZS7dAWkWjmwY4kN6pQebRNzjOUhF5tAoLvwlj2z1K
         bkgtc3UaU17BV+n6HOOToEQxyNyq8BoOPbGWTgIbTfm4lmoDxb0I06tsvgBJFUVl+3ff
         KOPDrB0W1a33dvgyDnYknRcn7ec26I0lEOetnrXw6Lz6itmQ5z1PyQ6DIwBT6H1OACJh
         bmfppLAjkAW0KixzjgeVMUb1ixOp0N2PIzA3n2Qvi9z88ap9yx+H0vg2EtbLuuoRIYW3
         eKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FAza7di6Bt+Tkw8jEryuW6JKwn9f7hUQnyn3ohXsQ8w=;
        b=I1tbHnS+zPCil8y/olp9JrW6RrunggDBnYnsMcyWi0DJXx1Y80ft1UdEBurEwlzQV3
         Pd3IvLKayYbS9ynnezn0VgoFBoolEZ+6n4rhwJqmE/NZNVKH5C0Z0rztNDcm8UggSZaq
         W6fwblyguh4m2TmBeuhfTnwvYMxyyq2TJs0T8pi6PKdHxnBtLHnyH4Hsw8FBiNusy56b
         6rWUySxqjQAOJfEHXzRS2IAyWW6ULr1sq5k66B8lSElCO4EzF0eOxYBOKZ3O4Z4DId0g
         O3lRPx+t+KzdkXDojIGJOuT2TO31S+aXoUGnrBWMVttuLZ7qX2l1VE8+WglYjocpYmii
         V/4g==
X-Gm-Message-State: AOAM530anfSB6BB79xp46QEWIVK/Xv4j1AC20DlmB672o1VcEODEOL6V
        amEKvlP16CA/4bREeatk0riwoF+UpAl0yd3/
X-Google-Smtp-Source: ABdhPJwW7vINZikQzymIgi9XTP4MMnDq1bS7q32jSQxOz9Ld93HHZkUXxpHyIOZzdasekot9Ivw7Ow==
X-Received: by 2002:a17:902:6b0c:b0:13f:aaf4:3df3 with SMTP id o12-20020a1709026b0c00b0013faaf43df3mr23485904plk.75.1635261917990;
        Tue, 26 Oct 2021 08:25:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a7sm22918011pfo.32.2021.10.26.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 08:25:17 -0700 (PDT)
Message-ID: <61781ddd.1c69fb81.dc684.c2f4@mx.google.com>
Date:   Tue, 26 Oct 2021 08:25:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211026
X-Kernelci-Report-Type: test
Subject: next/master baseline: 579 runs, 6 regressions (next-20211026)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 579 runs, 6 regressions (next-20211026)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | clang-13 | defconfig         =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima     =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+crypto  =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211026/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211026
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2376e5fe91bcad74b997d2cc0535abff79ec73c5 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | clang-13 | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e89f3f6ab13ce733593a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e89f3f6ab13ce7335=
93b
        failing since 0 day (last pass: next-20211022, first fail: next-202=
11025) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e39e3115ae1eb43358e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e39e3115ae1eb4335=
8e7
        failing since 0 day (last pass: next-20211021, first fail: next-202=
11025) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e4f2929d058186335902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e4f2929d058186335=
903
        failing since 0 day (last pass: next-20211022, first fail: next-202=
11025) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e5446d0463bb2b335900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e5446d0463bb2b335=
901
        failing since 0 day (last pass: next-20211021, first fail: next-202=
11025) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e79bff9862bbe93358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e79bff9862bbe9335=
8dd
        failing since 0 day (last pass: next-20211022, first fail: next-202=
11025) =

 =



platform              | arch  | lab         | compiler | defconfig         =
           | regressions
----------------------+-------+-------------+----------+-------------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6177e9cbe8c67f89333358e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211026/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6177e9cbe8c67f8933335=
8ea
        failing since 0 day (last pass: next-20211022, first fail: next-202=
11025) =

 =20
