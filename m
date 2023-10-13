Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8558A7C7C3B
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 05:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjJMDkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Oct 2023 23:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjJMDkk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2023 23:40:40 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE6AB7
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 20:40:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c60cec8041so12187605ad.3
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 20:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697168437; x=1697773237; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JUsXD05KYJXYYRqT0y+DPeaxW6BlAUbXPG821En/yrQ=;
        b=BYYFaxAEXsZQl7s3dmAX5OznDWJGcR37a6IX7xuKPD0Y2H/4IC0JO6ibMJVRnXuuWx
         Ad+mGrNV22orvAhUVU6lA72NnJsPff/IcVPHr7gulVbNVbfS2N9vj1kfxf2Ng4HISY/u
         O6CdvHAOzYV1HI5jvyWgG5rnJ2xvxEjsaFAMtmKuJAw4bmJJw2cJJ2aKaJC0q4YAIpB5
         vkCAcv8CaYAQhoM1fpTtJfrJm+xiQ6TDRQMqFATzPYFHeYx5Y8+VUSgIRjX/5FBBgN4C
         qbDvsojqhgKRn4LzMCXjzLgOMF+Y21hvd66k44ftyVJZMew+quzum8g4/wLZT7iZLEjL
         I3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697168437; x=1697773237;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUsXD05KYJXYYRqT0y+DPeaxW6BlAUbXPG821En/yrQ=;
        b=YiNTSFbYb7asWenNZyAa0x8O1c3QvNbOYgO4I/vdPaWRSDLWFwrtRyvbps8Y6CNrGT
         hnEf1lXf3uFyo7KVqz2xyOg1j98bEFzuKW46yexxsjvvzipAfG6FsTy19z0CZ8zEulq3
         3nbWgblofB2A1yd4tvo7WVoH0VUgHWVFLQiQ6g25i7rsLoI5RxVS48R6q9ZnWmU6ZfdN
         gvRNMyEuENM+Pd15FqF6S7ocdObRux6zN+r892Ff7LR008DjPdjXyP8/QTmAms86lSX8
         0IQCco5+LHFHPAUlRuB46pn1+zcsVbL9MjEmoVrz8VvCW6I+lXjZJo+HayT9laUHmJS7
         DTSw==
X-Gm-Message-State: AOJu0YxtIS+Pf9f8YP9ARk0y2VAcUONz5td9ck+d1rqmFZX/Q7uebVWa
        6W1pyqhcIp2PlRf9XhYjqACJhgy/9g4fXSq1gX0WQw==
X-Google-Smtp-Source: AGHT+IFE++gURQGCpS4rtuj8E2ieqTt5f+8J5KoHTwjUc7/ZL/YE3jP+SfDR8Aels7DwRUn/ul82Sg==
X-Received: by 2002:a17:903:244d:b0:1c6:e8d:29d5 with SMTP id l13-20020a170903244d00b001c60e8d29d5mr29099680pls.45.1697168437612;
        Thu, 12 Oct 2023 20:40:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902daca00b001c631e9ddffsm2736307plx.170.2023.10.12.20.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 20:40:36 -0700 (PDT)
Message-ID: <6528bc34.170a0220.38c77.9bb8@mx.google.com>
Date:   Thu, 12 Oct 2023 20:40:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-397-g1026f1ab9e072
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 84 runs,
 5 regressions (v6.6-rc5-397-g1026f1ab9e072)
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

next/pending-fixes baseline: 84 runs, 5 regressions (v6.6-rc5-397-g1026f1ab=
9e072)

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

rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc5-397-g1026f1ab9e072/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc5-397-g1026f1ab9e072
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1026f1ab9e072d96616b988ed4b066b5b95613a2 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65288a0dc554ddf343efcfbc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288a0dc554ddf343efcfc5
        failing since 14 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-13T00:06:23.057278  / # #
    2023-10-13T00:06:24.211860  export SHELL=3D/bin/sh
    2023-10-13T00:06:24.217361  #
    2023-10-13T00:06:25.757620  / # export SHELL=3D/bin/sh. /lava-3802698/e=
nvironment
    2023-10-13T00:06:25.763108  =

    2023-10-13T00:06:28.572211  / # . /lava-3802698/environment/lava-380269=
8/bin/lava-test-runner /lava-3802698/1
    2023-10-13T00:06:28.577976  =

    2023-10-13T00:06:28.578184  / # /lava-3802698/bin/lava-t<3>[   22.41501=
6] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce
    2023-10-13T00:06:28.586924  est-runner /lava-3802698/1
    2023-10-13T00:06:28.651837  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65288d30ecbbd64b08efcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288d30ecbbd64b08efcefe
        failing since 37 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-13T00:19:40.396822  + set<8>[   28.317077] <LAVA_SIGNAL_ENDRUN =
0_dmesg 167758_1.5.2.4.1>
    2023-10-13T00:19:40.397453   +x
    2023-10-13T00:19:40.507489  / # #
    2023-10-13T00:19:41.673670  export SHELL=3D/bin/sh
    2023-10-13T00:19:41.679797  #
    2023-10-13T00:19:43.179191  / # export SHELL=3D/bin/sh. /lava-167758/en=
vironment
    2023-10-13T00:19:43.185237  =

    2023-10-13T00:19:45.908480  / # . /lava-167758/environment/lava-167758/=
bin/lava-test-runner /lava-167758/1
    2023-10-13T00:19:45.915384  =

    2023-10-13T00:19:45.931352  / # /lava-167758/bin/lava-test-runner /lava=
-167758/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65288a19748fe6ff39efcf2f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288a19748fe6ff39efcf38
        new failure (last pass: v6.6-rc5-359-g960f4d0f660c7)

    2023-10-13T00:06:32.615368  <8>[   19.521492] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438172_1.5.2.4.1>
    2023-10-13T00:06:32.720596  / # #
    2023-10-13T00:06:32.822281  export SHELL=3D/bin/sh
    2023-10-13T00:06:32.823384  #
    2023-10-13T00:06:32.924454  / # export SHELL=3D/bin/sh. /lava-438172/en=
vironment
    2023-10-13T00:06:32.925121  =

    2023-10-13T00:06:33.026154  / # . /lava-438172/environment/lava-438172/=
bin/lava-test-runner /lava-438172/1
    2023-10-13T00:06:33.027177  =

    2023-10-13T00:06:33.035436  / # /lava-438172/bin/lava-test-runner /lava=
-438172/1
    2023-10-13T00:06:33.083744  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65288a18ff4f8c9eafefcf2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288a18ff4f8c9eafefcf33
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-13T00:06:26.607229  <8>[   18.805777] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438170_1.5.2.4.1>
    2023-10-13T00:06:26.713602  / # #
    2023-10-13T00:06:26.815594  export SHELL=3D/bin/sh
    2023-10-13T00:06:26.816154  #
    2023-10-13T00:06:26.917280  / # export SHELL=3D/bin/sh. /lava-438170/en=
vironment
    2023-10-13T00:06:26.917943  =

    2023-10-13T00:06:27.019140  / # . /lava-438170/environment/lava-438170/=
bin/lava-test-runner /lava-438170/1
    2023-10-13T00:06:27.020209  =

    2023-10-13T00:06:27.022057  / # /lava-438170/bin/lava-test-runner /lava=
-438170/1
    2023-10-13T00:06:27.102170  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65288a05ff4f8c9eafefcf00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-39=
7-g1026f1ab9e072/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65288a05ff4f8c9eafefcf09
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-13T00:10:29.222731  / # #

    2023-10-13T00:10:29.324816  export SHELL=3D/bin/sh

    2023-10-13T00:10:29.325490  #

    2023-10-13T00:10:29.426805  / # export SHELL=3D/bin/sh. /lava-11755658/=
environment

    2023-10-13T00:10:29.427515  =


    2023-10-13T00:10:29.528972  / # . /lava-11755658/environment/lava-11755=
658/bin/lava-test-runner /lava-11755658/1

    2023-10-13T00:10:29.530048  =


    2023-10-13T00:10:29.547279  / # /lava-11755658/bin/lava-test-runner /la=
va-11755658/1

    2023-10-13T00:10:29.614170  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-13T00:10:29.614694  + cd /lava-1175565<8>[   17.551421] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11755658_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
