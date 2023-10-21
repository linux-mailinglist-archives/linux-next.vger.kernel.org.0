Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2EA7D1A45
	for <lists+linux-next@lfdr.de>; Sat, 21 Oct 2023 03:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjJUBX7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Oct 2023 21:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJUBX7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Oct 2023 21:23:59 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9208D69
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 18:23:53 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c9e06f058bso19238025ad.0
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 18:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697851433; x=1698456233; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgLnXZIGNFVnYr8h/tRD4kXlSyBkCiKwyMV4sw4cUc8=;
        b=LKkArWfbHqEwk4TzzaMfU7qp6/XnL/Qc4GTVOAKIBp70fLew0Lfe/TB/iBKNeIV6fl
         b/vK8m0kj2u30G7e2B7SZjUp83IdMih4/oWISqO0JPtM2FJNvouoHFVxLmTFMDjxkGc5
         0ZDkwVpP5j0HziA722yFCvSyPF9nRNvBDu4HtWPdsQZ/d+CfGNEcCp5/XRGqzeW0bJ+t
         EGT2IiEzWKyT8TKLY5j+ctqWCrR91nyYX6wopNc7XTZ9GJA707JXJhz7K0MWnnbjYGyU
         85bhpbtyQ8nk3FEpubraRALlJD9IPY5so5R3MFITZZvjbTT29L9GfiXvvRpOb48oOFv1
         0jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697851433; x=1698456233;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgLnXZIGNFVnYr8h/tRD4kXlSyBkCiKwyMV4sw4cUc8=;
        b=II0N6ugLN8R+vh8AagU52+vzUp2URiHMTOUY+hbb+E6GVmYFn2wyd/uDukZI6IPUQf
         r0A/1L+l2PSs3VhTsBBU13Iwlgv0EF2c/bhCYrZkPf3Wqna/nvQPY70U8YQhMQZDxF+G
         4ENQ5WqI+4j7ICrNWuCi1CtY/lmYkpMCgsEdYdPdST5211sdYG4zYADyywLqvylDD+B6
         EFqZHEKl0qdO0hi0AHLF66Zgjlge8k9guLmMR3IKcDsS6LwH1aFR6F2viaZ0UhGsuFEk
         gbGM8UQKUyPH7i/9sosb2/enmqpem27CyGo/OOQXPEWhm0ODMIGhjrk74ojV3lm84cnH
         446g==
X-Gm-Message-State: AOJu0YydYIBfSpjAPkg+M6Dbdgavawh6680cS4yfaHoz7mGjDCF2ZZfO
        hUJo2xFR2T4+aHqzuQ3MvzCv7a1BFuhszU0XAbCZ1Q==
X-Google-Smtp-Source: AGHT+IEmEMKh6gGDXh2YdH8nW2UsNEa/G9MaRg9Y2xJHb3BGAHhZ0AMjmxokU7YTmE0HHLIIp0YtbQ==
X-Received: by 2002:a17:903:5d0:b0:1c7:27a1:a9e5 with SMTP id kf16-20020a17090305d000b001c727a1a9e5mr3824570plb.33.1697851432859;
        Fri, 20 Oct 2023 18:23:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001bc675068e2sm2128292pli.111.2023.10.20.18.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 18:23:52 -0700 (PDT)
Message-ID: <65332828.170a0220.712b4.7e7e@mx.google.com>
Date:   Fri, 20 Oct 2023 18:23:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-398-g08f4e7d168e5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 87 runs,
 8 regressions (v6.6-rc6-398-g08f4e7d168e5)
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

next/pending-fixes baseline: 87 runs, 8 regressions (v6.6-rc6-398-g08f4e7d1=
68e5)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =

imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

k3-j721e-sk        | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 2      =
    =

rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc6-398-g08f4e7d168e5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc6-398-g08f4e7d168e5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      08f4e7d168e500762255211cd70d1f4eb162200c =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f7473ce158482defcf17

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532f7473ce158482defcf20
        failing since 22 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-20T21:55:02.510972  / # #
    2023-10-20T21:55:03.666440  export SHELL=3D/bin/sh
    2023-10-20T21:55:03.671985  #
    2023-10-20T21:55:05.212669  / # export SHELL=3D/bin/sh. /lava-3808587/e=
nvironment
    2023-10-20T21:55:05.218162  =

    2023-10-20T21:55:08.026461  / # . /lava-3808587/environment/lava-380858=
7/bin/lava-test-runner /lava-3808587/1
    2023-10-20T21:55:08.032207  =

    2023-10-20T21:55:08.032410  / # /lava-3808587/bin/lava<3>[   21.391527]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-20T21:55:08.041180  -test-runner /lava-3808587/1
    2023-10-20T21:55:08.106194  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532fec02647e5a9ceefcf16

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532fec02647e5a9ceefcf1f
        failing since 45 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-20T22:26:55.587463  + set<8>[   29.631345] <LAVA_SIGNAL_ENDRUN =
0_dmesg 182740_1.5.2.4.1>
    2023-10-20T22:26:55.587933   +x
    2023-10-20T22:26:55.708746  / # #
    2023-10-20T22:26:56.872591  export SHELL=3D/bin/sh
    2023-10-20T22:26:56.878213  #
    2023-10-20T22:26:58.372409  / # export SHELL=3D/bin/sh. /lava-182740/en=
vironment
    2023-10-20T22:26:58.378463  =

    2023-10-20T22:27:01.096045  / # . /lava-182740/environment/lava-182740/=
bin/lava-test-runner /lava-182740/1
    2023-10-20T22:27:01.102778  =

    2023-10-20T22:27:01.106528  / # /lava-182740/bin/lava-test-runner /lava=
-182740/1 =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
k3-j721e-sk        | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f909873227f403efcef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6532f909873227f403efc=
efa
        new failure (last pass: v6.6-rc6-220-ged04e49eed957) =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 2      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f743bf81e776b8efcf2b

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532f743bf81e776b8efcf32
        new failure (last pass: v6.6-rc6-220-ged04e49eed957)

    2023-10-20T21:55:06.383103  / # #
    2023-10-20T21:55:06.485264  export SHELL=3D/bin/sh
    2023-10-20T21:55:06.485967  #
    2023-10-20T21:55:06.587208  / # export SHELL=3D/bin/sh. /lava-387480/en=
vironment
    2023-10-20T21:55:06.587844  =

    2023-10-20T21:55:06.689001  / # . /lava-387480/environment/lava-387480/=
bin/lava-test-runner /lava-387480/1
    2023-10-20T21:55:06.689855  =

    2023-10-20T21:55:06.734338  / # /lava-387480/bin/lava-test-runner /lava=
-387480/1
    2023-10-20T21:55:06.759996  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-20T21:55:06.760358  + cd /l<8>[   16.070194] <LAVA_SIGNAL_START=
RUN 1_bootrr 387480_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/653=
2f743bf81e776b8efcf42
        new failure (last pass: v6.6-rc6-220-ged04e49eed957)

    2023-10-20T21:55:09.151183  /lava-387480/1/../bin/lava-test-case
    2023-10-20T21:55:09.151610  <8>[   18.555182] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-10-20T21:55:09.151907  /lava-387480/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f752f376c7c7d5efcf15

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532f752f376c7c7d5efcf1e
        failing since 7 days (last pass: v6.6-rc5-359-g960f4d0f660c7, first=
 fail: v6.6-rc5-397-g1026f1ab9e072)

    2023-10-20T21:55:07.467199  <8>[   21.864821] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439467_1.5.2.4.1>
    2023-10-20T21:55:07.571734  / # #
    2023-10-20T21:55:07.673525  export SHELL=3D/bin/sh
    2023-10-20T21:55:07.674312  #
    2023-10-20T21:55:07.775370  / # export SHELL=3D/bin/sh. /lava-439467/en=
vironment
    2023-10-20T21:55:07.776066  =

    2023-10-20T21:55:07.877005  / # . /lava-439467/environment/lava-439467/=
bin/lava-test-runner /lava-439467/1
    2023-10-20T21:55:07.877964  =

    2023-10-20T21:55:07.885259  / # /lava-439467/bin/lava-test-runner /lava=
-439467/1
    2023-10-20T21:55:07.935226  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f73e456df8598eefcf6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h=
64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532f73e456df8598eefcf75
        failing since 9 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.6-rc5-300-g24760d837661b)

    2023-10-20T21:54:59.997229  <8>[   19.043769] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439468_1.5.2.4.1>
    2023-10-20T21:55:00.102470  / # #
    2023-10-20T21:55:00.204121  export SHELL=3D/bin/sh
    2023-10-20T21:55:00.204762  #
    2023-10-20T21:55:00.305811  / # export SHELL=3D/bin/sh. /lava-439468/en=
vironment
    2023-10-20T21:55:00.306470  =

    2023-10-20T21:55:00.407518  / # . /lava-439468/environment/lava-439468/=
bin/lava-test-runner /lava-439468/1
    2023-10-20T21:55:00.408491  =

    2023-10-20T21:55:00.412252  / # /lava-439468/bin/lava-test-runner /lava=
-439468/1
    2023-10-20T21:55:00.491753  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6532f75aefc2492cc5efcf65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-39=
8-g08f4e7d168e5/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6532f75aefc2492cc5efcf6e
        failing since 9 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.6-rc5-300-g24760d837661b)

    2023-10-20T21:59:38.271980  / # #

    2023-10-20T21:59:38.374108  export SHELL=3D/bin/sh

    2023-10-20T21:59:38.374809  #

    2023-10-20T21:59:38.476263  / # export SHELL=3D/bin/sh. /lava-11833217/=
environment

    2023-10-20T21:59:38.476966  =


    2023-10-20T21:59:38.578434  / # . /lava-11833217/environment/lava-11833=
217/bin/lava-test-runner /lava-11833217/1

    2023-10-20T21:59:38.579513  =


    2023-10-20T21:59:38.596270  / # /lava-11833217/bin/lava-test-runner /la=
va-11833217/1

    2023-10-20T21:59:38.662190  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-20T21:59:38.662677  + cd /lava-1183321<8>[   19.462432] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11833217_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
