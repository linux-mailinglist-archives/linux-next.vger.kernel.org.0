Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06705896C8
	for <lists+linux-next@lfdr.de>; Thu,  4 Aug 2022 05:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbiHDD5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Aug 2022 23:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiHDD5H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2022 23:57:07 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F149B1CFFE
        for <linux-next@vger.kernel.org>; Wed,  3 Aug 2022 20:57:04 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 17so18321729pfy.0
        for <linux-next@vger.kernel.org>; Wed, 03 Aug 2022 20:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v66NItIFAoifLjl4UBj4RHrxG2/syk09RTXfwvXQvqw=;
        b=aA20O6ZVMTnrDv9EcNfhOg+bIbTWPUXTnN3uaSH0oajAHIiY+bSorMHhZrC81nkXIM
         gWPoajMaGK97X8KWf9RHXmHpHUu9z4V1AG5rnwaIse689XxgQSIhJMLubnzFFPqsWLCR
         S9u1wp/4kbNVplVyrskzKb6Y3mJXhQjjg66z0VYzpx5MWqGp7smNmg5e1QAMDARxhxF3
         3D7JEkjNDP84BoDPDeEqoxz2faSFK29LV7kgIqa6qncxrF618spl/RMfT/9PTwT30dXR
         u74RMONmHYNOlVTNYOSbAwX7LEOf7DuIrBAO4BrQBF7omn1cJ8ZIlNd7aNDbCJLtaJ5u
         CM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v66NItIFAoifLjl4UBj4RHrxG2/syk09RTXfwvXQvqw=;
        b=oFFO9/6vDW9kHCchLHEmxCfUMmc+N2NpX7yAmr8nUFn2h60vcku/oN7ziM6mWPrLqi
         jmsSuZgxsigNOFl0WgKDo8DnFWwFYPFbSPOBkYtptuwlGHQiH9SnKfBkHtgHpTLhnO64
         ztqUcsCjKAuNwFdVE8boPqyqp8VdvKULR/cQMx9b3jD4I4Ru2MOLy2bQkpDETBaxnUxM
         fWV4vjf5KyFiygDPuPhZE+wfzvaHvXOIcZ+1pA0uLJ0yRU11tRw4iaJBqUM2Ic+soPXF
         px0kK802qSSSZbAU0/u2yhIERF0WOw3xgZDz3Ci+/8LB7NvLlitfvExdEiLO645NHQ+Z
         mzlQ==
X-Gm-Message-State: AJIora8Z7fRbB+pecBn1QsGBGpbz99vm5Hj8+cbXBAoJsWtrCN/zT2r1
        q0+vV8wPzXNa15YUurtf1DqIkT1qLBRzrLxvTgQ=
X-Google-Smtp-Source: AA6agR7Tkm37O/S6m6WcwhSffSjqUnWqMQ3z5vdJjj1MaF11mXoiVwC7hSWU33ly1y8zDOkgRqIquA==
X-Received: by 2002:a05:6a00:16ca:b0:525:a5d5:d16f with SMTP id l10-20020a056a0016ca00b00525a5d5d16fmr29382978pfc.9.1659585424085;
        Wed, 03 Aug 2022 20:57:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b0016dbb878f8asm2803270plh.82.2022.08.03.20.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 20:57:03 -0700 (PDT)
Message-ID: <62eb438f.170a0220.513d2.5476@mx.google.com>
Date:   Wed, 03 Aug 2022 20:57:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-3879-ge7dffa5317766
Subject: next/pending-fixes baseline: 440 runs,
 14 regressions (v5.19-3879-ge7dffa5317766)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 440 runs, 14 regressions (v5.19-3879-ge7dffa53=
17766)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6q-udoo         | arm   | lab-broonie     | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6qp-sabresd     | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6sx-sdb         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

imx7ulp-evk        | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig+ima    =
            | 1          =

qemu_mips-malta    | mips  | lab-collabora   | gcc-10   | malta_defconfig  =
            | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-3879-ge7dffa5317766/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-3879-ge7dffa5317766
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e7dffa53177665feb0587e509923ea918ef18e35 =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6q-udoo         | arm   | lab-broonie     | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0cc5fa0bf3e719daf0c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb0cc5fa0bf3e719daf=
0c6
        new failure (last pass: v5.19-1483-gffa33bbcf63ea) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6qp-sabresd     | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0cfa74beedb9fddaf07d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb0cfa74beedb9fddaf=
07e
        new failure (last pass: v5.19-1483-gffa33bbcf63ea) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6sx-sdb         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0d0e74540bd523daf07c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb0d0e74540bd523daf=
07d
        new failure (last pass: v5.19-1483-gffa33bbcf63ea) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb153ce8564c4f13daf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb153ce8564c4f13daf=
05e
        failing since 15 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb15c856d00318cadaf06d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb15c856d00318cadaf=
06e
        failing since 39 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb1924cc3a79ce71daf06d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb1924cc3a79ce71daf=
06e
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb1b18c5bfc86783daf05a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb1b18c5bfc86783daf=
05b
        failing since 65 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx7ulp-evk        | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0d11ffdba1470fdaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62eb0d11ffdba1470fdaf=
057
        new failure (last pass: v5.19-1483-gffa33bbcf63ea) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0eb03546ec0bcbdaf065

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62e=
b0eb03546ec0bcbdaf078
        new failure (last pass: v5.19-rc8-159-ge79a32d56d08)

    2022-08-04T00:11:13.627834  /lava-149601/1/../bin/lava-test-case
    2022-08-04T00:11:13.628177  <8>[   22.824282] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
qemu_mips-malta    | mips  | lab-collabora   | gcc-10   | malta_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62eb0bab83a5c895addaf070

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62eb0bab83a5c89=
5addaf078
        new failure (last pass: v5.19-1483-gffa33bbcf63ea)
        1 lines

    2022-08-03T23:58:23.070755  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00000030, epc =3D=3D 8020231c, ra =3D=
=3D 80202308
    2022-08-03T23:58:23.088385  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62eb10f4ce05558cdfdaf07b

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-3879-=
ge7dffa5317766/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62eb10f4ce05558cdfdaf09d
        failing since 156 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-08-04T00:20:57.098005  <8>[   35.513878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-08-04T00:20:58.126306  /lava-6966421/1/../bin/lava-test-case
    2022-08-04T00:20:58.137348  <8>[   36.553565] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62eb10f4ce05558cdfdaf0c0
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T00:20:55.904598  /lava-6966421/1/../bin/lava-test-case
    2022-08-04T00:20:55.916990  <8>[   34.332464] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62eb10f4ce05558cdfdaf0c1
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T00:20:54.860731  /lava-6966421/1/../bin/lava-test-case
    2022-08-04T00:20:54.872839  <8>[   33.288124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62eb10f4ce05558cdfdaf0c2
        failing since 65 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-04T00:20:53.815218  /lava-6966421/1/../bin/lava-test-case
    2022-08-04T00:20:53.826738  <8>[   32.242290] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
