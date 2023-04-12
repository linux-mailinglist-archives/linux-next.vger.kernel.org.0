Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93796DF168
	for <lists+linux-next@lfdr.de>; Wed, 12 Apr 2023 12:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjDLKBS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Apr 2023 06:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjDLKBL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2023 06:01:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D4B72A3
        for <linux-next@vger.kernel.org>; Wed, 12 Apr 2023 03:00:51 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso13958795pjm.3
        for <linux-next@vger.kernel.org>; Wed, 12 Apr 2023 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681293650; x=1683885650;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sP0vLUAERZ+QkRSjw14WxW9L8jBQvGVxHsLfGUM34OY=;
        b=pMGYEVAyYm5QT5vllheZQyAilwTErIegPtRfqkCh1vhVfiJLAXPjQ7v70LLQqfqylO
         8XvrloKHtv9y2Dn3zO4Y1MQu3YaPEubwG09NOuOSDbIp3AfDL2sbAf9UCwzc7MnjfX4G
         01Z5sQwyVM+XWPacmq1xo7K5da7aCsbKunhtZj/l2y9hUrQBMG2KwnivlX8lSHm5uNda
         qRi1/dekiVeDZquYSlcAALcygzoFC6fByPXRDZtdU8texEhjgBP0p7TvyuCiIvfmBvGZ
         CsD3OtpvnDwIroVniuQaWN6g9dfUQ2Av0EDyH1+3Mr4gEr41Y6Y6zu6YlCWDIU/20I96
         iSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681293650; x=1683885650;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sP0vLUAERZ+QkRSjw14WxW9L8jBQvGVxHsLfGUM34OY=;
        b=gugLlfhM8ilUX6eCu4q9lcwS8Zvg/0yVfqFf/5oEVUrArApuNyEuiUQeQAzigwYioB
         ZCTuttb2yUOen0vxR02rnSOHmB3cItszQBEYgklbUaPzUqRmXoTqi1RHrJpJIU6DAqGY
         EnWWzURnfTp9gb3pk0qCVd25AxJ1FKfk1y7mFdFct6im4zm7g7dMPSmK7W6yXX1+Ywwd
         laRq4BUFasS9gM45Nj2xSA4whjl8u0o/wDtnla14OaB65C16ulF+kNTXfMR0INqtpIG8
         2vWtilFBNEGPC+45IbPGhz57Ei/DQamoGshEey7AfWAw69Jg/rmyLAk/jMcht3lUVuTR
         xlvA==
X-Gm-Message-State: AAQBX9eRCzJuAXY1MBzp+NxAIgWyBx2W6GXobEe6dJaqqcL9wTRxNqdn
        MfRW4lZqcl76FzSA4jPKHuo1IM5HqV+Wy2+B0vgh2g==
X-Google-Smtp-Source: AKy350af+qYGZX/5Ss1BUNKX/ZXuO5QxXs60HPBfFBoX9vuhfR3QIYSyB8EC7sUxGYKrYRcLHoHg9w==
X-Received: by 2002:a17:90b:3841:b0:246:75c8:f071 with SMTP id nl1-20020a17090b384100b0024675c8f071mr18972107pjb.3.1681293649412;
        Wed, 12 Apr 2023 03:00:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g23-20020a1709029f9700b001a2135e7eabsm11275261plq.16.2023.04.12.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 03:00:48 -0700 (PDT)
Message-ID: <64368150.170a0220.9355c.60d3@mx.google.com>
Date:   Wed, 12 Apr 2023 03:00:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230412
X-Kernelci-Report-Type: test
Subject: next/master baseline: 656 runs, 48 regressions (next-20230412)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 656 runs, 48 regressions (next-20230412)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | clang-17 | multi_v=
7_defconfig           | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | clang-17 | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+kselftest          | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230412/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230412
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7d8214bba44c1aa6a75921a09a691945d26a8d43 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6436573325426113d42e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436573325426113d42e8=
5eb
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6436552a461e6599ba2e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436552a461e6599ba2e8=
62c
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6436567fab6c86111a2e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436567fab6c86111a2e8=
610
        failing since 0 day (last pass: next-20230330, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64364f95afb1cf597e2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64364f95afb1cf597e2e8=
5f8
        failing since 12 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6436528f2525ef35272e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436528f2525ef35272e8=
5e7
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6436653c5a009c70962e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436653c5a009c70962e8=
5fc
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64364d098ef5d141952e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64364d098ef5d141952e8=
5f4
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64364f97afb1cf597e2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64364f97afb1cf597e2e8=
5fb
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643652c43104cdfc8b2e864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643652c43104cdfc8b2e8=
64f
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64365bf4ded609776d2e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64365bf4ded609776d2e8=
633
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64364e9d5ec61699be2e86fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64364e9d5ec61699be2e8703
        failing since 83 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-04-12T06:24:09.470916  <8>[   14.596181] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3487930_1.5.2.4.1>
    2023-04-12T06:24:09.581448  / # #
    2023-04-12T06:24:09.685507  export SHELL=3D/bin/sh
    2023-04-12T06:24:09.686918  #
    2023-04-12T06:24:09.789117  / # export SHELL=3D/bin/sh. /lava-3487930/e=
nvironment
    2023-04-12T06:24:09.790390  =

    2023-04-12T06:24:09.893247  / # . /lava-3487930/environment/lava-348793=
0/bin/lava-test-runner /lava-3487930/1
    2023-04-12T06:24:09.894752  =

    2023-04-12T06:24:09.899567  / # /lava-3487930/bin/lava-test-runner /lav=
a-3487930/1
    2023-04-12T06:24:09.958048  <3>[   15.084832] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/64364cfe4cad401fc52e85f6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64364cfe4cad401=
fc52e85fd
        failing since 58 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-04-12T06:17:00.619168  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4f5e200 pointer offset 4 size 512
    2023-04-12T06:17:00.653808  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-12T06:17:00.654044  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-12T06:17:00.654176  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2b8000 allocated at load_module+0x690/0=
x1a80
    2023-04-12T06:17:00.656915  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-12T06:17:00.761580  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-12T06:17:00.761876  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0xfdef8487)
    2023-04-12T06:17:00.762085  kern  :emerg : Stack: (0xc8901d08 to 0xc890=
2000)
    2023-04-12T06:17:00.762291  kern  :emerg : 1d00:                   c4f5=
e200 c0773860 00000000 c03af440 00000000 c5fa36bf
    2023-04-12T06:17:00.762483  kern  :emerg : 1d20: 0000005d c5fa36bf c077=
3860 bf2b8220 00000000 00000000 00000000 00000001 =

    ... (6 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64365401455c2a8c572e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64365401455c2a8c572e85ff
        failing since 61 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-04-12T06:47:04.155219  + set +x
    2023-04-12T06:47:04.156979  [   20.551692] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1197840_1.5.2.4.1>
    2023-04-12T06:47:04.269136  #
    2023-04-12T06:47:04.371602  / # #export SHELL=3D/bin/sh
    2023-04-12T06:47:04.372084  =

    2023-04-12T06:47:04.473460  / # export SHELL=3D/bin/sh. /lava-1197840/e=
nvironment
    2023-04-12T06:47:04.474008  =

    2023-04-12T06:47:04.575452  / # . /lava-1197840/environment/lava-119784=
0/bin/lava-test-runner /lava-1197840/1
    2023-04-12T06:47:04.575998  =

    2023-04-12T06:47:04.578437  / # /lava-1197840/bin/lava-test-runner /lav=
a-1197840/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643655405652c814b62e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643655405652c814b62e8=
5e7
        failing since 79 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64364f91afb1cf597e2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64364f91afb1cf597e2e8=
5f5
        failing since 365 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64364ce5e88781e3962e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64364ce5e88781e3962e8=
610
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643650cd61ce1708912e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643650cd61ce1708912e8=
5f7
        failing since 40 days (last pass: next-20230224, first fail: next-2=
0230303) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64365134bcc5323f6e2e8693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64365134bcc5323f6e2e8=
694
        failing since 40 days (last pass: next-20230222, first fail: next-2=
0230303) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643655b8ae3be0c6412e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643655b8ae3be0c6412e8=
5e7
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64365614e9e4c338432e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64365614e9e4c338432e8=
5e7
        failing since 77 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436555d5652c814b62e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436555d5652c814b62e8=
5f3
        failing since 65 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64365485e8d2c3750f2e866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64365485e8d2c3750f2e8=
66e
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436576e9ed7be42ac2e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436576e9ed7be42ac2e8=
625
        failing since 63 days (last pass: next-20230203, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64365486e8d2c3750f2e8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64365486e8d2c3750f2e8=
671
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643655f4ee8933f0522e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643655f4ee8933f0522e8=
5f1
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643654ce28f6285d362e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643654ce28f6285d362e8=
5e7
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643656f8971dcde8a22e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643656f8971dcde8a22e8=
5ef
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436548900e935fd2f2e8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436548900e935fd2f2e8=
66a
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64366e671baa9f01632e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64366e671baa9f01632e8=
5fb
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6436724f02969b18d72e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436724f02969b18d72e8=
5e7
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6436510d77b779d2a92e85f4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6436510d77b779d=
2a92e85fb
        new failure (last pass: next-20230406)
        2 lines

    2023-04-12T06:34:33.634100  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-04-12T06:34:33.634957  kern  :emerg : Code: 97fa2e16 f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-04-12T06:34:33.637516  <8>[   21.689135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:34:33.637881  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6436510d77b779d=
2a92e85fc
        new failure (last pass: next-20230406)
        12 lines

    2023-04-12T06:34:33.614182  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:34:33.618461  kern  :alert : Mem abort info:
    2023-04-12T06:34:33.624831  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-12T06:34:33.627135  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:34:33.627532  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:34:33.628144  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:34:33.628525  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-12T06:34:33.628857  kern  :alert : Data abort info:
    2023-04-12T06:34:33.629230  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-12T06:34:33.629564  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/64364e7482935d9fe92e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64364e7482935d9=
fe92e85f3
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:23:30.233975  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-12T06:23:30.234215  kern  :emerg : Code: 97fce4a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:23:30.241355  <8>[   21.789067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:23:30.241707  + set +x
    2023-04-12T06:23:30.241916  <8>[   21.791766] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 423471_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64364e7482935d9=
fe92e85f4
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:23:30.205722  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:23:30.207284  kern  :alert : Mem abort info:
    2023-04-12T06:23:30.207652  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-12T06:23:30.208878  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:23:30.210416  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:23:30.210778  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:23:30.211950  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-12T06:23:30.213331  kern  :alert : Data abort info:
    2023-04-12T06:23:30.213695  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-12T06:23:30.214960  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64364f8cafb1cf597e2e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64364f8cafb1cf5=
97e2e85ed
        failing since 0 day (last pass: next-20230405, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:28:10.913522  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-12T06:28:10.915066  kern  :emerg : Code: 97fb78a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:28:10.928584  <8>[   21.683609] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:28:10.928919  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64364f8cafb1cf5=
97e2e85ee
        failing since 0 day (last pass: next-20230405, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:28:10.892923  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:28:10.894627  kern  :alert : Mem abort info:
    2023-04-12T06:28:10.894898  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-12T06:28:10.896304  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:28:10.897684  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:28:10.897955  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:28:10.898815  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-12T06:28:10.900187  kern  :alert : Data abort info:
    2023-04-12T06:28:10.900453  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-12T06:28:10.901746  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/64364ff04735589d402e8600

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64364ff04735589=
d402e8607
        failing since 0 day (last pass: next-20230404, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:29:55.116824  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-12T06:29:55.117343  kern  :emerg : Code: 97fde0a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:29:55.125175  <8>[   25.617559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:29:55.125660  + set +x
    2023-04-12T06:29:55.126466  <8>[   25.620209] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 423492_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64364ff04735589=
d402e8608
        failing since 0 day (last pass: next-20230404, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:29:55.101102  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:29:55.105537  kern  :alert : Mem abort info:
    2023-04-12T06:29:55.106016  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-12T06:29:55.107949  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:29:55.108607  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:29:55.108931  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:29:55.109502  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-12T06:29:55.110178  kern  :alert : Data abort info:
    2023-04-12T06:29:55.110495  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-12T06:29:55.111076  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/643650a4a45d97fce52e8652

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643650a4a45d97f=
ce52e8659
        failing since 0 day (last pass: next-20230405, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:32:51.348810  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-12T06:32:51.350211  kern  :emerg : Code: 97fbdca7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:32:51.362948  <8>[   21.841727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:32:51.363337  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643650a4a45d97f=
ce52e865a
        failing since 0 day (last pass: next-20230405, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:32:51.328111  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:32:51.329445  kern  :alert : Mem abort info:
    2023-04-12T06:32:51.329817  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-12T06:32:51.330719  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:32:51.331971  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:32:51.332354  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:32:51.333058  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-12T06:32:51.334211  kern  :alert : Data abort info:
    2023-04-12T06:32:51.334551  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-12T06:32:51.335701  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6436516de3108247312e8660

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6436516de310824=
7312e8667
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:36:13.127745  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-04-12T06:36:13.129132  kern  :emerg : Code: 97ee7055 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:36:13.139709  <8>[   21.520154] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:36:13.140086  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6436516de310824=
7312e8668
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:36:13.106347  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:36:13.107686  kern  :alert : Mem abort info:
    2023-04-12T06:36:13.108059  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-12T06:36:13.108361  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:36:13.109781  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:36:13.110155  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:36:13.110494  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-12T06:36:13.110809  kern  :alert : Data abort info:
    2023-04-12T06:36:13.111114  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-12T06:36:13.111655  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6436528515359b411e2e868f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6436528515359b4=
11e2e8696
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        2 lines

    2023-04-12T06:40:50.143535  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-12T06:40:50.144967  kern  :emerg : Code: 97fcdca7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-12T06:40:50.155984  <8>[   19.386525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-12T06:40:50.156369  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6436528515359b4=
11e2e8697
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411)
        12 lines

    2023-04-12T06:40:50.088538  + KERNELCI_LAVA=3Dy /bin/sh /opt/kernelci/d=
mesg.sh
    2023-04-12T06:40:50.123288  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-12T06:40:50.124522  kern  :alert : Mem abort info:
    2023-04-12T06:40:50.124887  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-12T06:40:50.125545  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-12T06:40:50.126801  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-12T06:40:50.127187  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-12T06:40:50.128231  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-12T06:40:50.129675  kern  :alert : Data abort info:
    2023-04-12T06:40:50.130049  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006 =

    ... (4 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436548d6448b370a92e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436548d6448b370a92e8=
5e9
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643655569c6ccbd98c2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643655569c6ccbd98c2e8=
5e7
        failing since 0 day (last pass: next-20230406, first fail: next-202=
30411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436559512d0b12c332e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436559512d0b12c332e8=
5e7
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643654ccf887300d032e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230412/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643654ccf887300d032e8=
5f9
        failing since 63 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =20
