Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76EA49B0DD
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 11:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbiAYJuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 04:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbiAYJme (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 04:42:34 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1A6C061770
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 01:42:30 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so2238378pjb.1
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 01:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=llhxdRqGLQJemloC6You7LcSNezuu9uthKT+jsD9JFo=;
        b=uGeAjBx6W0zWtkV8yGZ60mZRfxQD/uyPkcUyqz4On7/NM5zo3qS3VQXjrdjX+uTH1w
         5CA+aKSxKO+drFTNdLKXtSvaNoF89i6Mna4k6SHXrUiozRYSLyC6FKkcSxZUMWS1ud1k
         M+tw5b9uUFx2a3Cm9NgX09miXelFc/OGGk7EJrV1qCkAQ/JHgsQXJHzUJSIlsQyiRzsD
         GdzY6ZvJESMIZMGshG75GVu7KKvYKWTknviI+bmAHLb6vKtKI7ZkBgWcs9p0jNsLO6bX
         pGKlEsJ50gTjQ1VLMs1t0wkxD720VuIe+cXvwZJpDpFkFbFUl9s8N6N3xlUxykX7EQhy
         1Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=llhxdRqGLQJemloC6You7LcSNezuu9uthKT+jsD9JFo=;
        b=Ii1/f4IXOLYXyNSbLGGl6CBu+5V6ac5VdFS40kr17TtZ5CToWnI9eDAGCgHcYpzZhg
         cLLxBjkuZnbxy/SW18l5/drjj/9iJi6Mc8JB53EPr5S+2AwqcClGCgmtr69h+qkQ9lhb
         TxP5sJsW/svrZtwaOqc7eYR6jYox0UEFKTHCQUU84yGjYmrnv0McAjaimKXYEBIK2kDb
         N0+gfOvyN5CKze22wlLC6vA7kCS0WuvbSDebIZnYIFJ3+lptkIEn7oJW399OQoaJyCJ7
         3BH7aAGla2bZxHoF+L8mu7tqlzmIGLV1kEhgsuc5kwuGkJYrmTZh0az1urfKf0SYHJ7s
         6BHg==
X-Gm-Message-State: AOAM533DkkXx0LKLbiXXXGQTOGDIfK43vY35jPrKI3Y8GTkPEZq6y+nN
        nnOql9qc82OPdeHWTOwXBfZhFJVcUuhhfDp/
X-Google-Smtp-Source: ABdhPJyjq2KRyCjLMzTMcI0DIvW7xDq1aqVxmScZlexJm4WeOQINC09wvbYF5jc9vL6mAcbw4rH7dA==
X-Received: by 2002:a17:902:da8a:b0:14b:370b:23fe with SMTP id j10-20020a170902da8a00b0014b370b23femr12044907plx.103.1643103748806;
        Tue, 25 Jan 2022 01:42:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b5sm14228022pgl.22.2022.01.25.01.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 01:42:28 -0800 (PST)
Message-ID: <61efc604.1c69fb81.26f67.6e6d@mx.google.com>
Date:   Tue, 25 Jan 2022 01:42:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-212-g930c0caea669
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 564 runs,
 30 regressions (v5.17-rc1-212-g930c0caea669)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 564 runs, 30 regressions (v5.17-rc1-212-g930c0=
caea669)

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

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+ima  =
              | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc1-212-g930c0caea669/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc1-212-g930c0caea669
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      930c0caea669427384901ee36e1815a387f1193c =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8ce597c75fef65abbd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef8ce597c75fef65abb=
d20
        failing since 76 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8ab5aee0cab41fabbd1b

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef8ab5aee0cab=
41fabbd22
        failing since 1 day (last pass: v5.16-11577-gffd79fec234d, first fa=
il: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-01-25T05:28:59.360952  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-01-25T05:28:59.361784  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-01-25T05:28:59.362412  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-01-25T05:28:59.403160  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8be6ce1b2ed3eaabbd7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef8be6ce1b2ed3eaabb=
d7e
        failing since 5 days (last pass: v5.16-7998-gbeebf0a29205, first fa=
il: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8de17fa79f8272abbd13

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef8de17fa79f8=
272abbd1a
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:42:13.162053  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   20.333738] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-25T05:42:13.162269  0000
    2022-01-25T05:42:13.162409  kern  :alert : Mem abort info:
    2022-01-25T05:42:13.162535  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T05:42:13.162653  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:42:13.162767  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef8de17fa79f8=
272abbd1b
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:42:13.163657  kern  :alert :   EA<8>[   20.361312] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T05:42:13.163821   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8e314ce76f8129abbd45

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef8e314ce76f8=
129abbd4c
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:44:02.404306  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.212367] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T05:44:02.404514  at virtual address 0000000000000000
    2022-01-25T05:44:02.404645  kern  :alert : Mem abort info:
    2022-01-25T05:44:02.404761  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T05:44:02.404869  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:44:02.404974  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef8e314ce76f8=
129abbd4d
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:44:02.405773  kern  :alert :   EA<8>[   14.238487] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T05:44:02.405914   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8e460b8eb8fecbabbd3e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef8e460b8eb8f=
ecbabbd45
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:44:11.132490  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.712274] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef8e460b8eb8f=
ecbabbd46
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:44:11.170917  at virtual address 0000000000000000
    2022-01-25T05:44:11.171295  kern  :alert : Mem abort info:
    2022-01-25T05:44:11.171530  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T05:44:11.171797  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:44:11.172341  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T05:44:11.172654  kern  :alert :   EA<8>[   14.738009] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T05:44:11.172924   =3D 0, S1PTW =3D 0
    2022-01-25T05:44:11.173194  kern  :alert :  <8>[   14.750448] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 809135_1.5.2.4.1>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8dabe60667f3e9abbd11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8dabe60667f3e9abbd52
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:41:40.390963  /lava-83218/1/../bin/lava-test-case
    2022-01-25T05:41:40.394060  <8>[   16.398197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8dabe60667f3e9abbd53
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:41:41.444411  /lava-83218/1/../bin/lava-test-case
    2022-01-25T05:41:41.444795  <8>[   17.417699] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8e4fca760d1a58abbd11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8e4fca760d1a58abbd52
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-25T05:43:40.195072  /lava-83225/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8e4fca760d1a58abbd53
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-25T05:43:40.198221  <8>[   16.620267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T05:43:41.246039  /lava-83225/1/../bin/lava-test-case
    2022-01-25T05:43:41.246439  <8>[   17.638412] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8fb76a3f86e6d4abbd83

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8fb76a3f86e6d4abbdc4
        failing since 14 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:50:19.547754  /lava-83233/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8fb76a3f86e6d4abbdc5
        failing since 14 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:50:19.550973  <8>[   18.575205] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T05:50:20.599067  /lava-83233/1/../bin/lava-test-case
    2022-01-25T05:50:20.599493  <8>[   19.594499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T05:50:20.599736  /lava-83233/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8daee60667f3e9abbd87

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8daee60667f3e9abbdcf
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:41:50.961824  /lava-83222/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8daee60667f3e9abbdd0
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:41:50.964939  <8>[   13.554718] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T05:41:52.011029  /lava-83222/1/../bin/lava-test-case
    2022-01-25T05:41:52.011298  <8>[   14.573531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T05:41:52.011448  /lava-83222/1/../bin/lava-test-case
    2022-01-25T05:41:52.011588  <8>[   14.588887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8f1db5e8d0fac6abbd2c

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8f1db5e8d0fac6abbd74
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-25T05:47:56.905274  /lava-83224/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8f1db5e8d0fac6abbd75
        failing since 12 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-25T05:47:56.919159  <8>[   13.518637] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T05:47:57.959030  /lava-83224/1/../bin/lava-test-case
    2022-01-25T05:47:57.959354  <8>[   14.537448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T05:47:57.959512  /lava-83224/1/../bin/lava-test-case
    2022-01-25T05:47:57.959656  <8>[   14.554658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T05:47:57.959801  /lava-83224/1/../bin/lava-test-case
    2022-01-25T05:47:57.959939  <8>[   14.571878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T05:47:57.960078  /lava-83224/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8f8ce2706fd5a2abbd39

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef8f8ce2706fd5a2abbd81
        failing since 14 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:49:40.488097  /lava-83232/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f8f8ce2706fd5a2abbd82
        failing since 14 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-25T05:49:40.491161  <8>[   13.522695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T05:49:41.538837  /lava-83232/1/../bin/lava-test-case
    2022-01-25T05:49:41.539133  <8>[   14.542098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T05:49:41.539293  /lava-83232/1/../bin/lava-test-case
    2022-01-25T05:49:41.539433  <8>[   14.558069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T05:49:41.539573  /lava-83232/1/../bin/lava-test-case
    2022-01-25T05:49:41.539708  <8>[   14.574126] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T05:49:41.539842  /lava-83232/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef8d4a656a24ffc3abbd34

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef8d4a656a24f=
fc3abbd3a
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:40:00.725669  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T05:40:00.725800  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T05:40:00.725893  kern  :alert : user pgtable: 4<8>[   16.581=
304] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D2>
    2022-01-25T05:40:00.725981  k pages, 48-bit VAs, pgdp=3D000000007f92d0<=
8>[   16.593484] <LAVA_SIGNAL_ENDRUN 0_dmesg 611023_1.5.2.4.1>
    2022-01-25T05:40:00.726106  00
    2022-01-25T05:40:00.726206  kern  :alert : [0000000000000000] pgd=3D080=
000007f92e003, p4d=3D080000007f92e003, pud=3D080000007f92f003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef8d4a656a24f=
fc3abbd3b
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:40:00.682517  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T05:40:00.682633  kern  :alert : Mem abort info:
    2022-01-25T05:40:00.682761  ker<8>[   16.540802] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T05:40:00.682868  n  :alert :   ESR =3D 0x96000006
    2022-01-25T05:40:00.682954  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:40:00.683037  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T05:40:00.683117  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T05:40:00.683195  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T05:40:00.683272  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef9065dfe7a449e9abbda4

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef9065dfe7a44=
9e9abbdaa
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:53:15.752165  kern  :alert : Data abort info:
    2022-01-25T05:53:15.794281  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T05:53:15.794449  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T05:53:15.794563  kern  :alert : user pgtable: 4k pages<8>[  =
 15.874172] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-25T05:53:15.794704  , 48-bit VAs, pgdp=3D000000004fb9b000
    2022-01-25T05:53:15.794792  ker<8>[   15.886297] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 611054_1.5.2.4.1>
    2022-01-25T05:53:15.794877  n  :alert : [0000000000000000] pgd=3D080000=
004ae61003, p4d=3D080000004ae61003, pud=3D080000004f39d003, pmd=3D000000000=
0000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef9065dfe7a44=
9e9abbdab
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:53:15.750895  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T05:53:15.751024  kern  :alert : Mem abort info:
    2022-01-25T05:53:15.751131  ker<8>[   15.833327] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T05:53:15.751221  n  :alert :   ESR =3D 0x96000006
    2022-01-25T05:53:15.751304  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:53:15.751386  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T05:53:15.751465  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T05:53:15.751541  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef9118ad389392adabbd36

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek=
874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek=
874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef9118ad38939=
2adabbd3c
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-25T05:56:24.601464  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T05:56:24.601555  kern  :alert : Data abort info:
    2022-01-25T05:56:24.643486  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T05:56:24.643597  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T05:56:24.643685  kern  :alert : user pgtable: 4k pages<8>[  =
 17.469184] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-25T05:56:24.643771  , 48-bit VAs, pgdp=3D000000004fb75000
    2022-01-25T05:56:24.643851  ker<8>[   17.480918] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 611085_1.5.2.4.1>
    2022-01-25T05:56:24.643982  n  :alert : [0000000000000000] pgd=3D080000=
004d2af003, p4d=3D080000004d2af003, pud=3D080000007f870003, pmd=3D000000000=
0000000
    2022-01-25T05:56:24.644064  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef9118ad38939=
2adabbd3d
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-25T05:56:24.600317  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T05:56:24.600446  kern  :alert : Mem abort info:
    2022-01-25T05:56:24.600539  ker<8>[   17.428076] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T05:56:24.600624  n  :alert :   ESR =3D 0x96000006
    2022-01-25T05:56:24.600706  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T05:56:24.600785  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T05:56:24.600861  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8db0624136cd3aabbd99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef8db0624136cd3aabb=
d9a
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8e65ed7733e752abbd4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef8e65ed7733e752abb=
d4e
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef8f18b5e8d0fac6abbd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-2=
12-g930c0caea669/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef8f18b5e8d0fac6abb=
d1d
        failing since 12 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =20
