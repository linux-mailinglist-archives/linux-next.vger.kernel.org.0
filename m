Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6681878C449
	for <lists+linux-next@lfdr.de>; Tue, 29 Aug 2023 14:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbjH2McO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Aug 2023 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235523AbjH2McA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Aug 2023 08:32:00 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CD5BC
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 05:31:55 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7423ef3eso25865065ad.3
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693312314; x=1693917114;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I32kKtdFQtL4zcO+PKVbVxg62nCgs99jRCmkQQnT5so=;
        b=w2MNHB1oab7mRIfxQi9ifRb3LiMbV0hYsYsUcZnA50/rdJr17WmRCp0/bQMYUFYOJg
         nLukM0O2CTSx+drH+E9iFWKwgnbNew++2afUhnMVpU6O2DAfbU++w3pfMvxoGyyG0UVC
         sDNYmY3oW6QJJ+8gLxrii+iIRu9oJ/OUjEqBnlLBYaDUyCEr8IIXuw2Mm8m/XhMyRVtX
         sWvF6T/w8dpZx6785KFAFtdlKsLiPet9likVoeRlK5e+B5UzXM969j6NOPl3LM5cQNHq
         FA3GzjZ1e08emFnX+eOXK5ODB9BqJoQutp9UH8/2l6c/9JhS5MyfcQBJy90yPQfe3uyM
         XQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693312314; x=1693917114;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I32kKtdFQtL4zcO+PKVbVxg62nCgs99jRCmkQQnT5so=;
        b=QHdDLhLSkiVSPio9zE5VYDEWKj1c6OpLlh3f8S4ErlIH/mybMu+reeqcAhfHd/Cllh
         v5Ra7t0DiIGpDM0XmR5VU2EazBnX34lAhwgsSRNy4oyr3jtYJQuk5U8ks91O2leC81fb
         R0ERH+QDmYKg9Irvi5Y3g/KzsR5fNZlcgaOiqMX2sRE5VDLlfP4WjZg6TEAblALhiOIr
         8qww5mQFWqFRCAfs5S9GH6ww1vCBZWPX48RZ5+M61e3WRLsgfNvbD5oU8MTm9VPbhS7h
         mzwqmY2Msb2MuDd6RemK4QV40q1mMq4O5yOVy8LpAK61RpmJ5y0kgGirIijqVrOFntfB
         YV+A==
X-Gm-Message-State: AOJu0YzON9x5N4UG5yygqSyPPeLD1shCqvIDgRArlxjkU6Ocecqjswaj
        9owhxizVdcXnIvJB1B8P6qbAMtXTbSflbfRmmz0=
X-Google-Smtp-Source: AGHT+IGLfb+7u9oW2vniB9zcMlCOLPaDY2jZbVbSQmjYAWKGctIaQUlFkYD+M/hTwKK5uH8wqI3yzw==
X-Received: by 2002:a17:902:744a:b0:1be:fc95:5de2 with SMTP id e10-20020a170902744a00b001befc955de2mr21827276plt.55.1693312314361;
        Tue, 29 Aug 2023 05:31:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc68602e54sm9336933pln.142.2023.08.29.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 05:31:53 -0700 (PDT)
Message-ID: <64ede539.170a0220.2909.f4c8@mx.google.com>
Date:   Tue, 29 Aug 2023 05:31:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230829
Subject: next/master baseline: 252 runs, 13 regressions (next-20230829)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 252 runs, 13 regressions (next-20230829)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

asus-CM1400CXA-dalboz     | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230829/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230829
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae782d4e2bf53b0b642ae860794f7a39470f995a =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda76f666723afc0286d86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda76f666723afc0286=
d87
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda784c3e572e886286d91

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda784c3e572e886286da6
        new failure (last pass: next-20230823)

    2023-08-29T08:08:31.226356  + <8>[   11.022570] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11375050_1.4.2.3.1>

    2023-08-29T08:08:31.226598  set +x

    2023-08-29T08:08:31.330835  / # #

    2023-08-29T08:08:31.433255  export SHELL=3D/bin/sh

    2023-08-29T08:08:31.434028  #

    2023-08-29T08:08:31.535718  / # export SHELL=3D/bin/sh. /lava-11375050/=
environment

    2023-08-29T08:08:31.536494  =


    2023-08-29T08:08:31.638178  / # . /lava-11375050/environment/lava-11375=
050/bin/lava-test-runner /lava-11375050/1

    2023-08-29T08:08:31.639497  =


    2023-08-29T08:08:31.644269  / # /lava-11375050/bin/lava-test-runner /la=
va-11375050/1
 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-CM1400CXA-dalboz     | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda77518994a0fe2286d86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda77518994a0fe2286=
d87
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda73fc100388423286d74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda73fc100388423286=
d75
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda77c2c022c2a53286d7e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda77d2c022c2a53286d93
        new failure (last pass: next-20230823)

    2023-08-29T08:08:20.052762  <8>[   10.587967] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-08-29T08:08:20.058228  + <8>[   10.596890] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11375091_1.4.2.3.1>

    2023-08-29T08:08:20.060208  set +x

    2023-08-29T08:08:20.162763  / # #

    2023-08-29T08:08:20.263318  export SHELL=3D/bin/sh

    2023-08-29T08:08:20.263515  #

    2023-08-29T08:08:20.364041  / # export SHELL=3D/bin/sh. /lava-11375091/=
environment

    2023-08-29T08:08:20.364207  =


    2023-08-29T08:08:20.464758  / # . /lava-11375091/environment/lava-11375=
091/bin/lava-test-runner /lava-11375091/1

    2023-08-29T08:08:20.465067  =

 =

    ... (13 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda735284e861b69286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda735284e861b69286=
d6d
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda7916079a961aa286d96

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda7916079a961aa286dab
        new failure (last pass: next-20230823)

    2023-08-29T08:08:26.019637  + <8>[   10.658818] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11375071_1.4.2.3.1>

    2023-08-29T08:08:26.019723  set +x

    2023-08-29T08:08:26.124431  / # #

    2023-08-29T08:08:26.226824  export SHELL=3D/bin/sh

    2023-08-29T08:08:26.227752  #

    2023-08-29T08:08:26.329216  / # export SHELL=3D/bin/sh. /lava-11375071/=
environment

    2023-08-29T08:08:26.329433  =


    2023-08-29T08:08:26.429912  / # . /lava-11375071/environment/lava-11375=
071/bin/lava-test-runner /lava-11375071/1

    2023-08-29T08:08:26.430211  =


    2023-08-29T08:08:26.434524  / # /lava-11375071/bin/lava-test-runner /la=
va-11375071/1
 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-14a-cb0001xx-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda774666723afc0286da4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda774666723afc0286=
da5
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda4fdf082d470f3286d6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda4fdf082d470f3286d76
        failing since 13 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-29T07:57:20.895648  + set<8>[   27.650318] <LAVA_SIGNAL_ENDRUN =
0_dmesg 76866_1.5.2.4.1>
    2023-08-29T07:57:20.896076   +x
    2023-08-29T07:57:21.009321  / # #
    2023-08-29T07:57:22.175415  export SHELL=3D/bin/sh
    2023-08-29T07:57:22.181504  #
    2023-08-29T07:57:23.625111  / # export SHELL=3D/bin/sh. /lava-76866/env=
ironment
    2023-08-29T07:57:23.631139  =

    2023-08-29T07:57:26.243763  / # . /lava-76866/environment/lava-76866/bi=
n/lava-test-runner /lava-76866/1
    2023-08-29T07:57:26.250585  =

    2023-08-29T07:57:26.255553  / # /lava-76866/bin/lava-test-runner /lava-=
76866/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda5898b04e7c021286d6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda5898b04e7c021286d75
        failing since 13 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-29T07:59:47.684646  + set<8>[   27.611570] <LAVA_SIGNAL_ENDRUN =
0_dmesg 76873_1.5.2.4.1>
    2023-08-29T07:59:47.685292   +x
    2023-08-29T07:59:47.795453  / # #
    2023-08-29T07:59:48.961660  export SHELL=3D/bin/sh
    2023-08-29T07:59:48.967804  #
    2023-08-29T07:59:50.411027  / # export SHELL=3D/bin/sh. /lava-76873/env=
ironment
    2023-08-29T07:59:50.417062  =

    2023-08-29T07:59:53.028876  / # . /lava-76873/environment/lava-76873/bi=
n/lava-test-runner /lava-76873/1
    2023-08-29T07:59:53.035717  =

    2023-08-29T07:59:53.044280  / # /lava-76873/bin/lava-test-runner /lava-=
76873/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64edac7f734df0ec3b286d6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64edac7f734df0ec3b286d76
        failing since 13 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-29T08:29:35.775761  <8>[   29.244347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-08-29T08:29:35.778455  + set<8>[   29.253697] <LAVA_SIGNAL_ENDRUN =
0_dmesg 76948_1.5.2.4.1>
    2023-08-29T08:29:35.779053   +x
    2023-08-29T08:29:35.889175  / # #
    2023-08-29T08:29:37.055447  export SHELL=3D/bin/sh
    2023-08-29T08:29:37.061528  #
    2023-08-29T08:29:38.504968  / # export SHELL=3D/bin/sh. /lava-76948/env=
ironment
    2023-08-29T08:29:38.510997  =

    2023-08-29T08:29:41.122683  / # . /lava-76948/environment/lava-76948/bi=
n/lava-test-runner /lava-76948/1
    2023-08-29T08:29:41.129427   =

    ... (13 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
lenovo-TPad-C13-Yoga-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda748c100388423286d7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eda748c100388423286=
d7f
        failing since 104 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64eda66c2b1d7354f6286d70

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230829/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eda66c2b1d7354f6286d73
        failing since 28 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-08-29T08:03:29.171813  + set +x
    2023-08-29T08:03:29.172369  <8>[   27.273026] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1002531_1.5.2.4.1>
    2023-08-29T08:03:29.281006  / # #
    2023-08-29T08:03:30.752691  export SHELL=3D/bin/sh
    2023-08-29T08:03:30.773990  #
    2023-08-29T08:03:30.774546  / # export SHELL=3D/bin/sh
    2023-08-29T08:03:32.740428  / # . /lava-1002531/environment
    2023-08-29T08:03:36.356866  /lava-1002531/bin/lava-test-runner /lava-10=
02531/1
    2023-08-29T08:03:36.378683  . /lava-1002531/environment
    2023-08-29T08:03:36.379118  / # /lava-1002531/bin/lava-test-runner /lav=
a-1002531/1 =

    ... (27 line(s) more)  =

 =20
