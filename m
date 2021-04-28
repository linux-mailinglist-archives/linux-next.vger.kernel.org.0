Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C555736D6A5
	for <lists+linux-next@lfdr.de>; Wed, 28 Apr 2021 13:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhD1Lje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Apr 2021 07:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbhD1Lje (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Apr 2021 07:39:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3025AC061574
        for <linux-next@vger.kernel.org>; Wed, 28 Apr 2021 04:38:49 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id md17so5233098pjb.0
        for <linux-next@vger.kernel.org>; Wed, 28 Apr 2021 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8o4i7wYn0b8k/PEfOEOP8EuOLTEk9Ep0DLgX84mvPb0=;
        b=F21mVmQ1Jp7hTlUmPAMLFW1N+RK3iOSJY2Nsmofb3m/nIj8xYnvzteju26qu7M1ZsQ
         wqUMQJNN9AUTyV+NMnUluhlYGR/pjoRFNl98oFQnnchSWMpbCapyd7N7RRtmYPSEZ/90
         aC68IR2YmFjIgerC2oGOl8u2e/0Vux/l5AnpD6+VcJ8P1wfzxmH1tcdvEbJslbnuS6hK
         5CuqLnhG+1lynIWnpgzHjtXqBoUSaQAwyyLOROWamprQpXcfxJMKKQAhuIGCSlzxZS7X
         iF7bcEkTaFItNp/+Irt+7X4VPMfl2trygEV9IZxnUEbBsuYrv+HRjeWwZ3o0b7q8DnOU
         wVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8o4i7wYn0b8k/PEfOEOP8EuOLTEk9Ep0DLgX84mvPb0=;
        b=HH1/X9D/8HNgFomzxqsAeXaqDgcuIxIQaJ96gkjTXfNf/9o0dgqEIWEeyUGhRh4RxE
         SMiGDaba7eBCr7Fxw/4HZZ+s76+vdiiujsEH5tuWzhbuluHgu/yXsShyAwNoCK02cjnx
         VoHLkRx/I6XG0q5eHcLymEctCEPqMTcfu6TR1z4TTGJ0PZ8RPElczRXAu9WXlcgNd4Il
         22MwohNHEjTuFC90FpDL6xyieEqYgN0eEPgdBqYipDM99YUU4gEqyRHs3QGNpwlx3OpY
         OmJ94pXqL8DdtnIL8fpqiJpQtZChXdP1L2NMOcn+wfPfv3aNkDRVjzQCLMxSONwyBtGX
         kWxw==
X-Gm-Message-State: AOAM5328YIpGre2kf72aP6Z/MAAHT8aCHqdSWtSxDfgXwYOpxcQtdpTU
        eQZhKUgBqZstZm9HCiZoGYleGWyVa8VI5vPm
X-Google-Smtp-Source: ABdhPJxRAHYUFMIJe9MEitjoS+2+1DoDtqv7+ABCjmTf0QidmEK4s9OZZX445gkxeyteMVuVCXWUXw==
X-Received: by 2002:a17:90a:e384:: with SMTP id b4mr3700664pjz.157.1619609928236;
        Wed, 28 Apr 2021 04:38:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e23sm2416173pgg.76.2021.04.28.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 04:38:47 -0700 (PDT)
Message-ID: <60894947.1c69fb81.4ba7f.78e4@mx.google.com>
Date:   Wed, 28 Apr 2021 04:38:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210428
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 585 runs, 20 regressions (next-20210428)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 585 runs, 20 regressions (next-20210428)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

r8a77960-ulcb        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210428/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210428
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a5fb44b89809a00cfb85997529d8430ed0759ea5 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60890a1d54a617ad2d9b7799

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60890a1d54a617a=
d2d9b779f
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-28 07:08:54.747000+00:00  kern  :alert : Mem abort info:
    2021-04-28 07:08:54.748000+00:00  kern  :aler[   21.808406] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-28 07:08:54.749000+00:00  t :   ESR =3D 0x96000007
    2021-04-28 07:08:54.749000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-28 07:08:54.750000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-28 07:08:54.751000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-28 07:08:54.751000+00:00  kern  :alert : Data abort info:
    2021-04-28 07:08:54.752000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60890a1d54a617a=
d2d9b77a0
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-28 07:08:54.789000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000bd10600
    2021-04-28 07:08:54.790000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c2b0003, p4d=3D080000000c2b0003, pud=3D[   21.854329] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/60890ced16c67abb619b77d9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60890cee16c67ab=
b619b77df
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-28 07:20:53.719000+00:00  kern  :alert : Mem [   21.687643] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-28 07:20:53.719000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60890cee16c67ab=
b619b77e0
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-28 07:20:53.723000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-28 07:20:53.724000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-28 07:20:53.725000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-28 07:20:53.725000+00:00  kern  :alert : Data abort info:
    2021-04-28 07:20:53.726000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-28 07:20:53.771000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-28 07:20:53.772000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit[   21.725865] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-28 07:20:53.773000+00:00   VAs, pgdp=3D000000000726a[   21.7366=
42] <LAVA_SIGNAL_ENDRUN 0_dmesg 148498_1.5.2.4.1>
    2021-04-28 07:20:53.774000+00:00  000
    2021-04-28 07:20:53.774000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000726b003   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608907c458ed40227a9b7798

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608907c458ed402=
27a9b779e
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-28 06:58:56.917000+00:00  kern  :alert : Mem abort in[   21.660=
786] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-28 06:58:56.918000+00:00  fo:
    2021-04-28 06:58:56.919000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608907c558ed402=
27a9b779f
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-28 06:58:56.923000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-28 06:58:56.924000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-28 06:58:56.924000+00:00  kern  :alert : Data abort info:
    2021-04-28 06:58:56.925000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-28 06:58:56.960000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-28 06:58:56.961000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000007e6000
    2021-04-28 06:58:56.962000+00:00  kern  :aler[   21.702039] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/6089085131a3843ad29b77c4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6089085131a3843=
ad29b77ca
        failing since 8 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-28 07:01:17.237000+00:00  kern  :alert : Mem abort in[   21.732=
529] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-28 07:01:17.238000+00:00  fo:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6089085131a3843=
ad29b77cb
        failing since 8 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-28 07:01:17.242000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-28 07:01:17.243000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-28 07:01:17.244000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-28 07:01:17.244000+00:00  kern  :alert : Data abort info:
    2021-04-28 07:01:17.245000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-28 07:01:17.280000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-28 07:01:17.281000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a976000
    2021-04-28 07:01:17.282000+00:00  ker[   21.772406] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-28 07:01:17.283000+00:00  n  :alert : [00000000000[   21.783369=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 148268_1.5.2.4.1>
    2021-04-28 07:01:17.283000+00:00  00050] pgd=3D080000003a977003, p4d=3D=
080000003a977003, pud=3D080000003a9e3003 =

    ... (1 line(s) more)  =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60890828278f8614919b77b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60890828278f8614919b7=
7b3
        failing since 33 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/608905b53c7785e6259b77c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608905b53c7785e6259b7=
7c3
        failing since 35 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6089091a0695df48399b77a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6089091a0695df48399b7=
7a1
        new failure (last pass: next-20210427) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6089101ee281f6795f9b77a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6089101ee281f6795f9b7=
7a5
        new failure (last pass: next-20210427) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608909aeda1c2e3fd49b77af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608909aeda1c2e3fd49b7=
7b0
        new failure (last pass: next-20210427) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60890994ab4e4fcb9d9b77c7

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60890994ab4e4fcb9d9b77db
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-28 07:06:56.037000+00:00  <8>[   55.755224] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
90994ab4e4fcb9d9b77e1
        failing since 21 days (last pass: next-20210323, first fail: next-2=
0210406) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608905937efce646ff9b77bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608905937efce646ff9b7=
7bc
        failing since 161 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6089058a7efce646ff9b77ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6089058a7efce646ff9b7=
7ad
        failing since 161 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6089057d7efce646ff9b77a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6089057d7efce646ff9b7=
7a1
        failing since 161 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608943e4aff95696a39b77ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608943e4aff95696a39b7=
7ad
        failing since 161 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77960-ulcb        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60890789e139c194109b782a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210428/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60890789e139c194109b7=
82b
        new failure (last pass: next-20210427) =

 =20
