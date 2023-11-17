Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC79F7EEC39
	for <lists+linux-next@lfdr.de>; Fri, 17 Nov 2023 07:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjKQGZI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Nov 2023 01:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjKQGZG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Nov 2023 01:25:06 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCC1D59
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 22:24:59 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso2093695b3a.1
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 22:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700202298; x=1700807098; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rz8O2u3HT59QRnAWRVV0XxOYZj5aORleqmIvZeKlrL0=;
        b=OKbR5FA6ddrMeX0gKgDBCmCaBJ0aJ+WkWq3sQPZjTePoZoxNrzehZRt08tMYDQ9XFp
         ZgxjIbsIdkfwGdgzlYoLhMNOZFzHCANzhB7CKGSQIKx0KieLQI3A3+kOOJAFRuxd8izp
         iK4kQCI+hq0FgrAjHufyOd0rIJn/zk5bn7iBKLcDdSn7gdAUVis2LYclYbGNMewu91Bk
         XZsGOrtX6+1EXGMLjQvStyQZQ0DR58limFdeljqooAo5Q2WcI/D1vTbYPVn0tftSAs9j
         6/qUV1qVU8zFcfE7MWtwO0BPCyImkUKpvFQzvzeWDS5sArgJLl+ZeZJXdEgNEy1nw1yh
         DkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700202298; x=1700807098;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz8O2u3HT59QRnAWRVV0XxOYZj5aORleqmIvZeKlrL0=;
        b=bqejEX+dCxnWAQYohh3q/Nfs7YGYQTvmfFbE5h+245guF1ZvE/AE76Cp1ph4rhqUYv
         KbetgTI22yc+TdxrgLRcbA85izyFHe+xFEqT/dNV+c9gf+jEv2DX4JW72loWRsnaeRRa
         gODFe2G+dKQhain4dbup+Bnifmo5s1cJUY8yajDmsmAhfApLlyj80hok3zUthc8vT0HL
         sMKb7t9Ku90Bdna/Uc8o3Fgm5EMvYl9zrG5RyeY2qLm8hcG8H9WZmK8bRpdo23Nmb5oH
         Cc8Bd1k+BXaaXPRtbi6v2ah0RC8eqRxMCMm/qUl+slp4Xfz2hdz1m89GsEmaD0JQpgZM
         4PbQ==
X-Gm-Message-State: AOJu0YwcyCGP/H6aOcMDE0LZUdcOucs2yYEgxLN1Ptl862Zd2K18EEWi
        2KtFjTlVMcKCOmgv6QW5HdcqfT3kH4yIC9OfMk0=
X-Google-Smtp-Source: AGHT+IF6BwBvdPU6q7yldNB+z4mS43n3NQI0NjvqqyASmVzVaM9tiep1IFphD6Y0hNDD1ZmXjjIASA==
X-Received: by 2002:a05:6a20:428a:b0:187:a9b0:434b with SMTP id o10-20020a056a20428a00b00187a9b0434bmr5728372pzj.4.1700202298369;
        Thu, 16 Nov 2023 22:24:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o14-20020a056a001b4e00b006c33bf9905fsm725126pfv.25.2023.11.16.22.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 22:24:57 -0800 (PST)
Message-ID: <65570739.050a0220.5936b.2670@mx.google.com>
Date:   Thu, 16 Nov 2023 22:24:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231117
Subject: next/master baseline: 437 runs, 21 regressions (next-20231117)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 437 runs, 21 regressions (next-20231117)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-10   | sama5_defconf=
ig              | 1          =

at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | at91_dt_defco=
nfig            | 1          =

at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | multi_v5_defc=
onfig           | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | bcm2835_defco=
nfig            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beaglebone-black         | arm   | lab-broonie   | gcc-10   | omap2plus_def=
config          | 1          =

beaglebone-black         | arm   | lab-cip       | gcc-10   | omap2plus_def=
config          | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

jetson-tk1               | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

odroid-xu3               | arm   | lab-collabora | gcc-10   | exynos_defcon=
fig             | 1          =

r8a7743-iwg20d-q7        | arm   | lab-cip       | gcc-10   | shmobile_defc=
onfig           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square      | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
onfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
onfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231117/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231117
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      eff99d8edbed7918317331ebd1e365d8e955d65e =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-10   | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6556d269d0c79570217e4a94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556d269d0c79570217e4=
a95
        failing since 289 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | at91_dt_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6556cffd7a6268a24c7e4a78

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6556cffd7a6268a24c7e4a98
        failing since 164 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-17T02:29:08.133153  /lava-248926/1/../bin/lava-test-case
    2023-11-17T02:29:08.175162  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | multi_v5_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6556cabf49ebe506647e4a73

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6556cabf49ebe506647e4a92
        failing since 164 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-17T02:06:31.574996  /lava-248750/1/../bin/lava-test-case
    2023-11-17T02:06:31.617487  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ca5f0fe0cbc07b7e4a77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ca5f0fe0cbc07b7e4=
a78
        failing since 164 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556d515af6b3bafba7e4afe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556d515af6b3bafba7e4=
aff
        failing since 233 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beagle-xm                | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556d62a80b5c4a1337e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556d62a80b5c4a1337e4=
a6e
        failing since 230 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beaglebone-black         | arm   | lab-broonie   | gcc-10   | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ccd4475bd360d47e4a98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ccd4475bd360d47e4=
a99
        new failure (last pass: next-20231114) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beaglebone-black         | arm   | lab-cip       | gcc-10   | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ceaaab3e1e0f797e4ae3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ceaaab3e1e0f797e4=
ae4
        new failure (last pass: next-20231114) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6556c9d3f51f1f760e7e4a89

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556c9d3f51f1f760e7e4a92
        failing since 2 days (last pass: next-20230428, first fail: next-20=
231114)

    2023-11-17T02:02:32.009662  + set +x
    2023-11-17T02:02:32.012166  <8>[   19.690862] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1258996_1.5.2.4.1>
    2023-11-17T02:02:32.124528  / # #
    2023-11-17T02:02:33.280405  export SHELL=3D/bin/sh
    2023-11-17T02:02:33.286028  #
    2023-11-17T02:02:34.828185  / # export SHELL=3D/bin/sh. /lava-1258996/e=
nvironment
    2023-11-17T02:02:34.833839  =

    2023-11-17T02:02:37.646175  / # . /lava-1258996/environment/lava-125899=
6/bin/lava-test-runner /lava-1258996/1
    2023-11-17T02:02:37.652182  =

    2023-11-17T02:02:37.654566  / # /lava-1258996/bin/lava-test-runner /lav=
a-1258996/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
jetson-tk1               | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556cf049de021deb77e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556cf049de021deb77e4=
a6e
        failing since 584 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
odroid-xu3               | arm   | lab-collabora | gcc-10   | exynos_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ccf4e6b8b4808a7e4a86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ccf4e6b8b4808a7e4=
a87
        failing since 2 days (last pass: next-20230621, first fail: next-20=
231114) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a7743-iwg20d-q7        | arm   | lab-cip       | gcc-10   | shmobile_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ced895adfc72767e4b0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ced895adfc72767e4=
b10
        new failure (last pass: next-20231116) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ca1f9885f617307e4a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556ca1f9885f617307e4a76
        failing since 107 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-17T02:03:55.659961  + set +x
    2023-11-17T02:03:55.663091  <8>[   28.369471] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1039883_1.5.2.4.1>
    2023-11-17T02:03:55.768471  / # #
    2023-11-17T02:03:57.223400  export SHELL=3D/bin/sh
    2023-11-17T02:03:57.243877  #
    2023-11-17T02:03:57.244051  / # export SHELL=3D/bin/sh
    2023-11-17T02:03:59.189968  / # . /lava-1039883/environment
    2023-11-17T02:04:02.770858  /lava-1039883/bin/lava-test-runner /lava-10=
39883/1
    2023-11-17T02:04:02.791465  . /lava-1039883/environment
    2023-11-17T02:04:02.791566  / # /lava-1039883/bin/lava-test-runner /lav=
a-1039883/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
rk3288-rock2-square      | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556cf3857620d7d627e4ac4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556cf3857620d7d627e4=
ac5
        failing since 359 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ce35710cca414c7e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ce35710cca414c7e4=
a80
        failing since 359 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ccc5475bd360d47e4a71

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556ccc5475bd360d47e4a78
        failing since 168 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-17T02:15:19.511886  + set +x
    2023-11-17T02:15:19.514103  <8>[   13.886046] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3836711_1.5.2.4.1>
    2023-11-17T02:15:19.618819  / # #
    2023-11-17T02:15:19.719834  export SHELL=3D/bin/sh
    2023-11-17T02:15:19.720239  #
    2023-11-17T02:15:19.820971  / # export SHELL=3D/bin/sh. /lava-3836711/e=
nvironment
    2023-11-17T02:15:19.821732  =

    2023-11-17T02:15:19.922580  / # . /lava-3836711/environment/lava-383671=
1/bin/lava-test-runner /lava-3836711/1
    2023-11-17T02:15:19.923121  =

    2023-11-17T02:15:19.929391  / # /lava-3836711/bin/lava-test-runner /lav=
a-3836711/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ce92e9eabbd25d7e4aa8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556ce92e9eabbd25d7e4ab1
        failing since 168 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-17T02:22:39.073063  / # #
    2023-11-17T02:22:39.174174  export SHELL=3D/bin/sh
    2023-11-17T02:22:39.174579  #
    2023-11-17T02:22:39.275355  / # export SHELL=3D/bin/sh. /lava-3836788/e=
nvironment
    2023-11-17T02:22:39.275761  =

    2023-11-17T02:22:39.376516  / # . /lava-3836788/environment/lava-383678=
8/bin/lava-test-runner /lava-3836788/1
    2023-11-17T02:22:39.377169  =

    2023-11-17T02:22:39.386284  / # /lava-3836788/bin/lava-test-runner /lav=
a-3836788/1
    2023-11-17T02:22:39.466064  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-17T02:22:39.504923  + cd /lava-3836788/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556d52f2a3177565f7e4a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556d52f2a3177565f7e4a76
        failing since 162 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-11-17T02:51:13.193133  / # #
    2023-11-17T02:51:13.295620  export SHELL=3D/bin/sh
    2023-11-17T02:51:13.296824  #
    2023-11-17T02:51:13.398588  / # export SHELL=3D/bin/sh. /lava-3836869/e=
nvironment
    2023-11-17T02:51:13.399791  =

    2023-11-17T02:51:13.501246  / # . /lava-3836869/environment/lava-383686=
9/bin/lava-test-runner /lava-3836869/1
    2023-11-17T02:51:13.502671  =

    2023-11-17T02:51:13.517518  / # /lava-3836869/bin/lava-test-runner /lav=
a-3836869/1
    2023-11-17T02:51:13.635846  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-17T02:51:13.636074  + cd /lava-3836869/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6556cc3de0762d33e07e4aad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556cc3de0762d33e07e4ab6
        failing since 168 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-17T02:12:54.026003  + set +x
    2023-11-17T02:12:54.027737  [   20.953800] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444276_1.5.2.4.1>
    2023-11-17T02:12:54.136378  / # #
    2023-11-17T02:12:54.237933  export SHELL=3D/bin/sh
    2023-11-17T02:12:54.238587  #
    2023-11-17T02:12:54.339652  / # export SHELL=3D/bin/sh. /lava-444276/en=
vironment
    2023-11-17T02:12:54.340225  =

    2023-11-17T02:12:54.441240  / # . /lava-444276/environment/lava-444276/=
bin/lava-test-runner /lava-444276/1
    2023-11-17T02:12:54.442066  =

    2023-11-17T02:12:54.448558  / # /lava-444276/bin/lava-test-runner /lava=
-444276/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6556ce6bf1ca1fa1167e4a91

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556ce6bf1ca1fa1167e4a9a
        failing since 168 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-17T02:22:21.043057  + set +x
    2023-11-17T02:22:21.044778  [   23.578400] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444279_1.5.2.4.1>
    2023-11-17T02:22:21.152383  / # #
    2023-11-17T02:22:21.253934  export SHELL=3D/bin/sh
    2023-11-17T02:22:21.254478  #
    2023-11-17T02:22:21.355450  / # export SHELL=3D/bin/sh. /lava-444279/en=
vironment
    2023-11-17T02:22:21.355981  =

    2023-11-17T02:22:21.456965  / # . /lava-444279/environment/lava-444279/=
bin/lava-test-runner /lava-444279/1
    2023-11-17T02:22:21.457789  =

    2023-11-17T02:22:21.460546  / # /lava-444279/bin/lava-test-runner /lava=
-444279/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6556d4fcaf6b3bafba7e4ad0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6556d4fcaf6b3bafba7e4ad9
        failing since 162 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-11-17T02:50:12.792600  + set +x[   20.968002] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444288_1.5.2.4.1>
    2023-11-17T02:50:12.792913  =

    2023-11-17T02:50:12.901625  / # #
    2023-11-17T02:50:13.003202  export SHELL=3D/bin/sh
    2023-11-17T02:50:13.003769  #
    2023-11-17T02:50:13.104740  / # export SHELL=3D/bin/sh. /lava-444288/en=
vironment
    2023-11-17T02:50:13.105251  =

    2023-11-17T02:50:13.206270  / # . /lava-444288/environment/lava-444288/=
bin/lava-test-runner /lava-444288/1
    2023-11-17T02:50:13.207266  =

    2023-11-17T02:50:13.209938  / # /lava-444288/bin/lava-test-runner /lava=
-444288/1 =

    ... (12 line(s) more)  =

 =20
