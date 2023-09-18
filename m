Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BAE7A45E0
	for <lists+linux-next@lfdr.de>; Mon, 18 Sep 2023 11:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbjIRJ1q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Sep 2023 05:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239242AbjIRJ1Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Sep 2023 05:27:25 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E0A120
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 02:27:05 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3add37de892so435074b6e.1
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695029224; x=1695634024; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XVao+it7dHfypJb5mQCYR0VvuKbu8kaGzqpqYCfr8bw=;
        b=hzyJD+6/9cVhThZ522YC78FaZRGPP1GWlfgUKl6H2Zbj0T6usHhYR7q86Dz2K5Izdm
         mfsIR0BTyizeqj6ZiUbDgpBd/ZYD37X20jPslX1LuunhhdrloWphty/oeBcVii6oRi9e
         IQyZcaZGMShIHXpGGPe5pl7U8chUXA1ZVLJk3QRC33MSc6z+BPizGpcZjsW7Z1x/ZOpn
         cBIS23IqiLeUUw/xeYVswuAy+jIKiGAaMtCpKIgx1ra3ZQyTj56PuJoYXP7mtAyzvgaY
         LDVZRxORdd81fVtYsLJAv7V5gmtiBBSe5bfHqs0Homtr6z5GebiHX9RQ5cj/UWjRDJve
         dQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029224; x=1695634024;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVao+it7dHfypJb5mQCYR0VvuKbu8kaGzqpqYCfr8bw=;
        b=mqvOvwJtNoKBB765bfKhfqRUtruP83XHW9W7ZbbXia3RELWHvCYgoD2YUFevJ8iv4D
         10+AKlcERMhsJcyy1ZKwi6g6HeNpj3JOkuS/tn/5p5wbOOP7uUKiMYyGAD2CSFpETPwp
         DZdZEao0SlChEXf2aIUZfSsXeeGFbQI63WIkXI49hESsuRGQQedTHQ67M+sIy/pekoXK
         b7YjurgRPD/HwpmSD4AZdQ/vqqV1Syke5RPD9zl4z5zyaWMVr5AIRF8pMh6ipaEXFgCp
         7TelBzcFZ6XiQcTaaVfgSWgkTOplW9mbC1v62ElkZ6FCwudjNoEbcMEarnJnokhyZnAY
         EKPA==
X-Gm-Message-State: AOJu0YxTzGQ4sWw948N5nwxaQLzrA4iZ2EHI2Que0vC7OnMBmdlpH3FZ
        gZM/VuW5H7NNBXENOzT9IO47MMuiCfWsaGM3Sci9UQ==
X-Google-Smtp-Source: AGHT+IFvcJz89RexT60qzTDwBwAgRhlNQlfvMwrFsJf5O9I06mneHdNn5XjLnur3j2M9GHSwgvaYDA==
X-Received: by 2002:a05:6870:ec92:b0:1d0:dbdd:2792 with SMTP id eo18-20020a056870ec9200b001d0dbdd2792mr8787668oab.39.1695029224176;
        Mon, 18 Sep 2023 02:27:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g11-20020a63b14b000000b00565eb4fa8d1sm6376112pgp.16.2023.09.18.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:27:03 -0700 (PDT)
Message-ID: <650817e7.630a0220.5eb2c.5674@mx.google.com>
Date:   Mon, 18 Sep 2023 02:27:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230918
X-Kernelci-Report-Type: test
Subject: next/master baseline: 332 runs, 36 regressions (next-20230918)
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

next/master baseline: 332 runs, 36 regressions (next-20230918)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 7          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230918/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230918
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7fc7222d9680366edeecc219c21ca96310bdbc10 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e40156c113ee4d8a0a66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e40156c113ee4d8a0=
a67
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e41d93b05e24e48a0a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e41d93b05e24e48a0=
a6e
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e40a56c113ee4d8a0a89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e40a56c113ee4d8a0=
a8a
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e3d5534567fbc18a0b35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e3d5534567fbc18a0=
b36
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e41ec98e0fd6228a0a5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e41ec98e0fd6228a0=
a5f
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507dd78678562c0158a0a53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507dd78678562c0158a0a5c
        failing since 33 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-18T05:17:20.427003  + set<8>[   27.469291] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114323_1.5.2.4.1>
    2023-09-18T05:17:20.427398   +x
    2023-09-18T05:17:20.536162  / # #
    2023-09-18T05:17:21.702190  export SHELL=3D/bin/sh
    2023-09-18T05:17:21.708290  #
    2023-09-18T05:17:23.207370  / # export SHELL=3D/bin/sh. /lava-114323/en=
vironment
    2023-09-18T05:17:23.213384  =

    2023-09-18T05:17:25.937125  / # . /lava-114323/environment/lava-114323/=
bin/lava-test-runner /lava-114323/1
    2023-09-18T05:17:25.943840  =

    2023-09-18T05:17:25.947270  / # /lava-114323/bin/lava-test-runner /lava=
-114323/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6507d737364ff473fa8a0a74

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507d737364ff473fa8a0a7d
        failing since 33 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-18T04:50:50.131946  + set<8>[   28.434328] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114164_1.5.2.4.1>
    2023-09-18T04:50:50.132555   +x
    2023-09-18T04:50:50.240978  / # #
    2023-09-18T04:50:51.406949  export SHELL=3D/bin/sh
    2023-09-18T04:50:51.413091  #
    2023-09-18T04:50:52.912225  / # export SHELL=3D/bin/sh. /lava-114164/en=
vironment
    2023-09-18T04:50:52.918268  =

    2023-09-18T04:50:55.641584  / # . /lava-114164/environment/lava-114164/=
bin/lava-test-runner /lava-114164/1
    2023-09-18T04:50:55.648307  =

    2023-09-18T04:50:55.662052  / # /lava-114164/bin/lava-test-runner /lava=
-114164/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507dcec4676c98a258a0a45

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507dcec4676c98a258a0a4e
        failing since 33 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-18T05:15:04.787998  + set<8>[   28.090249] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114276_1.5.2.4.1>
    2023-09-18T05:15:04.788582   +x
    2023-09-18T05:15:04.897101  / # #
    2023-09-18T05:15:06.063094  export SHELL=3D/bin/sh
    2023-09-18T05:15:06.069175  #
    2023-09-18T05:15:07.567621  / # export SHELL=3D/bin/sh. /lava-114276/en=
vironment
    2023-09-18T05:15:07.573729  =

    2023-09-18T05:15:10.297244  / # . /lava-114276/environment/lava-114276/=
bin/lava-test-runner /lava-114276/1
    2023-09-18T05:15:10.303936  =

    2023-09-18T05:15:10.306698  / # /lava-114276/bin/lava-test-runner /lava=
-114276/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e1259b2ca641a18a0ad2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507e1259b2ca641a18a0adb
        failing since 33 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-18T05:33:07.432062  + set<8>[   27.188387] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114363_1.5.2.4.1>
    2023-09-18T05:33:07.432485   +x
    2023-09-18T05:33:07.542812  / # #
    2023-09-18T05:33:08.708999  export SHELL=3D/bin/sh
    2023-09-18T05:33:08.715125  #
    2023-09-18T05:33:10.214247  / # export SHELL=3D/bin/sh. /lava-114363/en=
vironment
    2023-09-18T05:33:10.220258  =

    2023-09-18T05:33:12.942849  / # . /lava-114363/environment/lava-114363/=
bin/lava-test-runner /lava-114363/1
    2023-09-18T05:33:12.949720  =

    2023-09-18T05:33:12.951994  / # /lava-114363/bin/lava-test-runner /lava=
-114363/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e5eb26cdc90b878a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507e5eb26cdc90b878a0a4b
        failing since 33 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-18T05:53:32.915186  + set<8>[   27.517814] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114403_1.5.2.4.1>
    2023-09-18T05:53:32.915764   +x
    2023-09-18T05:53:33.026898  / # #
    2023-09-18T05:53:34.192974  export SHELL=3D/bin/sh
    2023-09-18T05:53:34.199071  #
    2023-09-18T05:53:35.698278  / # export SHELL=3D/bin/sh. /lava-114403/en=
vironment
    2023-09-18T05:53:35.704399  =

    2023-09-18T05:53:38.427367  / # . /lava-114403/environment/lava-114403/=
bin/lava-test-runner /lava-114403/1
    2023-09-18T05:53:38.433993  =

    2023-09-18T05:53:38.437681  / # /lava-114403/bin/lava-test-runner /lava=
-114403/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507dd366bc65eab908a0ac4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507dd366bc65eab908a0=
ac5
        failing since 46 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e3f956c113ee4d8a0a52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e3f956c113ee4d8a0=
a53
        failing since 124 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/6507dccd8af19a106d8a0a4e

  Results:     41 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6507dccd8=
af19a106d8a0a55
        new failure (last pass: next-20230915)

    2023-09-18T05:14:41.581422  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:41.592495  <8>[   29.309117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
07dccd8af19a106d8a0a56
        new failure (last pass: next-20230915)

    2023-09-18T05:14:40.365765  <3>[   28.083428] mmc0: error -84 whilst in=
itialising SD card
    2023-09-18T05:14:40.560951  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:40.572927  <8>[   28.288969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.dw-hdmi-i2s-audio-driver-present: https://kernelci.org/=
test/case/id/6507dccd8af19a106d8a0a5e
        new failure (last pass: next-20230915)

    2023-09-18T05:14:38.253602  <3>[   25.971332] mmc0: error -84 whilst in=
itialising SD card
    2023-09-18T05:14:38.360177  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:38.372740  <8>[   26.087386] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddw-hdmi-i2s-audio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.lima-driver-present: https://kernelci.org/test/case/id/=
6507dccd8af19a106d8a0a61
        new failure (last pass: next-20230915)

    2023-09-18T05:14:35.210481  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:35.221782  <8>[   22.938523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddrm-probed RESULT=3Dblocked>
    2023-09-18T05:14:36.141137  <3>[   23.859237] mmc0: error -84 whilst in=
itialising SD card
    2023-09-18T05:14:36.243168  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:36.254482  <8>[   23.970772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-drm-driver-present: https://kernelci.org/test/cas=
e/id/6507dccd8af19a106d8a0a62
        new failure (last pass: next-20230915)

    2023-09-18T05:14:33.142366  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:33.153566  <8>[   20.869829] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-tx-present RESULT=3Dblocked>
    2023-09-18T05:14:34.029298  <3>[   21.747253] mmc0: error -84 whilst in=
itialising SD card
    2023-09-18T05:14:34.175263  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:34.186903  <8>[   21.902816] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-drm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/6507dccd8af19a106d8a0a63
        new failure (last pass: next-20230915)

    2023-09-18T05:14:31.919314  <3>[   19.637203] mmc0: error -84 whilst in=
itialising SD card
    2023-09-18T05:14:32.107393  /lava-114293/1/../bin/lava-test-case
    2023-09-18T05:14:32.119924  <8>[   19.835325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507dccd8af19a106d8a0a82
        new failure (last pass: next-20230915)

    2023-09-18T05:14:28.945311  <8>[   16.660082] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 114293_1.5.2.4.1>
    2023-09-18T05:14:29.052732  / # #
    2023-09-18T05:14:29.154667  export SHELL=3D/bin/sh
    2023-09-18T05:14:29.155279  #
    2023-09-18T05:14:29.256854  / # export SHELL=3D/bin/sh. /lava-114293/en=
vironment
    2023-09-18T05:14:29.257321  =

    2023-09-18T05:14:29.358879  / # . /lava-114293/environment/lava-114293/=
bin/lava-test-runner /lava-114293/1
    2023-09-18T05:14:29.359725  =

    2023-09-18T05:14:29.364080  / # /lava-114293/bin/lava-test-runner /lava=
-114293/1
    2023-09-18T05:14:29.402723  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e52ef6c11c0cb88a0a8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e52ef6c11c0cb88a0=
a8d
        failing since 236 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6507deda1391b51a188a0a43

  Results:     164 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6507dedb1391b51=
a188a0a47
        failing since 4 days (last pass: next-20230913, first fail: next-20=
230914)
        4 lines

    2023-09-18T05:23:09.040315  <1>[   16.689508]   ESR =3D 0x0000000096000=
004

    2023-09-18T05:23:09.046863  <1>[   16.702049]   EC =3D 0x25: DABT (curr=
ent EL), IL =3D 32 bits

    2023-09-18T05:23:09.050392  <1>[   16.707644]   SET =3D 0, FnV =3D 0

    2023-09-18T05:23:09.053646  <1>[   16.710965]   EA =3D 0, S1PTW =3D 0

    2023-09-18T05:23:09.059990  <8>[   16.711097] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
   =


  * baseline.bootrr.mtk-jpeg-probed: https://kernelci.org/test/case/id/6507=
dedb1391b51a188a0a7e
        failing since 4 days (last pass: next-20230913, first fail: next-20=
230914)

    2023-09-18T05:23:16.631390  /lava-11561138/1/../bin/lava-test-case

    2023-09-18T05:23:16.641393  <8>[   24.294364] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-jpeg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-scp-probed: https://kernelci.org/test/case/id/6507d=
edb1391b51a188a0a80
        failing since 4 days (last pass: next-20230913, first fail: next-20=
230914)

    2023-09-18T05:23:15.578516  /lava-11561138/1/../bin/lava-test-case

    2023-09-18T05:23:15.588895  <8>[   23.241770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-scp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e531f6c11c0cb88a0a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e531f6c11c0cb88a0=
a90
        failing since 222 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6507e623235025a54c8a0a5f

  Results:     164 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6507e623235025a=
54c8a0a62
        new failure (last pass: next-20230913)
        2 lines

    2023-09-18T05:55:36.526591  at virtual address 0000000000000008

    2023-09-18T05:55:36.529372  kern  :alert : Mem abort info:

    2023-09-18T05:55:36.533040  kern  :alert :   ESR =3D 0x0000000096000006

    2023-09-18T05:55:36.536197  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-09-18T05:55:36.539188  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-09-18T05:55:36.542405  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-09-18T05:55:36.552511  kern  :alert<8>[   17.581719] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6507e623235025a=
54c8a0a63
        new failure (last pass: next-20230913)
        13 lines

    2023-09-18T05:55:36.523009  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   17.551453] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
   =


  * baseline.bootrr.mtk-scp-probed: https://kernelci.org/test/case/id/6507e=
623235025a54c8a0a9c
        new failure (last pass: next-20230913)

    2023-09-18T05:55:42.753936  /lava-11561357/1/../bin/lava-test-case

    2023-09-18T05:55:42.765324  <8>[   23.794751] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-scp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e5337fea809fcb8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e5337fea809fcb8a0=
a43
        failing since 222 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e678cebcb24fb28a0bab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e678cebcb24fb28a0=
bac
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e2e3aee0f863358a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e2e3aee0f863358a0=
a43
        failing since 4 days (last pass: next-20230912, first fail: next-20=
230913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e141f24e50098a8a0a55

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507e141f24e50098a8a0a5c
        failing since 40 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-18T05:33:28.738423  + set +x
    2023-09-18T05:33:28.741710  <8>[   28.489812] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1009790_1.5.2.4.1>
    2023-09-18T05:33:28.849978  / # #
    2023-09-18T05:33:30.314551  export SHELL=3D/bin/sh
    2023-09-18T05:33:30.335509  #
    2023-09-18T05:33:30.335980  / # export SHELL=3D/bin/sh
    2023-09-18T05:33:32.293797  / # . /lava-1009790/environment
    2023-09-18T05:33:35.895699  /lava-1009790/bin/lava-test-runner /lava-10=
09790/1
    2023-09-18T05:33:35.917168  . /lava-1009790/environment
    2023-09-18T05:33:35.917587  / # /lava-1009790/bin/lava-test-runner /lav=
a-1009790/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e619d4ee2587fb8a0a51

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507e619d4ee2587fb8a0a58
        failing since 47 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-09-18T05:54:06.385519  + set +x
    2023-09-18T05:54:06.388755  <8>[   28.480575] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1009801_1.5.2.4.1>
    2023-09-18T05:54:06.495815  / # #
    2023-09-18T05:54:07.960293  export SHELL=3D/bin/sh
    2023-09-18T05:54:07.981412  #
    2023-09-18T05:54:07.981896  / # export SHELL=3D/bin/sh
    2023-09-18T05:54:09.939749  / # . /lava-1009801/environment
    2023-09-18T05:54:13.541964  /lava-1009801/bin/lava-test-runner /lava-10=
09801/1
    2023-09-18T05:54:13.563401  . /lava-1009801/environment
    2023-09-18T05:54:13.563823  / # /lava-1009801/bin/lava-test-runner /lav=
a-1009801/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e4335def6168668a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e4335def6168668a0=
a43
        failing since 222 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e7196c6fa6eea98a0a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e7196c6fa6eea98a0=
a83
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6507de5d776da2d1728a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507de5d776da2d1728a0=
a52
        new failure (last pass: next-20230914) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6507e5095cc6daf4cd8a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230918/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507e5095cc6daf4cd8a0=
a4e
        failing since 103 days (last pass: next-20230601, first fail: next-=
20230606) =

 =20
