Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396A347C6B9
	for <lists+linux-next@lfdr.de>; Tue, 21 Dec 2021 19:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238818AbhLUSkH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Dec 2021 13:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbhLUSkG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2021 13:40:06 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBCBC061574
        for <linux-next@vger.kernel.org>; Tue, 21 Dec 2021 10:40:06 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id s15so70758pfk.6
        for <linux-next@vger.kernel.org>; Tue, 21 Dec 2021 10:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sogEr75QeW7hp1ULIHoZ0xXQv4goyM3HoiDLj8Qn808=;
        b=50YUtr/fgJlBHi+5JjJjC0MP5OHNmkvUN5aVGStsdb2mmu967mRLedxadofMGBxG9r
         YLOahPsrpR2278rb0s1qlr5ptVCgf4RBX00K29r/CuNcOmsgMJMsxAb7LZBI3YSqANJA
         yH3r7UFpH9fzvV8qcqOxU+t3JqmJJsXfPKX0SszHizjbhLu9XMJHzu2gnYdiaYhElTuW
         fHmFOJyqgT6K5trvpUHvV3KYeCImuau5xCcqE1aEMjjxXD//QzpBt/pjfuI1/mcSDgJq
         nh3jZAj6QzzyLRfsTu6o6SDBtBEkAPVUPeIdR5FuNJyEJGRJ40dNhl8k6iCsS3xJ+G7T
         2uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sogEr75QeW7hp1ULIHoZ0xXQv4goyM3HoiDLj8Qn808=;
        b=uSOubCL6J8Td1CGFETg/ZVhUQv68tetI4ZjlwdTr5zZ9hbf4nRtBcgUA4ABIC3Mdte
         z+LgWsXu7XJWSW+mqwpYm3n4boLfXpvXazYNWAdT6NCDSgfUHOZGwfymOPDU3NK3LZoy
         RnOLOG3ECixd7VkwZ56bkvf/eFbMFZImSVqVH8GFu3hPqjSsecPcq1YD4PO7Yc2Y0a2I
         01PWItZMcw6BY7Y/IeI3y+J+Q1CbZLDmZBY7kHyn5LFK6+KBQxu6NeFUG/4jk0rYb2S7
         tsAxv6em3b/xI1Ge3aYWlWCRF6OtLAOwy+KTNfGNI1n3etIGIYORsw2Jt+5+2grWwGMR
         fV7Q==
X-Gm-Message-State: AOAM5305xFIIfF/zk9uOvVJjtQRLYtRxCGVwY6p2F2FCVBPEzu64RGKG
        P+59obnXsbmzIVIYg/AD96qyXXehJrqLl6c3
X-Google-Smtp-Source: ABdhPJyZZmZ92ZqtID2aCX9I8lyV9c4XT5g/EzVjLV+GpTH3NITpJ7AQ08JDLDNYtuoNaz3gLUqCzA==
X-Received: by 2002:a62:830e:0:b0:4b1:78a:d4f with SMTP id h14-20020a62830e000000b004b1078a0d4fmr4574497pfe.52.1640112005125;
        Tue, 21 Dec 2021 10:40:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u10sm15565794pfm.58.2021.12.21.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 10:40:04 -0800 (PST)
Message-ID: <61c21f84.1c69fb81.59e2f.b617@mx.google.com>
Date:   Tue, 21 Dec 2021 10:40:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211221
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 684 runs, 38 regressions (next-20211221)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 684 runs, 38 regressions (next-20211221)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =

da850-lcdk               | arm    | lab-baylibre  | gcc-10   | multi_v5_def=
config           | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | clang-13 | x86_64_defco=
nfig             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211221/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211221
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2850c2311ef4bf30ae8dd8927f0f66b026ff08fb =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e5e8826a5423fa39712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e5e8826a5423fa397=
12f
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | multi_v5_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e444c9b4e75faf397126

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e444c9b4e75faf397=
127
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e618a28344d16c39711e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e618a28344d16c397163
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:34:45.645650  /lava-70569/1/../bin/lava-test-case
    2021-12-21T14:34:45.646821  <8>[   18.121362] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e618a28344d16c397164
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:34:46.697658  /lava-70569/1/../bin/lava-test-case
    2021-12-21T14:34:46.698414  <8>[   19.140929] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:34:46.698724  /lava-70569/1/../bin/lava-test-case
    2021-12-21T14:34:46.698966  <8>[   19.157036] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:34:46.699220  /lava-70569/1/../bin/lava-test-case
    2021-12-21T14:34:46.699452  <8>[   19.173757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:34:46.699682  /lava-70569/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e7e409fc880e2039713c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e7e509fc880e20397181
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:42:37.423090  /lava-70577/1/../bin/lava-test-case
    2021-12-21T14:42:37.424279  <8>[   17.757360] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e7e509fc880e20397182
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:42:38.472832  /lava-70577/1/../bin/lava-test-case
    2021-12-21T14:42:38.473512  <8>[   18.776222] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:42:38.473782  /lava-70577/1/../bin/lava-test-case
    2021-12-21T14:42:38.474021  <8>[   18.791633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:42:38.474260  /lava-70577/1/../bin/lava-test-case
    2021-12-21T14:42:38.474488  <8>[   18.807619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:42:38.474717  /lava-70577/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e26cac9ad0cf7a39712d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e26cac9ad0cf7a397181
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:18:58.871310  /lava-70554/1/../bin/lava-test-case
    2021-12-21T14:18:58.872492  <8>[   18.073482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e26cac9ad0cf7a397182
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:18:59.925663  /lava-70554/1/../bin/lava-test-case
    2021-12-21T14:18:59.926076  <8>[   19.093234] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:18:59.926335  /lava-70554/1/../bin/lava-test-case
    2021-12-21T14:18:59.926573  <8>[   19.110197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:18:59.926997  /lava-70554/1/../bin/lava-test-case
    2021-12-21T14:18:59.927235  <8>[   19.126838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:18:59.927471  /lava-70554/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e3ac7cf612539439712d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e3ac7cf6125394397172
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:24:37.871441  /lava-70560/1/../bin/lava-test-case
    2021-12-21T14:24:37.872466  <8>[   17.704341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e3ac7cf6125394397173
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:24:38.921733  /lava-70560/1/../bin/lava-test-case
    2021-12-21T14:24:38.922499  <8>[   18.723233] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:24:38.922814  /lava-70560/1/../bin/lava-test-case
    2021-12-21T14:24:38.923059  <8>[   18.739151] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:24:38.923312  /lava-70560/1/../bin/lava-test-case
    2021-12-21T14:24:38.923542  <8>[   18.755158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:24:38.923771  /lava-70560/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e3fc2caba057713971ad

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e3fc2caba057713971f2
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-21T14:25:51.968134  /lava-70561/1/../bin/lava-test-case
    2021-12-21T14:25:51.969316  <8>[   13.695461] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e3fc2caba057713971f3
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-21T14:25:53.018582  /lava-70561/1/../bin/lava-test-case
    2021-12-21T14:25:53.018994  <8>[   14.714525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:25:53.019250  /lava-70561/1/../bin/lava-test-case
    2021-12-21T14:25:53.019573  <8>[   14.730358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:25:53.019757  /lava-70561/1/../bin/lava-test-case
    2021-12-21T14:25:53.019951  <8>[   14.746337] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:25:53.020125  /lava-70561/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e4d8ef8ac1228f39712d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e4d8ef8ac1228f397172
        new failure (last pass: next-20211216)

    2021-12-21T14:29:19.247715  /lava-70565/1/../bin/lava-test-case
    2021-12-21T14:29:19.248888  <8>[   18.588770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e4d8ef8ac1228f397173
        new failure (last pass: next-20211216)

    2021-12-21T14:29:20.299904  /lava-70565/1/../bin/lava-test-case
    2021-12-21T14:29:20.300592  <8>[   19.608564] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:29:20.300858  /lava-70565/1/../bin/lava-test-case
    2021-12-21T14:29:20.301102  <8>[   19.625635] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:29:20.301341  /lava-70565/1/../bin/lava-test-case
    2021-12-21T14:29:20.301571  <8>[   19.641627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:29:20.301801  /lava-70565/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e78005caf29c6839712c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e78105caf29c68397171
        new failure (last pass: next-20211216)

    2021-12-21T14:40:43.680018  /lava-70575/1/../bin/lava-test-case
    2021-12-21T14:40:43.681234  <8>[   17.361521] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e78105caf29c68397172
        new failure (last pass: next-20211216)

    2021-12-21T14:40:44.732890  /lava-70575/1/../bin/lava-test-case
    2021-12-21T14:40:44.733200  <8>[   18.381484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:40:44.733369  /lava-70575/1/../bin/lava-test-case
    2021-12-21T14:40:44.733527  <8>[   18.398600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:40:44.733683  /lava-70575/1/../bin/lava-test-case
    2021-12-21T14:40:44.733832  <8>[   18.414499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:40:44.734050  /lava-70575/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e604b3a5aec88b397122

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e604b3a5aec88b39716e
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:34:22.375025  /lava-70571/1/../bin/lava-test-case
    2021-12-21T14:34:22.376214  <8>[   13.557214] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e604b3a5aec88b39716f
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:34:23.427542  /lava-70571/1/../bin/lava-test-case
    2021-12-21T14:34:23.428187  <8>[   14.576430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:34:23.428453  /lava-70571/1/../bin/lava-test-case
    2021-12-21T14:34:23.428697  <8>[   14.593143] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:34:23.428941  /lava-70571/1/../bin/lava-test-case
    2021-12-21T14:34:23.429174  <8>[   14.610262] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:34:23.429406  /lava-70571/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e7f964cf2258b4397126

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e7f964cf2258b4397172
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:42:49.806551  /lava-70578/1/../bin/lava-test-case
    2021-12-21T14:42:49.807723  <8>[   13.482079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e7f964cf2258b4397173
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:42:50.857589  /lava-70578/1/../bin/lava-test-case
    2021-12-21T14:42:50.858345  <8>[   14.500839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:42:50.858659  /lava-70578/1/../bin/lava-test-case
    2021-12-21T14:42:50.858904  <8>[   14.516746] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:42:50.859157  /lava-70578/1/../bin/lava-test-case
    2021-12-21T14:42:50.859384  <8>[   14.534367] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:42:50.859613  /lava-70578/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e26fac9ad0cf7a397190

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e26fac9ad0cf7a3971dc
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:18:58.620141  /lava-70556/1/../bin/lava-test-case
    2021-12-21T14:18:58.621352  <8>[   13.605657] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e26fac9ad0cf7a3971dd
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:18:59.674926  /lava-70556/1/../bin/lava-test-case
    2021-12-21T14:18:59.675618  <8>[   14.624975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:18:59.675911  /lava-70556/1/../bin/lava-test-case
    2021-12-21T14:18:59.676154  <8>[   14.641368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:18:59.676392  /lava-70556/1/../bin/lava-test-case
    2021-12-21T14:18:59.676621  <8>[   14.660207] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:18:59.676849  /lava-70556/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e398a4568fb61439711e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e398a4568fb61439716a
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:24:15.653857  /lava-70559/1/../bin/lava-test-case
    2021-12-21T14:24:15.655006  <8>[   13.451166] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e398a4568fb61439716b
        failing since 0 day (last pass: next-20211216, first fail: next-202=
11220)

    2021-12-21T14:24:16.706156  /lava-70559/1/../bin/lava-test-case
    2021-12-21T14:24:16.706883  <8>[   14.469776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:24:16.707191  /lava-70559/1/../bin/lava-test-case
    2021-12-21T14:24:16.707438  <8>[   14.486918] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:24:16.707693  /lava-70559/1/../bin/lava-test-case
    2021-12-21T14:24:16.707954  <8>[   14.504073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:24:16.708190  /lava-70559/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e3e82caba05771397124

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e3e82caba05771397170
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-21T14:25:33.366328  /lava-70562/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e3e82caba05771397171
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-21T14:25:33.368056  <8>[   13.431875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2021-12-21T14:25:34.416881  /lava-70562/1/../bin/lava-test-case
    2021-12-21T14:25:34.417531  <8>[   14.451945] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:25:34.417805  /lava-70562/1/../bin/lava-test-case
    2021-12-21T14:25:34.418053  <8>[   14.467755] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:25:34.418297  /lava-70562/1/../bin/lava-test-case
    2021-12-21T14:25:34.418570  <8>[   14.483723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:25:34.418809  /lava-70562/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e4b0f249dec978397172

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e4b0f249dec9783971be
        new failure (last pass: next-20211216)

    2021-12-21T14:28:56.766916  /lava-70567/1/../bin/lava-test-case
    2021-12-21T14:28:56.768009  <8>[   13.490065] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e4b0f249dec9783971bf
        new failure (last pass: next-20211216)

    2021-12-21T14:28:57.817238  /lava-70567/1/../bin/lava-test-case
    2021-12-21T14:28:57.817669  <8>[   14.508789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:28:57.817946  /lava-70567/1/../bin/lava-test-case
    2021-12-21T14:28:57.818197  <8>[   14.524704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:28:57.818438  /lava-70567/1/../bin/lava-test-case
    2021-12-21T14:28:57.818668  <8>[   14.540783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:28:57.818902  /lava-70567/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c1e78405caf29c68397194

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c1e78405caf29c683971e0
        new failure (last pass: next-20211216)

    2021-12-21T14:40:55.921884  /lava-70576/1/../bin/lava-test-case
    2021-12-21T14:40:55.923068  <8>[   13.490509] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
1e78405caf29c683971e1
        new failure (last pass: next-20211216)

    2021-12-21T14:40:56.974904  /lava-70576/1/../bin/lava-test-case
    2021-12-21T14:40:56.975581  <8>[   14.509400] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-21T14:40:56.975860  /lava-70576/1/../bin/lava-test-case
    2021-12-21T14:40:56.976103  <8>[   14.524906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-21T14:40:56.976339  /lava-70576/1/../bin/lava-test-case
    2021-12-21T14:40:56.976566  <8>[   14.542296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-21T14:40:56.976794  /lava-70576/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | clang-13 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e6847d342c193b39713f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-minnowboard-turbot-E382=
6.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-minnowboard-turbot-E382=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e6847d342c193b397=
140
        new failure (last pass: next-20211217) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e0e3264da8424439715a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e0e3264da84244397=
15b
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e76b41ec162b8339714d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e76b41ec162b83397=
14e
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e986742030431f39712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e986742030431f397=
12c
        failing since 27 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e2cf18d7d2b6d3397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e2cf18d7d2b6d3397=
151
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e5625afb669740397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e5625afb669740397=
121
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e6cb8fcb564a13397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e6cb8fcb564a13397=
121
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c1e832b08e8e25ad397125

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211221/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c1e832b08e8e25ad397=
126
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
