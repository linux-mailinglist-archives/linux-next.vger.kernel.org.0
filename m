Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08207A62E2
	for <lists+linux-next@lfdr.de>; Tue, 19 Sep 2023 14:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjISM3E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Sep 2023 08:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjISM3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Sep 2023 08:29:03 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7645F3
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 05:28:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68fcb4dc8a9so5110322b3a.2
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695126533; x=1695731333; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ElQw+MYjAmjADNFHDT5S/0uOfevXFyUZ8iAvzKPKcUU=;
        b=pS742UFJ411468jPFysyxATusJZW+/ks71rgXkPjCmHluaajmklY9hzLgy4mvQbljk
         mi/FAbTimV/PvU3Tyhe0faYU131v4jZ2J/mkUeOJn2e2k6k77QvtyOsoJvJCp5SzrbEc
         /cz0Bi6Ns8VEXeYlneWHt5QPTpQFFoxlSf1ct6u9ySxx3/+05vT/FEUY5lNCmwua+Zs2
         s/uRqZbj8QIlsZ6z2N4BZFC27rLDi9sqF8QWdSaelWmQ32rRa1jPCHdfQrIQiC4/vbLU
         nezVR93NzdGT3J2+Go0VHFfm4pLk8Uah8yiM9WXSAswlpOOfREopdihDeCgXbcnzCVUW
         7Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695126533; x=1695731333;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElQw+MYjAmjADNFHDT5S/0uOfevXFyUZ8iAvzKPKcUU=;
        b=ff5QPjMf+Te3hJHDsr8q6j7ONMQyyevIOsk+ojihcYPpxbkZOQN/WOiLHkEwQ5nMhM
         Nr/jVRAv5FjbdN7+nDdefCrP93D/YqBTmJ1Xm8/ojtCGQQLtSOFnS41UgXLy8s3XhCTN
         iurudRjGU1m2ujglHmno8upjxyFp8XBtu0KVJytmyGyLMVCv2JLyA1idsncjvGuNyiM+
         VU4f4m7XZ8mGZbdzw2B+PHkyLxNO9gsNZufLNofi0/gC02PpQjxwo/sqocnFKX17eliV
         VMkEt+PrHWqNV/JSh4ltHix14LxGZs6Y9VQZkd4LR6gO6wUtMKmObwpxoVpBKM46mD9Z
         9xoQ==
X-Gm-Message-State: AOJu0YzBDMKYDeVdTT6EpexKOEsTeMfGl5+HMTIICzkHLNqdJLDc97L6
        YXHPzTrCzNchouGixJpAXhjQmI9xATpvjR7s4On+PQ==
X-Google-Smtp-Source: AGHT+IE21EV16wZmhRuro8K+dBAvH8IzftvjAFn3Vw2+gjrpSUr5DSavSTaMfqjO1rJrK7FcdcF3KQ==
X-Received: by 2002:a05:6a20:244e:b0:151:7d4c:899c with SMTP id t14-20020a056a20244e00b001517d4c899cmr11860473pzc.25.1695126533098;
        Tue, 19 Sep 2023 05:28:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 8-20020aa79208000000b0064f76992905sm8586729pfo.202.2023.09.19.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:28:52 -0700 (PDT)
Message-ID: <65099404.a70a0220.9169d.d6ea@mx.google.com>
Date:   Tue, 19 Sep 2023 05:28:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230919
X-Kernelci-Report-Type: test
Subject: next/master baseline: 384 runs, 29 regressions (next-20230919)
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

next/master baseline: 384 runs, 29 regressions (next-20230919)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230919/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230919
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      29e400e3ea486bf942b214769fc9778098114113 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6509595a2b5049f2e28a0a52

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6509595a2b5049f2e28a0a67
        failing since 21 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-19T08:18:11.093996  + <8>[   10.760765] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11568756_1.4.2.3.1>

    2023-09-19T08:18:11.094137  set +x

    2023-09-19T08:18:11.198777  / # #

    2023-09-19T08:18:11.299392  export SHELL=3D/bin/sh

    2023-09-19T08:18:11.299591  #

    2023-09-19T08:18:11.400113  / # export SHELL=3D/bin/sh. /lava-11568756/=
environment

    2023-09-19T08:18:11.400356  =


    2023-09-19T08:18:11.501002  / # . /lava-11568756/environment/lava-11568=
756/bin/lava-test-runner /lava-11568756/1

    2023-09-19T08:18:11.502364  =


    2023-09-19T08:18:11.507417  / # /lava-11568756/bin/lava-test-runner /la=
va-11568756/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6509604f045c571cce8a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6509604f045c571cce8a0=
a5d
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65096049045c571cce8a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65096049045c571cce8a0=
a56
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650958b45c080873398a0a48

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650958b45c080873398a0a5d
        failing since 21 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-19T08:15:49.722486  + <8>[   10.254858] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11568774_1.4.2.3.1>

    2023-09-19T08:15:49.722600  set +x

    2023-09-19T08:15:49.826814  / # #

    2023-09-19T08:15:49.929358  export SHELL=3D/bin/sh

    2023-09-19T08:15:49.930055  #

    2023-09-19T08:15:50.031529  / # export SHELL=3D/bin/sh. /lava-11568774/=
environment

    2023-09-19T08:15:50.031748  =


    2023-09-19T08:15:50.132430  / # . /lava-11568774/environment/lava-11568=
774/bin/lava-test-runner /lava-11568774/1

    2023-09-19T08:15:50.133859  =


    2023-09-19T08:15:50.138274  / # /lava-11568774/bin/lava-test-runner /la=
va-11568774/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650960353d50f82a988a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650960353d50f82a988a0=
a43
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6509598255a2e5aea58a0a43

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6509598255a2e5aea58a0a58
        failing since 21 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-19T08:18:54.220666  + <8>[   10.913105] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11568731_1.4.2.3.1>

    2023-09-19T08:18:54.221092  set +x

    2023-09-19T08:18:54.325295  / # #

    2023-09-19T08:18:54.427304  export SHELL=3D/bin/sh

    2023-09-19T08:18:54.427461  #

    2023-09-19T08:18:54.527972  / # export SHELL=3D/bin/sh. /lava-11568731/=
environment

    2023-09-19T08:18:54.528132  =


    2023-09-19T08:18:54.628808  / # . /lava-11568731/environment/lava-11568=
731/bin/lava-test-runner /lava-11568731/1

    2023-09-19T08:18:54.629823  =


    2023-09-19T08:18:54.634578  / # /lava-11568731/bin/lava-test-runner /la=
va-11568731/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650960520b908a876d8a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650960520b908a876d8a0=
a50
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650960640b908a876d8a0a8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650960640b908a876d8a0=
a8d
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6509599955a2e5aea58a0a6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6509599955a2e5aea58a0=
a6c
        new failure (last pass: next-20230906) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65095f6e29b1b480eb8a0b97

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095f6e29b1b480eb8a0ba0
        failing since 34 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-19T08:44:13.027463  =

    2023-09-19T08:44:14.192885  / # #export SHELL=3D/bin/sh
    2023-09-19T08:44:14.198994  =

    2023-09-19T08:44:15.698114  / # export SHELL=3D/bin/sh. /lava-116691/en=
vironment
    2023-09-19T08:44:15.704148  =

    2023-09-19T08:44:18.427293  / # . /lava-116691/environment/lava-116691/=
bin/lava-test-runner /lava-116691/1
    2023-09-19T08:44:18.434078  =

    2023-09-19T08:44:18.450277  / # /lava-116691/bin/lava-test-runner /lava=
-116691/1
    2023-09-19T08:44:18.463794  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-19T08:44:18.467199  + cd /l<8>[   35.353744] <LAVA_SIGNAL_START=
RUN 1_bootrr 116691_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/650962f389b183396b8a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650962f389b183396b8a0a4b
        failing since 34 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-19T08:59:01.011075  + set<8>[   28.938158] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116715_1.5.2.4.1>
    2023-09-19T08:59:01.011646   +x
    2023-09-19T08:59:01.120594  / # #
    2023-09-19T08:59:02.283553  export SHELL=3D/bin/sh
    2023-09-19T08:59:02.289232  #
    2023-09-19T08:59:03.786889  / # export SHELL=3D/bin/sh. /lava-116715/en=
vironment
    2023-09-19T08:59:03.792712  =

    2023-09-19T08:59:06.515810  / # . /lava-116715/environment/lava-116715/=
bin/lava-test-runner /lava-116715/1
    2023-09-19T08:59:06.522480  =

    2023-09-19T08:59:06.533713  / # /lava-116715/bin/lava-test-runner /lava=
-116715/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/650956d579b54a8dc98a0a5e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650956d579b54a8dc98a0a67
        failing since 34 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-19T08:07:25.829350  + set<8>[   28.089602] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116504_1.5.2.4.1>
    2023-09-19T08:07:25.829958   +x
    2023-09-19T08:07:25.940126  / # #
    2023-09-19T08:07:27.106377  export SHELL=3D/bin/sh
    2023-09-19T08:07:27.112511  #
    2023-09-19T08:07:28.611553  / # export SHELL=3D/bin/sh. /lava-116504/en=
vironment
    2023-09-19T08:07:28.617612  =

    2023-09-19T08:07:31.340829  / # . /lava-116504/environment/lava-116504/=
bin/lava-test-runner /lava-116504/1
    2023-09-19T08:07:31.347760  =

    2023-09-19T08:07:31.364135  / # /lava-116504/bin/lava-test-runner /lava=
-116504/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65095864003b6e19a08a0a64

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095865003b6e19a08a0a6d
        failing since 34 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-19T08:14:14.747273  + set<8>[   29.337875] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116518_1.5.2.4.1>
    2023-09-19T08:14:14.747900   +x
    2023-09-19T08:14:14.856694  / # #
    2023-09-19T08:14:16.021525  export SHELL=3D/bin/sh
    2023-09-19T08:14:16.027610  #
    2023-09-19T08:14:17.522876  / # export SHELL=3D/bin/sh. /lava-116518/en=
vironment
    2023-09-19T08:14:17.529074  =

    2023-09-19T08:14:20.245270  / # . /lava-116518/environment/lava-116518/=
bin/lava-test-runner /lava-116518/1
    2023-09-19T08:14:20.251900  =

    2023-09-19T08:14:20.266824  / # /lava-116518/bin/lava-test-runner /lava=
-116518/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65095bfde66d8ceec58a0b04

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095bfde66d8ceec58a0b0d
        failing since 34 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-19T08:29:26.029694  + set<8>[   26.931706] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116592_1.5.2.4.1>
    2023-09-19T08:29:26.033320   +x
    2023-09-19T08:29:26.139308  / # #
    2023-09-19T08:29:27.305126  export SHELL=3D/bin/sh
    2023-09-19T08:29:27.311206  #
    2023-09-19T08:29:28.809717  / # export SHELL=3D/bin/sh. /lava-116592/en=
vironment
    2023-09-19T08:29:28.815830  =

    2023-09-19T08:29:31.538446  / # . /lava-116592/environment/lava-116592/=
bin/lava-test-runner /lava-116592/1
    2023-09-19T08:29:31.545105  =

    2023-09-19T08:29:31.552448  / # /lava-116592/bin/lava-test-runner /lava=
-116592/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65095c8917ef9d152a8a0a86

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095c8917ef9d152a8a0a8f
        failing since 34 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-19T08:31:49.296075  + set<8>[   29.998638] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116627_1.5.2.4.1>
    2023-09-19T08:31:49.296978   +x
    2023-09-19T08:31:49.401798  / # #
    2023-09-19T08:31:50.562446  export SHELL=3D/bin/sh
    2023-09-19T08:31:50.568225  #
    2023-09-19T08:31:52.061629  / # export SHELL=3D/bin/sh. /lava-116627/en=
vironment
    2023-09-19T08:31:52.067172  =

    2023-09-19T08:31:54.780574  / # . /lava-116627/environment/lava-116627/=
bin/lava-test-runner /lava-116627/1
    2023-09-19T08:31:54.786860  =

    2023-09-19T08:31:54.800211  / # /lava-116627/bin/lava-test-runner /lava=
-116627/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/650962a0d28f1b6b188a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650962a0d28f1b6b188a0=
a45
        failing since 48 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650960404d95b106478a0ad2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650960404d95b106478a0=
ad3
        failing since 125 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65095576ec2269ce0a8a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65095576ec2269ce0a8a0=
a54
        failing since 237 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6509558a452718e0c48a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6509558a452718e0c48a0=
a43
        failing since 223 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/65095c6bd1228f069e8a0bb4

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65095c6bd1228f0=
69e8a0bb7
        new failure (last pass: next-20230918)
        1 lines

    2023-09-19T08:30:19.515656  <8>[   16.838234] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>

    2023-09-19T08:30:19.521408  <4>[   16.844921] pstate: a0000005 (NzCv da=
if -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)

    2023-09-19T08:30:19.527805  ter dereference at virtual addre<4>[   16.8=
44928] pc : scp_get_rproc+0x0/0x8 [mtk_scp]

    2023-09-19T08:30:19.534804  <4>[   16.844947] lr : mdp_probe+0x154/0x34=
0 [mtk_mdp3]

    2023-09-19T08:30:19.541677  <8>[   16.867105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65095c6bd1228f0=
69e8a0bb8
        failing since 5 days (last pass: next-20230913, first fail: next-20=
230914)
        13 lines

    2023-09-19T08:30:19.488156  <4>[   16.815447] Hardware name: Google jun=
iper sku16 board (DT)

    2023-09-19T08:30:19.491430   +x

    2023-09-19T08:30:19.494527  + KERNELCI_LAVA=3Dy /bin/sh /opt/kernelci/d=
mesg.sh

    2023-09-19T08:30:19.504905  kern  :alert : Unable to handle kernel NULL=
 poin<4>[   16.815453] Workqueue: events_unbound deferred_probe_work_func
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65095572aeb5b294478a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65095572aeb5b294478a0=
a43
        failing since 223 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65095c792ee20f8f0d8a0a62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65095c792ee20f8f0d8a0=
a63
        new failure (last pass: next-20230918) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65095fb5fc8a1bf34b8a0b39

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095fb5fc8a1bf34b8a0b40
        failing since 55 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-19T08:45:15.393070  / # #
    2023-09-19T08:45:16.854880  export SHELL=3D/bin/sh
    2023-09-19T08:45:16.875401  #
    2023-09-19T08:45:16.875606  / # export SHELL=3D/bin/sh
    2023-09-19T08:45:18.830659  / # . /lava-1010053/environment
    2023-09-19T08:45:22.429323  /lava-1010053/bin/lava-test-runner /lava-10=
10053/1
    2023-09-19T08:45:22.450136  . /lava-1010053/environment
    2023-09-19T08:45:22.450249  / # /lava-1010053/bin/lava-test-runner /lav=
a-1010053/1
    2023-09-19T08:45:22.533109  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-19T08:45:22.533330  + cd /lava-1010053/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65095f484c7696c2ab8a0abe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65095f484c7696c2ab8a0ac7
        failing since 55 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-19T08:43:49.567040  / # #

    2023-09-19T08:43:50.646966  export SHELL=3D/bin/sh

    2023-09-19T08:43:50.648839  #

    2023-09-19T08:43:52.139165  / # export SHELL=3D/bin/sh. /lava-11568992/=
environment

    2023-09-19T08:43:52.141127  =


    2023-09-19T08:43:54.864629  / # . /lava-11568992/environment/lava-11568=
992/bin/lava-test-runner /lava-11568992/1

    2023-09-19T08:43:54.866755  =


    2023-09-19T08:43:54.875861  / # /lava-11568992/bin/lava-test-runner /la=
va-11568992/1

    2023-09-19T08:43:54.935433  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-19T08:43:54.935923  + cd /lava-115689<8>[   29.449607] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11568992_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65095465d4c735034b8a0a4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65095465d4c735034b8a0=
a4c
        failing since 223 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6509603a4d95b106478a0acc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230914073358+e22c=
30414e54-1~exp1~20230914073509.41))
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6509603a4d95b106478a0=
acd
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6509555628bebb17cb8a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6509555628bebb17cb8a0=
a51
        failing since 105 days (last pass: next-20230601, first fail: next-=
20230606) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/650959b7edec7aa0d18a0a42

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230919/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/650959b7edec7aa=
0d18a0a47
        failing since 12 days (last pass: next-20230816, first fail: next-2=
0230906)
        1 lines

    2023-09-19T08:19:44.700284  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#1 stuck for 43s! [kworker/u8:2:56]
    2023-09-19T08:19:44.839302  <8>[   90.573500][  T197] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20
