Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2D279A480
	for <lists+linux-next@lfdr.de>; Mon, 11 Sep 2023 09:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjIKHa4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Sep 2023 03:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjIKHaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Sep 2023 03:30:55 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A58BCD2
        for <linux-next@vger.kernel.org>; Mon, 11 Sep 2023 00:30:47 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-273e17ac19eso1443922a91.1
        for <linux-next@vger.kernel.org>; Mon, 11 Sep 2023 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694417447; x=1695022247; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UlixkGQWNgti+WgvUcHK5oQ71/gMFZPn2O9a1biHW6o=;
        b=WuKB8PU2XfrySywYdr2lW8Ud9p+Nw7nvmTJDbrsyvzzHq2m/yIGN+VvC0jBHS91Yg5
         k4o6ouK7KkVpUva0YsiTFhYjsBWOWuir68m+5v9OssppCMh1iZ2mid8GGp1z24rg2ROO
         U1XzUQyzFd+EuLqeXnGZ/emZdBxQbZeNTZB9ijeuutHmkf/L94XAvmLnVSH9QMqbB6Gs
         VDYmOCXaEvnGc8+5rKnS8dTh1Eb21hLsjr6+bf9+7d2mcioiNngH7/1qrs1lAsK8etuT
         hPm38/nPBQPBalHUYXASlMGz60LutMnbRIvkCvglSRBEsk6avYISnFjMNqcz2Wp87djO
         +rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417447; x=1695022247;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlixkGQWNgti+WgvUcHK5oQ71/gMFZPn2O9a1biHW6o=;
        b=Yn38gj11Qn5E+o2yiH6G1ip3opSP+0S1Vn1bFQduihdPwOLKggVACslVDnc0ubVtk6
         i+J952GtIKT19p32GPIqnZZpJFRzb4cQ//pwI451vFuAMjd3Mwbxwj9/LLIzeLKOx7dw
         xmzSt0PK5dGxK4rSa92KcWlpH+Vzoc/i8y4pNJGetDIwEE+4/cAZDLbODwq0foYjI+jV
         0wlA+gGBoaMyhfkaMZneFJs3CE7QcQgKG9seDW2VcBbNNdSUn+DortTm/1cAdXAIXRMU
         psj/Q6v5FLji5it2M3noJ0f6Zj3+5VC9qK4vyXYFmwlccmb8c3h4tF/sv7LEj30HK6ol
         T07g==
X-Gm-Message-State: AOJu0YzTuWbVzj0TtKmgYyvJWuLd8uBLQTJbYsFKuzrx3N3EV3mcRjw+
        dua9+BtKUWL44t68ZS0yhWQPqSg310HiHGEv+Ig=
X-Google-Smtp-Source: AGHT+IEhOiiVR/bGulgj6nB+qGJfXlfjfh47yJbBLVn4IhghojY+HgW6PzNQO5xn4B1ZcaEOboS0yA==
X-Received: by 2002:a17:90b:350f:b0:26d:262e:70be with SMTP id ls15-20020a17090b350f00b0026d262e70bemr6109360pjb.22.1694417446383;
        Mon, 11 Sep 2023 00:30:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x6-20020a17090a9dc600b0026b70d2a8a2sm5029503pjv.29.2023.09.11.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:30:45 -0700 (PDT)
Message-ID: <64fec225.170a0220.cf62e.b144@mx.google.com>
Date:   Mon, 11 Sep 2023 00:30:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230911
Subject: next/master baseline: 309 runs, 21 regressions (next-20230911)
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

next/master baseline: 309 runs, 21 regressions (next-20230911)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230911/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230911
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7bc675554773f09d88101bf1ccfc8537dc7c0be9 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe86e482afb46fb0286d83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe86e482afb46fb0286=
d84
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe89b503b3577cff286d7e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe89b503b3577cff286d93
        failing since 12 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-11T03:29:39.066474  + <8>[   11.208367] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11490939_1.4.2.3.1>

    2023-09-11T03:29:39.066569  set +x

    2023-09-11T03:29:39.171043  / # #

    2023-09-11T03:29:39.271678  export SHELL=3D/bin/sh

    2023-09-11T03:29:39.271896  #

    2023-09-11T03:29:39.372549  / # export SHELL=3D/bin/sh. /lava-11490939/=
environment

    2023-09-11T03:29:39.372802  =


    2023-09-11T03:29:39.473365  / # . /lava-11490939/environment/lava-11490=
939/bin/lava-test-runner /lava-11490939/1

    2023-09-11T03:29:39.473664  =


    2023-09-11T03:29:39.478476  / # /lava-11490939/bin/lava-test-runner /la=
va-11490939/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe870082afb46fb0286dd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe870082afb46fb0286=
dd9
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe86c88328a3b1cd286d91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe86c88328a3b1cd286=
d92
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8999f5cb50646b286d96

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8999f5cb50646b286dab
        failing since 12 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-11T03:29:12.873265  <8>[   10.155734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-09-11T03:29:12.879534  + <8>[   10.164681] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11490913_1.4.2.3.1>

    2023-09-11T03:29:12.881267  set +x

    2023-09-11T03:29:12.982575  #

    2023-09-11T03:29:12.982890  =


    2023-09-11T03:29:13.083523  / # #export SHELL=3D/bin/sh

    2023-09-11T03:29:13.083752  =


    2023-09-11T03:29:13.184255  / # export SHELL=3D/bin/sh. /lava-11490913/=
environment

    2023-09-11T03:29:13.184454  =


    2023-09-11T03:29:13.284995  / # . /lava-11490913/environment/lava-11490=
913/bin/lava-test-runner /lava-11490913/1
 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe86c58328a3b1cd286d8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe86c58328a3b1cd286=
d8c
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe89abb99ce79c6f286d6c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe89abb99ce79c6f286d81
        failing since 12 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-11T03:29:46.731211  + <8>[   10.913937] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11490943_1.4.2.3.1>

    2023-09-11T03:29:46.731709  set +x

    2023-09-11T03:29:46.839068  / # #

    2023-09-11T03:29:46.941253  export SHELL=3D/bin/sh

    2023-09-11T03:29:46.942005  #

    2023-09-11T03:29:47.043645  / # export SHELL=3D/bin/sh. /lava-11490943/=
environment

    2023-09-11T03:29:47.044353  =


    2023-09-11T03:29:47.145907  / # . /lava-11490943/environment/lava-11490=
943/bin/lava-test-runner /lava-11490943/1

    2023-09-11T03:29:47.147082  =


    2023-09-11T03:29:47.151648  / # /lava-11490943/bin/lava-test-runner /la=
va-11490943/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe86ec82afb46fb0286d9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe86ec82afb46fb0286=
da0
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe88db3be8fc19ed286dd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe88db3be8fc19ed286=
dda
        failing since 39 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe86c3e90600901a286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe86c3e90600901a286=
d6d
        failing since 117 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9252c2662f45ee286d70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe9252c2662f45ee286=
d71
        failing since 229 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9260c1defcb81e286d76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe9260c1defcb81e286=
d77
        failing since 214 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe92ab57cb6ef6b2286d6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe92ab57cb6ef6b2286=
d6e
        failing since 214 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe84a0cb10db6169286daf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe84a0cb10db6169286=
db0
        new failure (last pass: next-20230906) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8493bcebe7b6da286e4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8493bcebe7b6da286e52
        failing since 40 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-09-11T03:07:33.333630  + set +x
    2023-09-11T03:07:33.336810  <8>[   27.262028] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1007574_1.5.2.4.1>
    2023-09-11T03:07:33.443826  / # #
    2023-09-11T03:07:34.908511  export SHELL=3D/bin/sh
    2023-09-11T03:07:34.929462  #
    2023-09-11T03:07:34.929928  / # export SHELL=3D/bin/sh
    2023-09-11T03:07:36.888131  / # . /lava-1007574/environment
    2023-09-11T03:07:40.490405  /lava-1007574/bin/lava-test-runner /lava-10=
07574/1
    2023-09-11T03:07:40.511871  . /lava-1007574/environment
    2023-09-11T03:07:40.512292  / # /lava-1007574/bin/lava-test-runner /lav=
a-1007574/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8b3fc78287a599286d72

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8b3fc78287a599286d75
        failing since 46 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-11T03:36:09.780815  / # #
    2023-09-11T03:36:11.243880  export SHELL=3D/bin/sh
    2023-09-11T03:36:11.264512  #
    2023-09-11T03:36:11.264719  / # export SHELL=3D/bin/sh
    2023-09-11T03:36:13.221191  / # . /lava-1007595/environment
    2023-09-11T03:36:16.824730  /lava-1007595/bin/lava-test-runner /lava-10=
07595/1
    2023-09-11T03:36:16.845510  . /lava-1007595/environment
    2023-09-11T03:36:16.845622  / # /lava-1007595/bin/lava-test-runner /lav=
a-1007595/1
    2023-09-11T03:36:16.927926  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-11T03:36:16.928142  + cd /lava-1007595/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8ac0993567fbfa286ddd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8ac0993567fbfa286de6
        failing since 46 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-11T03:35:47.370815  / # #

    2023-09-11T03:35:47.472966  export SHELL=3D/bin/sh

    2023-09-11T03:35:47.473673  #

    2023-09-11T03:35:47.574965  / # export SHELL=3D/bin/sh. /lava-11490994/=
environment

    2023-09-11T03:35:47.575676  =


    2023-09-11T03:35:47.677090  / # . /lava-11490994/environment/lava-11490=
994/bin/lava-test-runner /lava-11490994/1

    2023-09-11T03:35:47.678173  =


    2023-09-11T03:35:47.694879  / # /lava-11490994/bin/lava-test-runner /la=
va-11490994/1

    2023-09-11T03:35:47.745103  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T03:35:47.745616  + cd /lava-114909<8>[   20.463696] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11490994_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8acc93118acded286dba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8acc93118acded286dc3
        failing since 46 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-11T03:35:57.294570  / # #

    2023-09-11T03:35:58.374953  export SHELL=3D/bin/sh

    2023-09-11T03:35:58.376701  #

    2023-09-11T03:35:59.866890  / # export SHELL=3D/bin/sh. /lava-11491000/=
environment

    2023-09-11T03:35:59.868239  =


    2023-09-11T03:36:02.591933  / # . /lava-11491000/environment/lava-11491=
000/bin/lava-test-runner /lava-11491000/1

    2023-09-11T03:36:02.594287  =


    2023-09-11T03:36:02.604846  / # /lava-11491000/bin/lava-test-runner /la=
va-11491000/1

    2023-09-11T03:36:02.663969  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T03:36:02.664485  + cd /lava-114910<8>[   28.496263] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11491000_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe939991474ed0f2286d77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe939991474ed0f2286=
d78
        failing since 214 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe8ad5f638993ae3286d6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe8ad5f638993ae3286d75
        failing since 46 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-11T03:36:01.173318  / # #

    2023-09-11T03:36:01.273931  export SHELL=3D/bin/sh

    2023-09-11T03:36:01.274097  #

    2023-09-11T03:36:01.374618  / # export SHELL=3D/bin/sh. /lava-11491002/=
environment

    2023-09-11T03:36:01.374758  =


    2023-09-11T03:36:01.475605  / # . /lava-11491002/environment/lava-11491=
002/bin/lava-test-runner /lava-11491002/1

    2023-09-11T03:36:01.475910  =


    2023-09-11T03:36:01.486921  / # /lava-11491002/bin/lava-test-runner /la=
va-11491002/1

    2023-09-11T03:36:01.557819  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T03:36:01.557900  + cd /lava-1149100<8>[   19.212803] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11491002_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe922fe1c807aa40286d73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230911/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64fe9230e1c807aa40286=
d74
        failing since 96 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =20
