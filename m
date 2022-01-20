Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3E54948DC
	for <lists+linux-next@lfdr.de>; Thu, 20 Jan 2022 08:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbiATHuI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Jan 2022 02:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbiATHuF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jan 2022 02:50:05 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB919C061574
        for <linux-next@vger.kernel.org>; Wed, 19 Jan 2022 23:50:05 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso1632983pjv.1
        for <linux-next@vger.kernel.org>; Wed, 19 Jan 2022 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jazM6/B22DgK+u+E0v6rNgO9+jJa4N+1JXr5twuWuZo=;
        b=qo+a+dEViu3QiHwiSvv9RnSO+rcUvSVBnBk120neZUko24rqD5AioX2r4jRe2/eIJM
         P6WrXXqi63Y4GEsCCyf6YZu6NBq03hPssm8q/s4jkynLdEUwM70B4JeeqSqlhGqep1Zv
         LTSo5gyno4hwV7Z+kpT7ITxApkZTphSDmJ5j3NeqtQlV1krA7IHc9WGXghjuHSW+mEeF
         NQMHDBcAtPMZM+4VdakHRnIc4VDdeAxQfUuQ9eXSLfNZHWbsHip5sUhDrDMpdtGRGBat
         Ey3o2ZGudjJ7J2ZKe5SCRr8Y+LO0fzILn721yUU/fYM/doejQV7S6m2Z1EluZj/2mLXW
         M9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jazM6/B22DgK+u+E0v6rNgO9+jJa4N+1JXr5twuWuZo=;
        b=IdldW+AjWKtB5i+TRT9OEM+yeT+KYNd4tj398/IV4pA5we+ohl1htMqOOpkDK8yY0A
         EwWjAv0dQQrV/mU1ZgWQlrUDTXmhiBK1n2jufLxkwm5fEXl+2UOtmNrmn303PgIY1Gr+
         XWcLMM9/0X8jybTaH4owKfe4ZYp49pVwsh+x/ZObhPW4nHrdDxJoaj/IOkTx8GhkcfSL
         MUrpCtq+9nb7kmYEMJXZJUG7APFGcISMsv6HDtmsBIyeq3VNHAuZLir0gQs6TLN2uGqq
         gCBp4Ezt6o9tcPdk81gGDu+tsVXVHeEBalEhO7hzusDACCeGg984Pv4amQMxiY11ZCeK
         RtBQ==
X-Gm-Message-State: AOAM532vZ3DXwvOII/jsSak0GCQdCPRu+OzJAuTOjQ1MPq99mmaWyFJj
        gKkFGGD4uSCObnpKq1HmnSxfZ0eT2w/98Bi4
X-Google-Smtp-Source: ABdhPJyKPZ0qyLQwcwgnKfTKVid7P1K5MQnY3UrVMUTXEPngRX4mkXT4C26zp/v6aMBoT/USCYInvg==
X-Received: by 2002:a17:902:7602:b0:14a:4a48:cabd with SMTP id k2-20020a170902760200b0014a4a48cabdmr37377508pll.121.1642665004363;
        Wed, 19 Jan 2022 23:50:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y18sm1920246pfa.132.2022.01.19.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 23:50:03 -0800 (PST)
Message-ID: <61e9142b.1c69fb81.a6443.66f2@mx.google.com>
Date:   Wed, 19 Jan 2022 23:50:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-11408-ga51e80162547
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 577 runs,
 37 regressions (v5.16-11408-ga51e80162547)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 577 runs, 37 regressions (v5.16-11408-ga51e801=
62547)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2711-rpi-4-b        | arm64 | lab-linaro-lkft | gcc-10   | defconfig+cry=
pto             | 1          =

bcm2836-rpi-2-b        | arm   | lab-collabora   | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

da850-lcdk             | arm   | lab-baylibre    | gcc-10   | davinci_all_d=
efconfig        | 1          =

imx6ul-14x14-evk       | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig+ima=
                | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig    =
                | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig+cry=
pto             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig+ima=
                | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
                | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig+ima=
                | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
                | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =

meson-g12b-odroid-n2   | arm64 | lab-baylibre    | gcc-10   | defconfig+ima=
                | 2          =

meson-gxbb-p200        | arm64 | lab-baylibre    | gcc-10   | defconfig    =
                | 1          =

r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+ima=
                | 2          =

r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+arm=
64-chromebook   | 2          =

r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig    =
                | 2          =

r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+cry=
pto             | 2          =

zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+ima=
                | 1          =

zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+arm=
64-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig    =
                | 1          =

zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-11408-ga51e80162547/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-11408-ga51e80162547
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a51e801625473dca6262fc11d882ef31c1218529 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2711-rpi-4-b        | arm64 | lab-linaro-lkft | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8e136c876ee3d04abbd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8e136c876ee3d04abb=
d16
        new failure (last pass: v5.16-10813-g0e10d8ba146c) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora   | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8df9bf7c3f18014abbd51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8df9bf7c3f18014abb=
d52
        failing since 71 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
da850-lcdk             | arm   | lab-baylibre    | gcc-10   | davinci_all_d=
efconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8daba6c05b0a5d0abbdb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8daba6c05b0a5d0abb=
db8
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8dc85e6de36f71eabbda8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8dc85e6de36f71eabb=
da9
        new failure (last pass: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8d865c41db83027abbd45

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8d865c41db83=
027abbd4c
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T03:34:39.016482  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.688393] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-20T03:34:39.016779  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8d865c41db83=
027abbd4d
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:34:39.018225  kern  :alert : Mem abort info:
    2022-01-20T03:34:39.018677  kern  :alert :   ESR =3D 0x96000006
    2022-01-20T03:34:39.019146  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:34:39.019467  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:34:39.019770  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T03:34:39.020015  kern  :alert :<8>[   14.716323] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-20T03:34:39.020304     FSC =3D 0x06: level 2 translatio<8>[   1=
4.728748] <LAVA_SIGNAL_ENDRUN 0_dmesg 800910_1.5.2.4.1>
    2022-01-20T03:34:39.020679  n fault
    2022-01-20T03:34:39.021048  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dd29f6398fde1fabbd8c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8dd29f6398fd=
e1fabbd93
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T03:54:53.478170  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.751250] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-20T03:54:53.478375  0000
    2022-01-20T03:54:53.478501  kern  :alert : Mem abort info:
    2022-01-20T03:54:53.478619  kern  :alert :   ESR =3D 0x96000006
    2022-01-20T03:54:53.478730  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:54:53.478854  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8dd29f6398fd=
e1fabbd94
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:54:53.479683  kern  :alert :   EA =3D<8>[   14.779038] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D2>
    2022-01-20T03:54:53.479837   0, S1PTW =3D 0   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp         | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dd909b381cabebabbd43

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8dd909b381ca=
bebabbd4a
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8dd909b381ca=
bebabbd4b
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:56:44.692273  at virtual address 0000000000000000
    2022-01-20T03:56:44.692571  kern  :alert : Mem abort info:
    2022-01-20T03:56:44.692730  kern  :alert :   ESR =3D 0x96000006
    2022-01-20T03:56:44.693083  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:56:44.693272  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:56:44.693462  kern  :alert :   EA<8>[   14.667833] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-20T03:56:44.693651   =3D 0, S1PTW =3D 0
    2022-01-20T03:56:44.693834  kern  :alert :  <8>[   14.680513] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 800957_1.5.2.4.1>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8d8fd45ad37bd88abbd4e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8d8fd45ad37bd88abbd8f
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:37:12.094845  /lava-80842/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8d8fd45ad37bd88abbd90
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:37:12.098062  <8>[   16.939074] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:37:13.144707  /lava-80842/1/../bin/lava-test-case
    2022-01-20T03:37:13.145059  <8>[   17.958240] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-20T03:37:13.145268  /lava-80842/1/../bin/lava-test-case
    2022-01-20T03:37:13.145459  <8>[   17.974192] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dcd2ccc2974f5aabbd62

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8dcd2ccc2974f5aabbda3
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:53:31.110193  /lava-80850/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8dcd2ccc2974f5aabbda4
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:53:31.113432  <8>[   16.942325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:53:32.159216  /lava-80850/1/../bin/lava-test-case
    2022-01-20T03:53:32.161852  <8>[   17.961034] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-20T03:53:32.162181  /lava-80850/1/../bin/lava-test-case
    2022-01-20T03:53:32.162381  <8>[   17.976470] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-20T03:53:32.162578  /lava-80850/1/../bin/lava-test-case
    2022-01-20T03:53:32.162767  <8>[   17.992465] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-20T03:53:32.162955  /lava-80850/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dd22f6398fde1fabbd25

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8dd22f6398fde1fabbd66
        failing since 8 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:55:06.994238  /lava-80853/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8dd22f6398fde1fabbd67
        failing since 8 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:55:06.997436  <8>[   13.910883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:55:08.044771  /lava-80853/1/../bin/lava-test-case
    2022-01-20T03:55:08.045084  <8>[   14.930102] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8d8ad273b5c9c4cabbd55

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8d8ad273b5c9c4cabbd9d
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:35:54.975903  /lava-80843/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8d8ad273b5c9c4cabbd9e
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:35:54.979088  <8>[   13.491281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:35:56.027699  /lava-80843/1/../bin/lava-test-case
    2022-01-20T03:35:56.028097  <8>[   14.509906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-20T03:35:56.028355  /lava-80843/1/../bin/lava-test-case
    2022-01-20T03:35:56.028585  <8>[   14.527145] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dc349579dd15fbabbd34

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8dc359579dd15fbabbd7c
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:50:30.095770  /lava-80847/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8dc359579dd15fbabbd7d
        failing since 8 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:50:30.098926  <8>[   13.846475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:50:31.149836  /lava-80847/1/../bin/lava-test-case
    2022-01-20T03:50:31.150233  <8>[   14.865938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-20T03:50:31.150475  /lava-80847/1/../bin/lava-test-case
    2022-01-20T03:50:31.150702  <8>[   14.881942] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-20T03:50:31.150930  /lava-80847/1/../bin/lava-test-case
    2022-01-20T03:50:31.153159  <8>[   14.897979] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-20T03:50:31.153426  /lava-80847/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dcfa430584348cabbd1f

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e8dcfa430584348cabbd67
        failing since 8 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:54:26.419992  /lava-80852/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
8dcfa430584348cabbd68
        failing since 8 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-20T03:54:26.423575  <8>[   13.507170] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-20T03:54:27.472943  /lava-80852/1/../bin/lava-test-case
    2022-01-20T03:54:27.473222  <8>[   14.526376] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-20T03:54:27.473368  /lava-80852/1/../bin/lava-test-case
    2022-01-20T03:54:27.473504  <8>[   14.542356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-20T03:54:27.473639  /lava-80852/1/../bin/lava-test-case
    2022-01-20T03:54:27.473771  <8>[   14.558338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-20T03:54:27.473903  /lava-80852/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
meson-g12b-odroid-n2   | arm64 | lab-baylibre    | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8d79c278c0076ccabbd32

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-=
odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-=
odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8d79c278c007=
6ccabbd39
        new failure (last pass: v5.16-10644-g36cca0cb5eb5)
        12 lines

    2022-01-20T03:31:19.327071  kern  :alert : Mem abort inf<8>[   15.25842=
7] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8d79c278c007=
6ccabbd3a
        new failure (last pass: v5.16-10644-g36cca0cb5eb5)
        2 lines

    2022-01-20T03:31:19.328441  o:
    2022-01-20T03:31:19.328640  kern  :alert :   ESR =3D 0x96000006
    2022-01-20T03:31:19.328876  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:31:19.329075  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:31:19.329265  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T03:31:19.329430  kern  :alert :   FSC =3D<8>[   15.283682] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>
    2022-01-20T03:31:19.329590   0x06: leve<8>[   15.293053] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 1423376_1.5.2.4.1>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
meson-gxbb-p200        | arm64 | lab-baylibre    | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8ddc0174d83880cabbd32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8ddc0174d83880cabb=
d33
        new failure (last pass: v5.16-10644-g36cca0cb5eb5) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8d92d62dbf8697cabbd74

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8d92d62dbf86=
97cabbd7a
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:37:55.254774  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-20T03:37:55.254922  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-20T03:37:55.255053  kern  :alert : user pgtable: 4k pages<8>[  =
 16.200660] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-20T03:37:55.255139  , 48-bit VAs, pgdp=3D000000007f87f000
    2022-01-20T03:37:55.255220  ker<8>[   16.212646] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 605211_1.5.2.4.1>
    2022-01-20T03:37:55.255299  n  :alert : [0000000000000000] pgd=3D080000=
004f14d003, p4d=3D080000004f14d003, pud=3D080000004f14f003, pmd=3D000000000=
0000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8d92d62dbf86=
97cabbd7b
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T03:37:55.211868  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-20T03:37:55.211990  kern  :alert : Mem abort info:
    2022-01-20T03:37:55.212083  ker<8>[   16.159796] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-20T03:37:55.212170  n  :alert :   ESR =3D 0x96000006
    2022-01-20T03:37:55.212255  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:37:55.212362  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:37:55.212447  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T03:37:55.212528  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-20T03:37:55.212606  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+arm=
64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8db5c66e7d8d48eabbd7a

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a=
774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a=
774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8db5c66e7d8d=
48eabbd80
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:47:13.262858  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-20T03:47:13.263062  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-20T03:47:13.263180  kern  :alert : user pgtable: 4k pages<8>[  =
 16.636269] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-20T03:47:13.263273  , 48-bit VAs, pgdp=3D000000004f3e9000
    2022-01-20T03:47:13.263356  ker<8>[   16.648309] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 605235_1.5.2.4.1>
    2022-01-20T03:47:13.263439  n  :alert : [0000000000000000] pgd=3D080000=
004f39d003, p4d=3D080000004f39d003, pud=3D080000007f878003
    2022-01-20T03:47:13.263524  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8db5c66e7d8d=
48eabbd81
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T03:47:13.220335  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-20T03:47:13.220539  kern  :alert : Mem abort info:
    2022-01-20T03:47:13.220634  ker<8>[   16.595451] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-20T03:47:13.220721  n  :alert :   ESR =3D 0x96000006
    2022-01-20T03:47:13.220835  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:47:13.220920  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:47:13.221002  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T03:47:13.221080  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-20T03:47:13.221170  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8dc4c85bcb94699abbd34

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8dc4d85bcb94=
699abbd3a
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T03:51:18.980827  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-20T03:51:18.980956  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-20T03:51:18.981069  kern  :alert : user pgtable: 4k pages<8>[  =
 16.361669] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-20T03:51:18.981207  , 48-bit VAs, pgdp=3D000000004f3b5000
    2022-01-20T03:51:18.981313  ker<8>[   16.374017] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 605291_1.5.2.4.1>
    2022-01-20T03:51:18.981417  n  :alert : [0000000000000000] pgd=3D080000=
004f1bb003, p4d=3D080000004f1bb003, pud=3D080000004afa9003, pmd=3D000000000=
0000000
    2022-01-20T03:51:18.981503  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8dc4d85bcb94=
699abbd3b
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T03:51:18.937931  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-20T03:51:18.938136  kern  :alert : Mem abort info:
    2022-01-20T03:51:18.938228  ker<8>[   16.320842] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-20T03:51:18.938314  n  :alert :   ESR =3D 0x96000006
    2022-01-20T03:51:18.938398  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T03:51:18.938480  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T03:51:18.938559  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T03:51:18.938638  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-20T03:51:18.938715  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a774c0-ek874         | arm64 | lab-cip         | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e8df233533e2e1f7abbd11

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e8df233533e2e=
1f7abbd17
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-20T04:03:18.429154  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-20T04:03:18.429271  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-20T04:03:18.429362  kern  :alert : user pgtable: 4k pages<8>[  =
 15.985614] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-20T04:03:18.429450  , 48-bit VAs, pgdp=3D000000007f88f000
    2022-01-20T04:03:18.429532  ker<8>[   15.997756] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 605323_1.5.2.4.1>
    2022-01-20T04:03:18.429613  n  :alert : [0000000000000000] pgd=3D080000=
007f890003, p4d=3D080000007f890003, pud=3D080000007f891003, pmd=3D000000000=
0000000
    2022-01-20T04:03:18.429695  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e8df233533e2e=
1f7abbd18
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-20T04:03:18.385971  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-20T04:03:18.386082  kern  :alert : Mem abort info:
    2022-01-20T04:03:18.386171  ker<8>[   15.944555] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-20T04:03:18.386256  n  :alert :   ESR =3D 0x96000006
    2022-01-20T04:03:18.386337  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-20T04:03:18.386416  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-20T04:03:18.386492  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-20T04:03:18.386568  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-20T04:03:18.386642  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8d895273b5c9c4cabbd40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8d895273b5c9c4cabb=
d41
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+arm=
64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8dad9bce4400c40abbd52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8dad9bce4400c40abb=
d53
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8dd1d430584348cabbdd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8dd1d430584348cabb=
dda
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
zynqmp-zcu102          | arm64 | lab-cip         | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e8de74a37121f99eabbd2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-11408=
-ga51e80162547/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e8de74a37121f99eabb=
d30
        failing since 7 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
