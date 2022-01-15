Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C815248F5AC
	for <lists+linux-next@lfdr.de>; Sat, 15 Jan 2022 08:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiAOHdy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 Jan 2022 02:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiAOHdy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2022 02:33:54 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DA8C061574
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 23:33:54 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 128so4837855pfe.12
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 23:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QDcjoQwRTYsMtV0ggP/1WCXqjXVZ/eBSBKjfkuvAnLs=;
        b=iKZSKqZ6bq3ReONsKKgzpw24AyqdsAuskOoyrQJu7yXc8zPHBsSSI9VgYc+o3jf6E9
         4e4b46fR2/ppifsVhno2qSMn9JJ081cf/3w9dF9EqlXjG5m232gHa0NcVSlxzKCQFbSb
         5v1QycDe4sYyjGAp46dVfzVT+iwTuPvUcr2Ze46YtFOPstDb7jJbvVX7zf8V/dsG8iyT
         WdZ2Uwhj8h/HA1G+yn7l5UzeHWX7X1EL6uknaptVh8M9g8C3auGcW1iEiDbYHXAJ5ytB
         KivhgxUv7CyeT9k9bZuwcZ+uAiV9kegVAP3rJ+0QQErs/vQcJ+Ulb6C4/Ccrucof7dot
         tMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QDcjoQwRTYsMtV0ggP/1WCXqjXVZ/eBSBKjfkuvAnLs=;
        b=3Nd06k+x8x2lHTYITnHTPR/o9jwAOwmRQUHYp4xf8r+tw9mARDZSs1CrAt/KK2rU1T
         xk/J0+hmkJ9E7S3gF8CDD/mdUl/Sh4l+IjnVCh74/Iy/nYepUKN1JzM0CWyzmeEdv5Yb
         Hy2AmimxcVEW9j/ui2tv15q9GXLndGGG/5S8/ND08v0DljolTDIcIyuwWL8b2HrEXnFD
         W5B0/VI+baMPrZMn4ICrn93+pb01JELz40MJEltQe6qyA2RKTc2XM74zZ9YBJp0kI0ZK
         rtYhVDFoBSVXdxXma6i83Z78mS5TNna2bhD5EE2uzQu4Y208F3QOapO2GbfagE701ZDb
         hM2g==
X-Gm-Message-State: AOAM530OHI3mo85CUbgEK5C+7vn4yeZwe2kERx8OknlpYdSRoygNJRiu
        1b3yEdfee7C5JhYyIoWzTin8LRKhTbXcT+jH
X-Google-Smtp-Source: ABdhPJzqHqaIXgofnXQzUz2tgZMCvFxLAIgHh6L4HKtXnIaDVZMtlC1vTA7bs0sbxKzJMUzUKwaMbA==
X-Received: by 2002:aa7:8084:0:b0:4bc:9423:96b2 with SMTP id v4-20020aa78084000000b004bc942396b2mr12265486pff.45.1642232033447;
        Fri, 14 Jan 2022 23:33:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ne14sm12294151pjb.19.2022.01.14.23.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 23:33:53 -0800 (PST)
Message-ID: <61e278e1.1c69fb81.87803.1b79@mx.google.com>
Date:   Fri, 14 Jan 2022 23:33:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-9796-g01303ef9c816
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 529 runs,
 25 regressions (v5.16-9796-g01303ef9c816)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 529 runs, 25 regressions (v5.16-9796-g01303ef9=
c816)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-pitx-imx8m     | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-9796-g01303ef9c816/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-9796-g01303ef9c816
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      01303ef9c8166820282facb184f0638df04f0274 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e242e8a7a5ec88a6ef6775

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e242e8a7a5ec88a6ef6=
776
        failing since 66 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e23d9d46e0053aebef6759

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e23d9d46e0053aebef6=
75a
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e23de69187e10c36ef6751

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e23de69187e10c36ef6796
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:21:54.610664  /lava-78567/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
23de69187e10c36ef6797
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:21:54.615798  <8>[   16.894471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:21:55.659623  /lava-78567/1/../bin/lava-test-case
    2022-01-15T03:21:55.659914  <8>[   17.913206] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-15T03:21:55.660062  /lava-78567/1/../bin/lava-test-case
    2022-01-15T03:21:55.660202  <8>[   17.928535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-15T03:21:55.660342  /lava-78567/1/../bin/lava-test-case
    2022-01-15T03:21:55.660477  <8>[   17.944508] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-15T03:21:55.660613  /lava-78567/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e23f8f923c80e6d0ef6761

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e23f8f923c80e6d0ef67a6
        failing since 2 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281) =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
23f8f923c80e6d0ef67a7
        failing since 2 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e2408136e90dc9adef6763

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e2408136e90dc9adef67a8
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:32:58.590990  /lava-78580/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
2408136e90dc9adef67a9
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:32:58.593805  <8>[   18.054148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:32:59.639651  /lava-78580/1/../bin/lava-test-case
    2022-01-15T03:32:59.640029  <8>[   19.072805] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e243b1a24f5c7ba6ef6791

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e243b1a24f5c7ba6ef67d6
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:46:36.295434  /lava-78593/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
243b1a24f5c7ba6ef67d7
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:46:36.298628  <8>[   17.214569] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:46:37.347101  /lava-78593/1/../bin/lava-test-case
    2022-01-15T03:46:37.347485  <8>[   18.233898] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-15T03:46:37.347725  /lava-78593/1/../bin/lava-test-case
    2022-01-15T03:46:37.347949  <8>[   18.249818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-15T03:46:37.348173  /lava-78593/1/../bin/lava-test-case
    2022-01-15T03:46:37.348390  <8>[   18.267400] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-15T03:46:37.348607  /lava-78593/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e23f00f832c00a1cef6769

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e23f00f832c00a1cef6=
76a
        new failure (last pass: v5.16-8869-ge7a3a88568d5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e23e72e6a2eb17e1ef676e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e23e73e6a2eb17e1ef67bb
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:24:20.586204  /lava-78566/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
23e73e6a2eb17e1ef67bc
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:24:20.589500  <8>[   13.539719] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:24:21.636150  /lava-78566/1/../bin/lava-test-case
    2022-01-15T03:24:21.636550  <8>[   14.558366] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-15T03:24:21.636795  /lava-78566/1/../bin/lava-test-case
    2022-01-15T03:24:21.637021  <8>[   14.574369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e23f8d23feb67c83ef6765

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e23f8e23feb67c83ef67b1
        failing since 2 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-15T03:28:59.808754  /lava-78575/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
23f8e23feb67c83ef67b2
        failing since 2 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-15T03:28:59.811944  <8>[   13.529572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:29:00.859636  /lava-78575/1/../bin/lava-test-case
    2022-01-15T03:29:00.860094  <8>[   14.549358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-15T03:29:00.860349  /lava-78575/1/../bin/lava-test-case
    2022-01-15T03:29:00.860597  <8>[   14.564667] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-15T03:29:00.860833  /lava-78575/1/../bin/lava-test-case
    2022-01-15T03:29:00.861061  <8>[   14.580665] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-15T03:29:00.861290  /lava-78575/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e241a80ba3b7d8c0ef6773

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e241a80ba3b7d8c0ef67bf
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:38:06.410317  /lava-78585/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
241a80ba3b7d8c0ef67c0
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:38:06.413488  <8>[   13.451511] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:38:07.462423  /lava-78585/1/../bin/lava-test-case
    2022-01-15T03:38:07.462834  <8>[   14.470136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e24247c65a8ebbc6ef678e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e24247c65a8ebbc6ef67da
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:40:30.912780  /lava-78588/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
24247c65a8ebbc6ef67db
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-15T03:40:30.915888  <8>[   13.580174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-15T03:40:31.962484  /lava-78588/1/../bin/lava-test-case
    2022-01-15T03:40:31.962774  <8>[   14.598830] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-15T03:40:31.962928  /lava-78588/1/../bin/lava-test-case
    2022-01-15T03:40:31.965603  <8>[   14.614756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-15T03:40:31.965795  /lava-78588/1/../bin/lava-test-case
    2022-01-15T03:40:31.965939  <8>[   14.630682] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-15T03:40:31.966082  /lava-78588/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e240bd8bb47092e5ef6749

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e240bd8bb47092e5ef6=
74a
        new failure (last pass: v5.16-8869-ge7a3a88568d5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e23edef832c00a1cef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e23edef832c00a1cef6=
74b
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e24046e77a6cd381ef6782

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e24046e77a6cd381ef6=
783
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e2419a6b103676b4ef675c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e2419a6b103676b4ef6=
75d
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e24212fc341a0e3fef676e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e24212fc341a0e3fef6=
76f
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e2433e11475b21f2ef675f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9796-=
g01303ef9c816/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e2433e11475b21f2ef6=
760
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
