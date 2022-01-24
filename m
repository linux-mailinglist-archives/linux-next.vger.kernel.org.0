Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDD6497728
	for <lists+linux-next@lfdr.de>; Mon, 24 Jan 2022 03:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240733AbiAXCKg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Jan 2022 21:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbiAXCKg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Jan 2022 21:10:36 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687FFC06173B
        for <linux-next@vger.kernel.org>; Sun, 23 Jan 2022 18:10:34 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id i1so4440115pla.0
        for <linux-next@vger.kernel.org>; Sun, 23 Jan 2022 18:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iac5Ta53seAOnUOs2/T0jgYBsRGfNS5jb1q6/LD6QUc=;
        b=orlLvgYadwd4pYPdqUMbydDiMZ5cXIZTU6bGblsX+FFVAYTdolklaZfx+aOss2uYp4
         3LouQvp6heHtbPFUuwPY9Izk/gesM1Ks938Y1tRJJeXQYtR/+oiVfxPN16V+hT/dVSgJ
         o0FuLHV3dAjUQ1R/Ysc33L5OWK9Jf6CLbRpdo55TXVdmqi2gyl7j9LrQCYpnpoF/LeoY
         BEGxKbqZ3czyo3SfIip955bXjdHIQynu9GfsSUVMTbLjJ0D450BP3LN6ptxhAj1uu2aY
         PVhWYKBWa5/jj5UZ+TAxvRicj7Tyc5ttjuH5d8FbyDdm2lDCxELcewpQSrPo2QmJzh/9
         XByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iac5Ta53seAOnUOs2/T0jgYBsRGfNS5jb1q6/LD6QUc=;
        b=orbqIUWsD5lp/DduOGTTczVTADqSdBE+GJmbeA4NBUK5kiDsBt3nVwTlpVl4CMrLHo
         9QYXkMdp+nO16ELX70t8KoWapAs9A6MILv6gC9kW5zPeMgFcao8XGxuQSaB5Q4wAJX7D
         0i5lByKqzUcXpFOT77KIig6gDijQ3Amy3cUHeddHDuXmPkqUndwdku44m77MjCDPY9NL
         6ZTr7Y3m3WfbrVZCy9nP4a8Gdi4anTL49K0wv+tydZICR/m0qDhx9u982Fu5QAavXBNL
         gSY4X6cMnBhfxp3iMVI5s5rSx5vA0XdEi54dRCPzaqrqsz+kavjsnzzNE9Y2heHjsQFG
         YkiA==
X-Gm-Message-State: AOAM530DYQ+Ned9bfil6WK1xr1EkBfMIdevACEFvzDjwp5hhGGn/uK2y
        9LSQmQ4BizWdViO57oO9vV+q+tR6vK9SHYfu
X-Google-Smtp-Source: ABdhPJy03RNitKPcKLRn5DqGWtfKNCpqiZ3StZSM5K0DbHp4/wCJFap5d+7LDbzLbhBYSOu4GKY5EA==
X-Received: by 2002:a17:902:e74c:b0:14b:409e:400e with SMTP id p12-20020a170902e74c00b0014b409e400emr5466508plf.61.1642990233183;
        Sun, 23 Jan 2022 18:10:33 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q7sm13035159pfs.32.2022.01.23.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:10:32 -0800 (PST)
Message-ID: <61ee0a98.1c69fb81.d3629.5589@mx.google.com>
Date:   Sun, 23 Jan 2022 18:10:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-180-g86539e2bdb99
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 467 runs,
 23 regressions (v5.17-rc1-180-g86539e2bdb99)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 467 runs, 23 regressions (v5.17-rc1-180-g86539=
e2bdb99)

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

imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc1-180-g86539e2bdb99/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc1-180-g86539e2bdb99
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      86539e2bdb992bb0fc6c7f23aab5a0d12a993384 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61edd0fd38bb81ba00abbd30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61edd0fd38bb81ba00abb=
d31
        failing since 74 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61edd16030feea1a19abbd2e

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61edd16030feea1=
a19abbd35
        new failure (last pass: v5.16-11577-gffd79fec234d)
        3 lines

    2022-01-23T22:05:59.747471  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-01-23T22:05:59.748278  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-01-23T22:05:59.748896  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-01-23T22:05:59.790424  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61edd24070e5e5f6acabbd37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61edd24070e5e5f6acabb=
d38
        failing since 3 days (last pass: v5.16-7998-gbeebf0a29205, first fa=
il: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61edcf69e2847b3e22abbd57

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61edcf69e2847b3=
e22abbd5e
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-23T21:57:46.416110  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.021974] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-23T21:57:46.416265  0000
    2022-01-23T21:57:46.416378  kern  :alert : Mem abort info:
    2022-01-23T21:57:46.416487  kern  :alert :   ESR =3D 0x96000006
    2022-01-23T21:57:46.416593  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61edcf69e2847b3=
e22abbd5f
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-23T21:57:46.417268  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-23T21:57:46.417374  kern  :alert :   EA<8>[   14.049323] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-23T21:57:46.417494   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61edcede264859e3b0abbd39

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61edcede264859e3b0abbd7a
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-23T21:54:54.285532  /lava-82693/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
dcede264859e3b0abbd7b
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-23T21:54:54.288915  <8>[   18.483823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-23T21:54:55.335778  /lava-82693/1/../bin/lava-test-case
    2022-01-23T21:54:55.336152  <8>[   19.502572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61edd03046a0296ee6abbd7e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61edd03046a0296ee6abbdbf
        failing since 11 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-23T22:00:54.396776  /lava-82703/1/../bin/lava-test-case
    2022-01-23T22:00:54.397151  <8>[   17.226832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
dd03046a0296ee6abbdc0
        failing since 11 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-23T22:00:55.437432  /lava-82703/1/../bin/lava-test-case
    2022-01-23T22:00:55.437694  <8>[   18.246014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-23T22:00:55.437841  /lava-82703/1/../bin/lava-test-case
    2022-01-23T22:00:55.437981  <8>[   18.261893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-23T22:00:55.438120  /lava-82703/1/../bin/lava-test-case
    2022-01-23T22:00:55.438255  <8>[   18.277793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-23T22:00:55.438389  /lava-82703/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61edcf8f070f46bf67abbd1e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61edcf8f070f46bf67abbd66
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-23T21:58:16.238318  /lava-82694/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
dcf8f070f46bf67abbd67
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-23T21:58:16.241444  <8>[   13.469806] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-23T21:58:17.288818  /lava-82694/1/../bin/lava-test-case
    2022-01-23T21:58:17.289101  <8>[   14.489535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-23T21:58:17.289248  /lava-82694/1/../bin/lava-test-case
    2022-01-23T21:58:17.289385  <8>[   14.504882] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-23T21:58:17.289523  /lava-82694/1/../bin/lava-test-case
    2022-01-23T21:58:17.289654  <8>[   14.520863] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-23T21:58:17.289787  /lava-82694/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61edcfde5581ac7992abbd42

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61edcfdf5581ac7992abbd8a
        failing since 11 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-23T21:59:52.627964  /lava-82701/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
dcfdf5581ac7992abbd8b
        failing since 11 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-23T21:59:52.631161  <8>[   13.478189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-23T21:59:53.678143  /lava-82701/1/../bin/lava-test-case
    2022-01-23T21:59:53.678553  <8>[   14.496885] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-23T21:59:53.678795  /lava-82701/1/../bin/lava-test-case
    2022-01-23T21:59:53.679021  <8>[   14.512771] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61edcf04b24524884eabbd39

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61edcf04b245248=
84eabbd3f
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-23T21:55:50.017733  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-23T21:55:50.017904  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-23T21:55:50.017999  kern  :alert : user pgtable: 4k pages<8>[  =
 15.900591] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-23T21:55:50.018088  , 48-bit VAs, pgdp=3D000000007f83d000
    2022-01-23T21:55:50.018172  ker<8>[   15.912803] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 609751_1.5.2.4.1>
    2022-01-23T21:55:50.018256  n  :alert : [0000000000000000] pgd=3D080000=
007f83e003, p4d=3D080000007f83e003, pud=3D080000007f83f003, pmd=3D000000000=
0000000
    2022-01-23T21:55:50.018339  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61edcf04b245248=
84eabbd40
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-23T21:55:49.974615  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-23T21:55:49.974751  kern  :alert : Mem abort info:
    2022-01-23T21:55:49.974845  ker<8>[   15.859684] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-23T21:55:49.974932  n  :alert :   ESR =3D 0x96000006
    2022-01-23T21:55:49.975019  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-23T21:55:49.975101  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-23T21:55:49.975181  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-23T21:55:49.975259  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-23T21:55:49.975337  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61edd25c222b927cc3abbd3c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/b=
aseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/b=
aseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61edd25c222b927=
cc3abbd42
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-23T22:10:24.143005  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-23T22:10:24.143147  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-23T22:10:24.143241  kern  :alert : user pgtable: 4k pages<8>[  =
 16.480805] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-23T22:10:24.143330  , 48-bit VAs, pgdp=3D000000004fb22000
    2022-01-23T22:10:24.143413  ker<8>[   16.492945] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 609776_1.5.2.4.1>
    2022-01-23T22:10:24.143496  n  :alert : [0000000000000000] pgd=3D080000=
004f338003, p4d=3D080000004f338003, pud=3D080000004fb24003, pmd=3D000000000=
0000000
    2022-01-23T22:10:24.143578  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61edd25c222b927=
cc3abbd43
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-23T22:10:24.049399  <8>[   16.400670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-23T22:10:24.105190  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-23T22:10:24.105303  kern  :alert : Mem abort info:
    2022-01-23T22:10:24.105396  ker<8>[   16.439816] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-23T22:10:24.105483  n  :alert :   ESR =3D 0x96000006
    2022-01-23T22:10:24.105568  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-23T22:10:24.105650  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-23T22:10:24.105731  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-23T22:10:24.105812  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-23T22:10:24.105892  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee023a4c0652473cabbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee023a4c0652473cabb=
d12
        failing since 9 days (last pass: v5.16-1778-g6927daa7c4fb, first fa=
il: v5.16-8869-ge7a3a88568d5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee02e45c2c4986f9abbd18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee02e45c2c4986f9abb=
d19
        failing since 11 days (last pass: v5.16-1778-g6927daa7c4fb, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0461656ea0a92cabbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0461656ea0a92cabb=
d17
        failing since 11 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee03ad4c002eec29abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee03ad4c002eec29abb=
d17
        failing since 11 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61edcfa4949c67d6baabbd4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61edcfa4949c67d6baabb=
d4b
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61edd10cf426f6dfcaabbd2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-1=
80-g86539e2bdb99/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61edd10cf426f6dfcaabb=
d2b
        failing since 10 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =20
