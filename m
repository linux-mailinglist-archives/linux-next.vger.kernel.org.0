Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8395248D133
	for <lists+linux-next@lfdr.de>; Thu, 13 Jan 2022 05:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbiAMEG2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jan 2022 23:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbiAMEG1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jan 2022 23:06:27 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183BBC06173F
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 20:06:27 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so16745428pja.1
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 20:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kKTZ/4fvm4Zr2e8wT2S7NhBmVd0GXlq10QKMBUkyLV0=;
        b=2tvDS4+3EROj7RHoN/Lig0Rml7JbnXw/pn5ca3//UbWx2nVNxRsBIJkVMXS8onHuKg
         ez3Gut7+3gx58tmxr9EUQWZOp70Vj9oTYfeBNKfT554HfklbRrZU/Sep1FKUij9WMDvE
         PIHV0TSAxBt3uk+yyihhN8MLSE73dKXblnYYMjvOhFLCE5taFKvtlxr/CAxeTMxyyf/s
         RYLhLMGriqPxRE2MtR9UMahRHkwNrOzScNZ78/2quwLNxpyxTKJViOoycjWTNrHoDc5l
         CVC8UNuYG/kEk8AxH/ki4s60n3VO9XUxTjE6BU509iQrRrgeqH4WXF3WLZv8s6PyPwMh
         NBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kKTZ/4fvm4Zr2e8wT2S7NhBmVd0GXlq10QKMBUkyLV0=;
        b=rlB7rzeElSjUFAhnjrBYbuGmsvayTPbRP+L/WCY3nL57WhoxmmCw80g7xjSGyBvGyt
         w6XxTDZKN+Y070/667ghGOiLJfJsdm5be8p8qiobkIOTTgX3oNlMaELfz7QHu+HR21kE
         HavnUp13XWGRf5cit9CwaVmJo8R9CwnmlfZi7FUVxf3GdLTHKRXXHcA8qU0HpPKNjy5u
         8cSLXlcvtWvCk6kqdLvawwxnXW0Mmn/LiCzMyqoqKkG22g7BtxI5MmY5SVJuMkflyXJB
         SNEewQgmRkKqWEtHfKFdZ9TVd0OM1x6JXtXkKScyqYFbiOOzXGyPuXhJn9j9hOrCgiw0
         tIfw==
X-Gm-Message-State: AOAM533SVVZRsdJYcqzrC2QCcXbbQgkKhOE61H6vqP6edDWU5SRd3YMh
        D3rSJmGMYDW2RmHaC7u6uXafFDeWIW2u+33QaFk=
X-Google-Smtp-Source: ABdhPJykt+gUYeRbjO0PiL2Hc1QP7NE1uaXuWeyzhsD+bjDxSOl/tS07NbC9qgFENGCLPJwOxMtSxQ==
X-Received: by 2002:a05:6a00:2151:b0:4a2:5c9a:f0a9 with SMTP id o17-20020a056a00215100b004a25c9af0a9mr2752859pfk.39.1642046785386;
        Wed, 12 Jan 2022 20:06:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o186sm1031731pfb.187.2022.01.12.20.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 20:06:25 -0800 (PST)
Message-ID: <61dfa541.1c69fb81.abcb5.3e9f@mx.google.com>
Date:   Wed, 12 Jan 2022 20:06:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-7998-gbeebf0a29205
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 660 runs,
 49 regressions (v5.16-7998-gbeebf0a29205)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 660 runs, 49 regressions (v5.16-7998-gbeebf0a2=
9205)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
da850-lcdk             | arm    | lab-baylibre  | gcc-10   | davinci_all_de=
fconfig        | 1          =

imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig     =
               | 2          =

imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+ima =
               | 2          =

imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+cryp=
to             | 2          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig     =
               | 2          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+ima =
               | 2          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+cryp=
to             | 2          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig     =
               | 2          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+ima =
               | 2          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+cryp=
to             | 2          =

meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-10   | defconfig+ima =
               | 1          =

qemu_x86_64            | x86_64 | lab-cip       | gcc-10   | x86_64_defconf=
ig+amdgpu      | 1          =

qemu_x86_64            | x86_64 | lab-cip       | gcc-10   | x86_64_defconf=
ig+crypto      | 1          =

r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig     =
               | 2          =

r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+ima =
               | 2          =

r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+arm6=
4-chromebook   | 2          =

r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+cryp=
to             | 2          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig           | 1          =

tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | tegra_defconfi=
g              | 1          =

zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig     =
               | 1          =

zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+ima =
               | 1          =

zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+arm6=
4-chromebook   | 1          =

zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+cryp=
to             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-7998-gbeebf0a29205/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-7998-gbeebf0a29205
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      beebf0a292053779ef65716002cd5e4045f6b366 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
da850-lcdk             | arm    | lab-baylibre  | gcc-10   | davinci_all_de=
fconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61df8f778f91801adfef6745

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df8f778f91801adfef6=
746
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6c1c7caa4dfdceef67b0

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df6c1c7caa4df=
dceef67b4
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:02:05.797563  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   16.388764] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-13T00:02:05.797822  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df6c1c7caa4df=
dceef67b5
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:02:05.798810  kern  :alert : Mem abort info:
    2022-01-13T00:02:05.798974  kern  :alert :   ESR =3D 0x96000006
    2022-01-13T00:02:05.799116  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:02:05.799303  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:02:05.799500  kern  :alert :   EA<8>[   16.415542] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-13T00:02:05.799718   =3D 0, S1PTW =3D 0   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6d1f8b6624f658ef6754

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df6d1f8b6624f=
658ef6758
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:06:39.624857  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.113402] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-13T00:06:39.625117  0000
    2022-01-13T00:06:39.625253  kern  :alert : Mem abort info:
    2022-01-13T00:06:39.625392  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df6d1f8b6624f=
658ef6759
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:06:39.626155  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:06:39.626271  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:06:39.626388  kern  :alert :   EA<8>[   14.140296] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-13T00:06:39.626490   =3D 0, S1PTW =3D 0
    2022-01-13T00:06:39.626589  kern  :alert :  <8>[   14.150791] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 797187_1.5.2.4.1>   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61df70e2c6ae6b6b19ef674d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/base=
line-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/base=
line-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df70e2c6ae6b6=
b19ef6751
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df70e2c6ae6b6=
b19ef6752
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:22:42.520659  at virtual address 0000000000000000
    2022-01-13T00:22:42.520927  kern  :alert : Mem abort info:
    2022-01-13T00:22:42.521096  kern  :alert :   ESR =3D 0x96000006
    2022-01-13T00:22:42.521472  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:22:42.521616  kern  :alert :   SET =3D <8>[   14.137662] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-01-13T00:22:42.521749  0, FnV =3D 0
    2022-01-13T00:22:42.521866  kern  :alert :   EA =3D<8>[   14.148336] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 797261_1.5.2.4.1>
    2022-01-13T00:22:42.521982   0, S1PTW =3D 0   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk        | arm64  | lab-nxp       | gcc-10   | defconfig+cryp=
to             | 2          =


  Details:     https://kernelci.org/test/plan/id/61df72553203caefc6ef67e0

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df72553203cae=
fc6ef67e4
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:28:32.878139  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.265797] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-13T00:28:32.878446  0000
    2022-01-13T00:28:32.878610  kern  :alert : Mem abort info:
    2022-01-13T00:28:32.878765  kern  :alert :   ESR =3D 0x96000006
    2022-01-13T00:28:32.878921  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:28:32.879079  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:28:32.879230  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df72553203cae=
fc6ef67e5
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:28:32.880182  kern  :alert :<8>[   14.293834] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6ae800a80a5080ef676e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df6ae800a80a5080ef67b3
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T23:57:01.079131  /lava-77512/1/../bin/lava-test-case
    2022-01-12T23:57:01.079424  <8>[   17.373294] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f6ae800a80a5080ef67b4
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T23:57:02.129929  /lava-77512/1/../bin/lava-test-case
    2022-01-12T23:57:02.130225  <8>[   18.393035] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T23:57:02.130377  /lava-77512/1/../bin/lava-test-case
    2022-01-12T23:57:02.130518  <8>[   18.409032] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-12T23:57:02.130660  /lava-77512/1/../bin/lava-test-case
    2022-01-12T23:57:02.130795  <8>[   18.427839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-12T23:57:02.130932  /lava-77512/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6cba67e3ab16cfef6756

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df6cba67e3ab16cfef679b
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:04:46.175657  /lava-77519/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f6cba67e3ab16cfef679c
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:04:46.181104  <8>[   18.401682] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:04:47.228989  /lava-77519/1/../bin/lava-test-case
    2022-01-13T00:04:47.229615  <8>[   19.421510] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:04:47.229876  /lava-77519/1/../bin/lava-test-case
    2022-01-13T00:04:47.230108  <8>[   19.438695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T00:04:47.230338  /lava-77519/1/../bin/lava-test-case
    2022-01-13T00:04:47.230560  <8>[   19.455851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T00:04:47.230780  /lava-77519/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61df70d637d0befa98ef67cb

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df70d637d0befa98ef6810
        failing since 0 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-13T00:22:24.341661  /lava-77528/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f70d637d0befa98ef6811
        failing since 0 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-13T00:22:24.345226  <8>[   17.714444] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:22:25.393856  /lava-77528/1/../bin/lava-test-case
    2022-01-13T00:22:25.394266  <8>[   18.733114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:22:25.394500  /lava-77528/1/../bin/lava-test-case
    2022-01-13T00:22:25.394712  <8>[   18.750288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+cryp=
to             | 2          =


  Details:     https://kernelci.org/test/plan/id/61df717df3ecdd5339ef6768

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df717df3ecdd5339ef67ad
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:25:06.731765  /lava-77533/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f717df3ecdd5339ef67ae
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:25:06.734844  <8>[   18.566826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:25:07.783208  /lava-77533/1/../bin/lava-test-case
    2022-01-13T00:25:07.783570  <8>[   19.586114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:25:07.783808  /lava-77533/1/../bin/lava-test-case
    2022-01-13T00:25:07.784031  <8>[   19.603128] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6b9bee4eea71c6ef6766

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df6b9cee4eea71c6ef67b2
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:00:01.543155  /lava-77516/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f6b9cee4eea71c6ef67b3
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:00:01.546267  <8>[   13.462158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:00:02.593867  /lava-77516/1/../bin/lava-test-case
    2022-01-13T00:00:02.594217  <8>[   14.480938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:00:02.594410  /lava-77516/1/../bin/lava-test-case
    2022-01-13T00:00:02.594637  <8>[   14.498040] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T00:00:02.594841  /lava-77516/1/../bin/lava-test-case
    2022-01-13T00:00:02.594999  <8>[   14.513844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T00:00:02.595192  /lava-77516/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6cb84c8bca6d75ef67e8

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df6cb84c8bca6d75ef6834
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:04:43.195414  /lava-77517/1/../bin/lava-test-case
    2022-01-13T00:04:43.219161  <8>[   13.478404] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f6cb84c8bca6d75ef6835
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:04:44.264821  /lava-77517/1/../bin/lava-test-case
    2022-01-13T00:04:44.265185  <8>[   14.497133] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:04:44.265422  /lava-77517/1/../bin/lava-test-case
    2022-01-13T00:04:44.265646  <8>[   14.513021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61df70aef688e20fd6ef675a

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df70aef688e20fd6ef67a6
        failing since 0 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-13T00:22:00.096887  /lava-77527/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f70aef688e20fd6ef67a7
        failing since 0 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-13T00:22:00.100069  <8>[   13.502371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:22:01.149857  /lava-77527/1/../bin/lava-test-case
    2022-01-13T00:22:01.150225  <8>[   14.521780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:22:01.150473  /lava-77527/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+cryp=
to             | 2          =


  Details:     https://kernelci.org/test/plan/id/61df71627a57e745f1ef67c9

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61df71627a57e745f1ef6815
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:25:01.170888  /lava-77529/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
f71627a57e745f1ef6816
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-13T00:25:01.174152  <8>[   13.430935] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T00:25:02.221413  /lava-77529/1/../bin/lava-test-case
    2022-01-13T00:25:02.221779  <8>[   14.450138] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T00:25:02.222022  /lava-77529/1/../bin/lava-test-case
    2022-01-13T00:25:02.222250  <8>[   14.466020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T00:25:02.222477  /lava-77529/1/../bin/lava-test-case
    2022-01-13T00:25:02.224059  <8>[   14.481988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T00:25:02.224367  /lava-77529/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61df6ed4ed66bb41aaef6761

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s9=
05d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s9=
05d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df6ed4ed66bb41aaef6=
762
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-cip       | gcc-10   | x86_64_defconf=
ig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61df69a77f825c9913ef6763

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-cip/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-cip/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df69a77f825c9913ef6=
764
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-cip       | gcc-10   | x86_64_defconf=
ig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61df6eba1b5a33eaacef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/x86_64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/x86_64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df6eba1b5a33eaacef6=
73e
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6bb0570bbd57f7ef677a

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df6bb0570bbd5=
7f7ef677d
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:00:23.573559  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T00:00:23.573781  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T00:00:23.573878  kern  :alert : user pgtable: 4k pages<8>[  =
 15.985296] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T00:00:23.573968  , 48-bit VAs, pgdp=3D000000007f850000
    2022-01-13T00:00:23.574053  ker<8>[   15.997376] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 597554_1.5.2.4.1>
    2022-01-13T00:00:23.574136  n  :alert : [0000000000000000] pgd=3D080000=
007f851003, p4d=3D080000007f851003, pud=3D080000007f852003, pmd=3D000000000=
0000000
    2022-01-13T00:00:23.574220  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df6bb0570bbd5=
7f7ef677e
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:00:23.530336  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T00:00:23.530560  kern  :alert : Mem abort info:
    2022-01-13T00:00:23.530656  ker<8>[   15.944339] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T00:00:23.530745  n  :alert :   ESR =3D 0x96000006
    2022-01-13T00:00:23.530832  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:00:23.530917  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:00:23.530999  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T00:00:23.531080  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T00:00:23.531159  kern  :alert : Data abort info:   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61df6da376399e8588ef673e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df6da376399e8=
588ef6741
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:08:43.079806  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:08:43.079901  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:08:43.079985  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T00:08:43.080065  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T00:08:43.080155  kern  :alert : Data abort info:
    2022-01-13T00:08:43.122029  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T00:08:43.122167  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T00:08:43.122257  kern  :alert : user pgtable: 4k pages<8>[  =
 16.263234] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T00:08:43.122364  , 48-bit VAs, pgdp=3D000000007f87a000
    2022-01-13T00:08:43.122446  ker<8>[   16.275396] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 597599_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df6da376399e8=
588ef6742
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:08:43.078832  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T00:08:43.078998  kern  :alert : Mem abort info:
    2022-01-13T00:08:43.079089  ker<8>[   16.222207] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T00:08:43.079175  n  :alert :   ESR =3D 0x96000006   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+arm6=
4-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61df70ebc6ae6b6b19ef6766

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a7=
74c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a7=
74c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df70ebc6ae6b6=
b19ef6769
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:22:51.619235  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T00:22:51.619361  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T00:22:51.619480  kern  :alert : user pgtable: 4k pages<8>[  =
 15.821956] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T00:22:51.619574  , 48-bit VAs, pgdp=3D000000004f7d9000
    2022-01-13T00:22:51.619654  ker<8>[   15.833844] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 597670_1.5.2.4.1>
    2022-01-13T00:22:51.619733  n  :alert : [0000000000000000] pgd=3D080000=
004f3b2003, p4d=3D080000004f3b2003, pud=3D080000007f8cb003, pmd=3D000000000=
0000000
    2022-01-13T00:22:51.619812  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df70ebc6ae6b6=
b19ef676a
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:22:51.575990  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T00:22:51.576101  kern  :alert : Mem abort info:
    2022-01-13T00:22:51.576189  ker<8>[   15.780929] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T00:22:51.576295  n  :alert :   ESR =3D 0x96000006
    2022-01-13T00:22:51.576403  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:22:51.576483  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:22:51.576561  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T00:22:51.576637  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T00:22:51.576714  kern  :alert : Data abort info:   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61df71b3b7fd206817ef6772

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df71b3b7fd206=
817ef6775
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:25:57.785538  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T00:25:57.785753  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T00:25:57.785850  kern  :alert : user pgtable: 4k pages<8>[  =
 15.881287] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T00:25:57.785941  , 48-bit VAs, pgdp=3D000000007f8b4000
    2022-01-13T00:25:57.786026  ker<8>[   15.893488] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 597673_1.5.2.4.1>
    2022-01-13T00:25:57.786110  n  :alert : [0000000000000000] pgd=3D080000=
007f890003, p4d=3D080000007f890003, pud=3D080000007f859003, pmd=3D000000000=
0000000
    2022-01-13T00:25:57.786194  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df71b3b7fd206=
817ef6776
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:25:57.693721  <8>[   15.801209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-13T00:25:57.742366  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T00:25:57.742579  kern  :alert : Mem abort info:
    2022-01-13T00:25:57.742674  ker<8>[   15.840599] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T00:25:57.742762  n  :alert :   ESR =3D 0x96000006
    2022-01-13T00:25:57.742847  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:25:57.742929  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:25:57.743010  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T00:25:57.743089  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T00:25:57.743167  kern  :alert : Data abort info:   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a774c0-ek874         | arm64  | lab-cip       | gcc-10   | defconfig+cryp=
to             | 2          =


  Details:     https://kernelci.org/test/plan/id/61df731cec51fd2e96ef6761

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61df731cec51fd2=
e96ef6764
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        2 lines

    2022-01-13T00:32:02.533368  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T00:32:02.533509  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T00:32:02.533601  kern  :alert : user pgtable: 4k pages<8>[  =
 15.813454] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T00:32:02.533689  , 48-bit VAs, pgdp=3D000000007f891000
    2022-01-13T00:32:02.533771  ker<8>[   15.825802] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 597701_1.5.2.4.1>
    2022-01-13T00:32:02.533853  n  :alert : [0000000000000000] pgd=3D080000=
007f88f003, p4d=3D080000007f88f003, pud=3D080000004fabd003, pmd=3D000000000=
0000000
    2022-01-13T00:32:02.533935  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61df731cec51fd2=
e96ef6765
        new failure (last pass: v5.16-6651-gc14f8df2f281)
        12 lines

    2022-01-13T00:32:02.490024  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T00:32:02.490142  kern  :alert : Mem abort info:
    2022-01-13T00:32:02.490231  ker<8>[   15.772619] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T00:32:02.490336  n  :alert :   ESR =3D 0x96000006
    2022-01-13T00:32:02.490418  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T00:32:02.490498  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T00:32:02.490575  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T00:32:02.490651  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T00:32:02.490728  kern  :alert : Data abort info:   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61df73419cc1ccef34ef676f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-tegr=
a124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-tegr=
a124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df73419cc1ccef34ef6=
770
        new failure (last pass: v5.16-1778-g6927daa7c4fb) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61df73cbf2bd397b97ef67f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df73cbf2bd397b97ef6=
7fa
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61df745e5a057d7e99ef674e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora/ba=
seline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora/ba=
seline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df745e5a057d7e99ef6=
74f
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61df74e5721e41f34bef6740

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df74e5721e41f34bef6=
741
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61df778e7bbdc081abef675f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df778e7bbdc081abef6=
760
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
tegra124-nyan-big      | arm    | lab-collabora | gcc-10   | tegra_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/61df72a4cb2c536722ef6740

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df72a4cb2c536722ef6=
741
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61df6bdb86a508c2c7ef6747

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df6bdb86a508c2c7ef6=
748
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61df6da776399e8588ef674c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df6da776399e8588ef6=
74d
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+arm6=
4-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61df70a050c4cb71d3ef6774

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df70a050c4cb71d3ef6=
775
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61df71f315aa09c036ef673f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df71f315aa09c036ef6=
740
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
zynqmp-zcu102          | arm64  | lab-cip       | gcc-10   | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/61df726bd2ea916f09ef6740

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-7998-=
gbeebf0a29205/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61df726bd2ea916f09ef6=
741
        new failure (last pass: v5.16-6651-gc14f8df2f281) =

 =20
