Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5847484D36
	for <lists+linux-next@lfdr.de>; Wed,  5 Jan 2022 06:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiAEFDZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Jan 2022 00:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiAEFDZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Jan 2022 00:03:25 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56D7C061761
        for <linux-next@vger.kernel.org>; Tue,  4 Jan 2022 21:03:24 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 8so34534101pgc.10
        for <linux-next@vger.kernel.org>; Tue, 04 Jan 2022 21:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OsR5kvoykbw5uxqxLmSjXCXNzaDIyLboURby2p29MXY=;
        b=P+1GPFZJhkcYktQewawIKI+cUlwNIRY6gsO8EsJuwYNEYnb3z7HSHlLhtT9cSSJLKA
         xqevAMt5LAN2FB1N51hwFKvR+X+UcPkQWYqVPCwGadbF34e+F+GvJi9x0D+mjd1VyV+D
         Y5yQu9g2l0OkXuU6wVA99JkkosQWk4cL5bgQAzO8ugBrYGt1KC9L7Ojt5tvBjAp38COG
         S/7XqJdvPxSY3L+R01I/Xby0qi4t/RvC5mwMbc5zHgVD/2++TfnJhyGyt5FtKxGLbT9r
         Hyxp41r+c4kFwa1rXI3X2ylv+5hZQGxuzYvQxsWDgybPhQCvR6pZjzJDJ20jTuY4zuh1
         Gdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OsR5kvoykbw5uxqxLmSjXCXNzaDIyLboURby2p29MXY=;
        b=FiQgM95fcxBeb5lUec29umYuum8WMBphBrurBmtV00hhkvkboIVQWA7RxynogvX8Mk
         /21xpKxdmN/mn7xakEcsgABqEhDU45oU3pySvRaeAa4lDbUhAeNKBvDvi8t688EfFm0/
         rUnghU+aZfAjXiSK0yCeX0CUEoYfVwsOdAhSSR+oJwQvfoRCQtfPLvIaoDODCpfUziyK
         Yiy7E9+wL0HAGaUVYlRqJnfoc+pH0IMkaNRgCuwIauO11WDc9/csekC/xxpa1T8EI5gg
         ci8UNqe8Nc5wvbJQO6b1gOSQQ93kiV0Q3UKbJ0FFnhnVAHNFInIR+yCnuLhzt3v9fdVs
         CC5w==
X-Gm-Message-State: AOAM5318ocjfVKiTJyxrFNU4cMfNUMwxb2moJR6HiKJgFdPjPzzD+7tX
        ykDFebNYKVDCHalcnMwF/2aghaZJMR+tf0Rc
X-Google-Smtp-Source: ABdhPJxhlAIPscjRpWpVjzoXHtSWBo8qLyXQ/qm3Due4j4LLcoACAmI6UJRqRG8Bra8JS9XRfavChw==
X-Received: by 2002:a63:5502:: with SMTP id j2mr46969871pgb.197.1641359004079;
        Tue, 04 Jan 2022 21:03:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u188sm2270397pfb.175.2022.01.04.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 21:03:23 -0800 (PST)
Message-ID: <61d5269b.1c69fb81.293c8.6684@mx.google.com>
Date:   Tue, 04 Jan 2022 21:03:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc8-88-g99ae9b78c633
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 413 runs,
 3 regressions (v5.16-rc8-88-g99ae9b78c633)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 413 runs, 3 regressions (v5.16-rc8-88-g99ae9b7=
8c633)

Regressions Summary
-------------------

platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b     | arm    | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

qemu_x86_64         | x86_64 | lab-cip       | gcc-10   | x86_64_defcon...e=
book+amdgpu | 1          =

r8a77950-salvator-x | arm64  | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc8-88-g99ae9b78c633/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc8-88-g99ae9b78c633
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      99ae9b78c63395f986f1d9fd73f258139c8ec7bc =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b     | arm    | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d4fa492411a5049cef6742

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d4fa492411a5049cef6=
743
        failing since 56 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
qemu_x86_64         | x86_64 | lab-cip       | gcc-10   | x86_64_defcon...e=
book+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61d4e721970898dde8ef676e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ci=
p/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ci=
p/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d4e721970898dde8ef6=
76f
        new failure (last pass: v5.16-rc8-76-gf3c3fc1577d6) =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x | arm64  | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d4ec5ac87960314bef6760

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-8=
8-g99ae9b78c633/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d4ec5ac87960314bef6=
761
        new failure (last pass: v5.16-rc8-76-gf3c3fc1577d6) =

 =20
