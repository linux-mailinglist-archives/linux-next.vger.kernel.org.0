Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86835541D1
	for <lists+linux-next@lfdr.de>; Wed, 22 Jun 2022 06:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbiFVElM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jun 2022 00:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiFVElL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2022 00:41:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E349735848
        for <linux-next@vger.kernel.org>; Tue, 21 Jun 2022 21:41:08 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id r1so14327425plo.10
        for <linux-next@vger.kernel.org>; Tue, 21 Jun 2022 21:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4Kqjj9nI8QF77aUBjUCFznj4ErHAMuA4bssGET56/F4=;
        b=XbOpGyCY7MgduQGIW8SMtW92FhzBIvJ+kmiKURYEyFMsvyutZISd56ngyt0BQdwp1k
         rpAzPK21NDYTbJo08MrNRNqh4iRMkNQnGdQJGw2XDgzaOCbRDuh3zM+O+cTbuaZEIQe3
         mvpO5wrdNcefzZB5dXPsV5IvlbYQjmbCR7qCfJldd+dx9qEbOqkheGM+LfzjXU5uEP89
         Uxig56X9ZABv1vpuy0SPkA5h2nNIT+YhrWx5jw4IjXLAwoWGCC4/6OjSa0WFxiESgGQG
         TpK2F40F9b/wFrCEwrGbJQNK0oI0MSKE8FJTRNUzXvFYIW6rIgHikrYd5NjEwDMYOI2/
         sCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4Kqjj9nI8QF77aUBjUCFznj4ErHAMuA4bssGET56/F4=;
        b=2GENNE+8OmnsF4D9feiCyjwlokU1JNZ0a968FlvOZgk9ZWgo4Cms1HS4XwHiqZK7xD
         1TU9R0uZ0IL0u8tAZ7AxUnfmq3GYJvr6G1aMT3TGfdrmv2udlhsrKD/3M/gPqDB2iiFa
         3WQYRWSkvjf2x8G/2P2MPC27NJKV1rtfyqez9Q+aZsgiC4wroG9nkr5A8/olC6/t9JvN
         s5RqIf5Q+bYz6DVdVqZWJ2wc6U4d9EQHksM7mE2a80RGlTrO80yVmorELp66Q8JmjRG1
         aZ11kCKeDh5VmqQVc2bm8hS5YWRqtQ+sW94oNHd87TacvDdGDx0jhWbhj3mDv1JmcneM
         GFPA==
X-Gm-Message-State: AJIora+MPJbbwTbLjLY/l0xo7MoeHBIzbAZmpR8p4PzOxKzbkI/EeOhw
        r9gvOrhep75tTEONRIyo643yammBSRw8vZrKzek=
X-Google-Smtp-Source: AGRyM1uvTXEodJm8cHprBzKjB3EYAI3ONoL7dT/SWl8a/4Qalop1GCbVEuwDkvuoQiMzd7XOJ3U/ZQ==
X-Received: by 2002:a17:902:8309:b0:167:9a4c:cd58 with SMTP id bd9-20020a170902830900b001679a4ccd58mr31695755plb.166.1655872867720;
        Tue, 21 Jun 2022 21:41:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a540e00b001e095a5477bsm13264709pjh.33.2022.06.21.21.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:41:07 -0700 (PDT)
Message-ID: <62b29d63.1c69fb81.5bb50.282a@mx.google.com>
Date:   Tue, 21 Jun 2022 21:41:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc3-373-gd317111b3b1ae
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 417 runs,
 34 regressions (v5.19-rc3-373-gd317111b3b1ae)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 417 runs, 34 regressions (v5.19-rc3-373-gd3171=
11b3b1ae)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc3-373-gd317111b3b1ae/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc3-373-gd317111b3b1ae
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d317111b3b1ae726a1a0f6c2329e0c20f6ade3d6 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b26a2a249947865ea39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-=
sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-=
sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b26a2a249947865ea39=
bd1
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b26b0573f0c0d059a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b26b0573f0c0d059a39=
bf5
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62b264c6b281c5ad82a39bf0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b264c6b281c5a=
d82a39bf8
        failing since 149 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-22T00:39:07.175657  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-22T00:39:07.175928  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-22T00:39:07.178731  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-22T00:39:07.231845  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b26fff39a5a65bfea39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b26fff39a5a65bfea39=
bdd
        failing since 22 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b277076c20e60fefa39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b277076c20e60fefa39=
bd3
        failing since 22 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b277932f1bd24e9fa39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b277932f1bd24e9fa39=
bdc
        failing since 22 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b26b374d7192d415a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b26b374d7192d415a39=
bdb
        failing since 32 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b26ed15ffd644574a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b26ed15ffd644574a39=
bd0
        failing since 29 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b268ea7de01880bca39c19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b268ea7de01880bca39=
c1a
        failing since 16 days (last pass: v5.18-12139-gb5db4eaa8649, first =
fail: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b265916d2951f241a39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b265916d2951f=
241a39bd4
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-22T00:42:38.715948  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-22T00:42:38.719570  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T00:42:38.724242  [   71.040916] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T00:42:38.724505  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b265916d2951f=
241a39bd5
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T00:42:38.695006  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T00:42:38.695579  kern  :alert : Mem abort info:
    2022-06-22T00:42:38.695783  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T00:42:38.696200  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T00:42:38.696594  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T00:42:38.696771  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T00:42:38.696995  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T00:42:38.697408  kern  :alert : Data abort info:
    2022-06-22T00:42:38.697596  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T00:42:38.698014  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2693e5080cd686aa39bdb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2693e5080cd6=
86aa39be2
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-22T00:58:13.771510  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-22T00:58:13.775060  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T00:58:13.781159  [   69.185989] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T00:58:13.781425  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2693e5080cd6=
86aa39be3
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T00:58:13.749527  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T00:58:13.750038  kern  :alert : Mem abort info:
    2022-06-22T00:58:13.750286  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T00:58:13.750562  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T00:58:13.751018  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T00:58:13.751236  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T00:58:13.751482  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T00:58:13.751886  kern  :alert : Data abort info:
    2022-06-22T00:58:13.752125  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T00:58:13.752392  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b26af673f0c0d059a39be5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b26af673f0c0d=
059a39bec
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-22T01:05:36.471681  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-22T01:05:36.475276  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T01:05:36.479772  [   71.130615] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T01:05:36.480009  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b26af673f0c0d=
059a39bed
        failing since 0 day (last pass: v5.18-rc7-216-g98dca003a752b, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T01:05:36.450807  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T01:05:36.451343  kern  :alert : Mem abort info:
    2022-06-22T01:05:36.451580  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T01:05:36.451855  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T01:05:36.452307  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T01:05:36.452494  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T01:05:36.452900  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T01:05:36.453297  kern  :alert : Data abort info:
    2022-06-22T01:05:36.453540  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T01:05:36.453783  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b26589498a51fc17a39bd8

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b26589498a51f=
c17a39bdf
        failing since 0 day (last pass: v5.19-rc1-331-g13bdc020d5006, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-22T00:42:27.165099  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T00:42:27.165649  <8>[   62.383232] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T00:42:27.166010  + set +x
    2022-06-22T00:42:27.166343  <8>[   62.385455] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6664103_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b26589498a51f=
c17a39be0
        failing since 0 day (last pass: v5.19-rc1-331-g13bdc020d5006, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T00:42:27.122394  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T00:42:27.122940  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-22T00:42:27.123289  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079077000
    2022-06-22T00:42:27.123614  kern  :alert : [0000000000000005] pgd=3D080=
0000079079003, p4d=3D0800000079079003, pud=3D080000007907a003, pmd=3D000000=
0000000000
    2022-06-22T00:42:27.123931  <8>[   62.361500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-22T00:42:27.124246  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b267c19e27dacc6da39c12

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b267c19e27dac=
c6da39c1a
        failing since 0 day (last pass: v5.19-rc2-431-gba1eaf33689d0, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T00:51:53.923509  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T00:51:53.924039  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-22T00:51:53.924425  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079a9a000
    2022-06-22T00:51:53.924763  kern  :alert : [0000000000000005] pgd=3D080=
0000079a9b003, p4d=3D0800000079a9b003, pud=3D0800000079a9c003, pmd=3D000000=
0000000000
    2022-06-22T00:51:53.925086  <8>[   62.437037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-22T00:51:53.925404  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2687a41a333b837a39c10

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2687a41a333b=
837a39c18
        failing since 0 day (last pass: v5.19-rc2-431-gba1eaf33689d0, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-22T00:55:01.395543  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T00:55:01.396083  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-22T00:55:01.396441  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000092a4000
    2022-06-22T00:55:01.396772  kern  :alert : [0000000000000005] pgd=3D080=
00000092c2003, p4d=3D08000000092c2003, pud=3D08000000799a4003, pmd=3D000000=
0000000000
    2022-06-22T00:55:01.397096  <8>[   60.255960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-22T00:55:01.397413  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-22T00:55:01.397719  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T00:55:01.398016  <8>[   60.276756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T00:55:01.398312  + set +x
    2022-06-22T00:55:01.398614  <8>[   60.278821] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6664202_1.5.2.4.1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2688a0738b3c0a8a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2688a0738b3c0a8a39=
bce
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2665f619503d7efa39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2665f619503d7efa39=
be3
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2686a80032dc030a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broo=
nie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broo=
nie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2686a80032dc030a39=
bdf
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2687741a333b837a39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2687741a333b837a39=
bf9
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b268d4e8e1fd6611a39c2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b268d4e8e1fd6611a39=
c30
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2688da95b22aa61a39c06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2688da95b22aa61a39=
c07
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b269f55f75ea9e72a39c4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b269f55f75ea9e72a39=
c4e
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2692879ff828fcea39c13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-p=
ine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-p=
ine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2692879ff828fcea39=
c14
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b262d7d88a4d10b3a39c22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t=
-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t=
-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b262d7d88a4d10b3a39=
c23
        failing since 0 day (last pass: v5.19-rc2-431-gba1eaf33689d0, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b27783c67676aa62a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b27783c67676aa62a39=
bdd
        failing since 11 days (last pass: v5.19-rc1-144-g9b6181f62e678, fir=
st fail: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b277fffe56fb7f6fa39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i=
-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b277fffe56fb7f6fa39=
be5
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b275ce33f3baa313a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2=
-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2=
-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b275ce33f3baa313a39=
bd3
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b266c10a664e50fea39c0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b266c10a664e50fea39=
c0d
        failing since 0 day (last pass: v5.19-rc1-331-g13bdc020d5006, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b266bf0a664e50fea39bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b266bf0a664e50fea39=
bff
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b262d4e9f7cff178a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
73-gd317111b3b1ae/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b262d4e9f7cff178a39=
bcf
        new failure (last pass: v5.19-rc3-342-g3bc66a8a3bd54) =

 =20
