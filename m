Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289817668E7
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 11:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbjG1Jd0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jul 2023 05:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbjG1Jcl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jul 2023 05:32:41 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC48230F9
        for <linux-next@vger.kernel.org>; Fri, 28 Jul 2023 02:32:06 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686b9920362so1402476b3a.1
        for <linux-next@vger.kernel.org>; Fri, 28 Jul 2023 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690536726; x=1691141526;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lwC9XrTHEJOjvNRhbbgHfQwsGa+3sm5R+Tb5wcfnAqQ=;
        b=p9YnhgOx5b+52yxHvtwiBeB/V+vAODA+vuuL5IRqgcPSxJg96re+c3J2eWjtCF0+Ln
         0EXXidzo9o/760BEuObYWvI7etQqKcUWuABwB1xwTHLs/q28IShw0vmRUPQrpa1PnLmq
         qF4hQII37GdWN1DC7SftbfLZDnXyH9ROc026RUEKxQzsMqnr8fkXi6dUpmzqx1gXrOQ5
         UUL/SV+mQNS0jeZuRZsLdQilCVM2TjWHHDfTCo/ld+CwsKk9Ytntp5HI/Ruwl9DjfKD7
         F5W3eyBB8d8ICzaiCm6uY/oWnEqd11g78s/V/JF+vUc6mmZrJiPPy+UwGWJbsJS5weAm
         Hnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690536726; x=1691141526;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwC9XrTHEJOjvNRhbbgHfQwsGa+3sm5R+Tb5wcfnAqQ=;
        b=D8auLDqt1rcrPhqpKZ6fyKIIGL8j4YIbSlHsz5ceihZ7eWnI9in+yaZjgIKLRS0n9j
         PT7M23YCstE7tvGgSXOOZFKjUKLMYg6l1L2TIygmlCnwUIDITH99t97n3krMkObwsgZo
         9hYO7nFOMa8iP7/VZE/jYkI6n4CoDX1H0eSmo71YIn9lslL4ARlstuWSjcD8CbzQiQzZ
         iC8+XDaKIRuJU2jHmvRAOWzI6cInXZbT3fz/U9fk+wwU7z0D2Dlau+4l7E8ZwMux6BpK
         xSPXctshIjb5bwp4tlg/UMj1cczD/48fx8VbU95AbKWY+D1OpQkB2CmOixre17xqL/jj
         lXRA==
X-Gm-Message-State: ABy/qLZad2vA668dyejGLdde94HBQv3gBSfyXwTFjr0VkL4ka+Euha9W
        ly4RnWoWGNNjQC/Db2/FwrNi4GOR2GdKmI0ZB0bM5A==
X-Google-Smtp-Source: APBJJlGTHddEGioMqWGJuPGrK1xzVZRF/esUl51+x9LlfEbe6WT5BMIC4aSgQpAFmwr8gdP373FQkw==
X-Received: by 2002:a05:6a21:47c7:b0:137:514a:984f with SMTP id as7-20020a056a2147c700b00137514a984fmr1020546pzc.35.1690536725812;
        Fri, 28 Jul 2023 02:32:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jf4-20020a170903268400b001b53953f306sm3117158plb.178.2023.07.28.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:32:04 -0700 (PDT)
Message-ID: <64c38b14.170a0220.d4aca.5bc1@mx.google.com>
Date:   Fri, 28 Jul 2023 02:32:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc3-393-g6d8e2e5dcd42c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 58 runs,
 7 regressions (v6.5-rc3-393-g6d8e2e5dcd42c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 58 runs, 7 regressions (v6.5-rc3-393-g6d8e2e5d=
cd42c)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc3-393-g6d8e2e5dcd42c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc3-393-g6d8e2e5dcd42c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6d8e2e5dcd42c9100bb6226471fa78741c4f3444 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35abb25ed913fe38ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c35abb25ed913fe38ace1f
        failing since 14 days (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first=
 fail: v6.4-11141-g4556f2dbce0d)

    2023-07-28T06:05:29.079714  + [   16.790380] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1239314_1.5.2.4.1>
    2023-07-28T06:05:29.080029  set +x
    2023-07-28T06:05:29.185263  =

    2023-07-28T06:05:29.286442  / # #export SHELL=3D/bin/sh
    2023-07-28T06:05:29.286839  =

    2023-07-28T06:05:29.387810  / # export SHELL=3D/bin/sh. /lava-1239314/e=
nvironment
    2023-07-28T06:05:29.388210  =

    2023-07-28T06:05:29.489194  / # . /lava-1239314/environment/lava-123931=
4/bin/lava-test-runner /lava-1239314/1
    2023-07-28T06:05:29.489869  =

    2023-07-28T06:05:29.494251  / # /lava-1239314/bin/lava-test-runner /lav=
a-1239314/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35b5a18e19fdd818ace50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c35b5a18e19fdd818ac=
e51
        new failure (last pass: v6.5-rc3-350-gb917f578dc45d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35ab25b38bc0ed18ace32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c35ab25b38bc0ed18ace35
        failing since 9 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-28T06:05:19.175382  / # #
    2023-07-28T06:05:20.638502  export SHELL=3D/bin/sh
    2023-07-28T06:05:20.659081  #
    2023-07-28T06:05:20.659291  / # export SHELL=3D/bin/sh
    2023-07-28T06:05:22.544510  / # . /lava-989937/environment
    2023-07-28T06:05:26.002111  /lava-989937/bin/lava-test-runner /lava-989=
937/1
    2023-07-28T06:05:26.022997  . /lava-989937/environment
    2023-07-28T06:05:26.023132  / # /lava-989937/bin/lava-test-runner /lava=
-989937/1
    2023-07-28T06:05:26.105841  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:05:26.106127  + cd /lava-989937/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35a6c22e743cb798aceaa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c35a6c22e743cb798aceaf
        failing since 9 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-28T06:04:11.537229  / # #

    2023-07-28T06:04:12.616661  export SHELL=3D/bin/sh

    2023-07-28T06:04:12.618467  #

    2023-07-28T06:04:14.108529  / # export SHELL=3D/bin/sh. /lava-11157242/=
environment

    2023-07-28T06:04:14.110300  =


    2023-07-28T06:04:16.833146  / # . /lava-11157242/environment/lava-11157=
242/bin/lava-test-runner /lava-11157242/1

    2023-07-28T06:04:16.835279  =


    2023-07-28T06:04:16.844123  / # /lava-11157242/bin/lava-test-runner /la=
va-11157242/1

    2023-07-28T06:04:16.905652  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:04:16.906161  + cd /lava-111572<8>[   28.519257] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11157242_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35c8467b28eb7468ace31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c35c8467b28eb7468ac=
e32
        failing since 25 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35b447375df4fbb8ace46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c35b447375df4fbb8ac=
e47
        failing since 9 days (last pass: v6.5-rc2-246-gefabeaa08ef1, first =
fail: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35a5222e743cb798ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-39=
3-g6d8e2e5dcd42c/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c35a5222e743cb798ace21
        failing since 9 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-28T06:05:18.354814  / # #

    2023-07-28T06:05:18.456977  export SHELL=3D/bin/sh

    2023-07-28T06:05:18.457701  #

    2023-07-28T06:05:18.559134  / # export SHELL=3D/bin/sh. /lava-11157231/=
environment

    2023-07-28T06:05:18.559847  =


    2023-07-28T06:05:18.661217  / # . /lava-11157231/environment/lava-11157=
231/bin/lava-test-runner /lava-11157231/1

    2023-07-28T06:05:18.662257  =


    2023-07-28T06:05:18.679202  / # /lava-11157231/bin/lava-test-runner /la=
va-11157231/1

    2023-07-28T06:05:18.746881  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:05:18.747355  + cd /lava-11157231/1/tests/1_boot<8>[   17=
.586843] <LAVA_SIGNAL_STARTRUN 1_bootrr 11157231_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
