Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C847EF64
	for <lists+linux-next@lfdr.de>; Fri, 24 Dec 2021 15:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbhLXOMZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Dec 2021 09:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235830AbhLXOMZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Dec 2021 09:12:25 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2CAC061401
        for <linux-next@vger.kernel.org>; Fri, 24 Dec 2021 06:12:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id c2so7882784pfc.1
        for <linux-next@vger.kernel.org>; Fri, 24 Dec 2021 06:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=puqA85p37suV3BXUjpnF3xw7IQceyuNDQpA7IkLM5Js=;
        b=JZrGfrK8ZO6KToMLglSdbfQu8p7v+d5TzOCf5JWJbiJTWZzYCQCh9MoEJ2WoqIuCXL
         TyNZqQxbALhM6XZbzDTxo8Y0EOddr/QcVQeqdx5Bff+FqBetVVgOQp7wEPdVwt79UUBN
         kRgy1ZXqyR/5ogQaaxiIIFDGugPGc/dc9oeHubvLln9YGHRWKdNv7GGRvXLRu1Zm/jlM
         ejNoQbUbVzvtDACR1yJSV4pI8QE+/kfx0SYOI8XE2R/7a24axLZz/lruP82+Z9IpLLJG
         hcFIrQUJ+zfi5s+y408nJAz0c8oEEbMNCSiInghruSqtXmpm2dpDqs9IfycO8LAcJNRV
         r/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=puqA85p37suV3BXUjpnF3xw7IQceyuNDQpA7IkLM5Js=;
        b=kCs2sg4hkRHZmAbwI4fti5kdAFv6mlhIMaOunMDCHuxDFQLTDMqNsdKwYYHmjnZEJ3
         +iRZLOHxci4zPY3XzMhVs0/9aBKuRfBPbDLnKHxSBrcGJJOeZ3LYNjMYwx1L78CPPk+x
         eWV68dNLLlw2Y8eKuX1FIpW49Eoy06WO3uZjBNLmVsd06c5I6zvQjkXBlRH1EVDKodR7
         U4f53avS0kYklc5P/1cHVEw+purAyt4ij1ndw/wWbmUNGjhx7ECZva81D6tcHm7w1UC1
         wWjHG22z9EmA9p2Rgnt8Ko+tcZqsRA34p7YW/sdyA2YwHgYLQA2ImrHgFXuIqViHFVFC
         Dncg==
X-Gm-Message-State: AOAM531HZO+LSYtyvKT9sJksTjV3TuPySiuA0M/qE454NezLTUMi6+RL
        qSWZYtlghP86XbPk5yuQ4j2N250hAN2t5rT8
X-Google-Smtp-Source: ABdhPJwCFxH+IORvEjURf83jdjAPu1SzlX4JWLAb8qNBrzzdAdkWAsdgi9vF4N0LepvXKzVTzufcow==
X-Received: by 2002:aa7:8153:0:b0:4ba:9767:4bf7 with SMTP id d19-20020aa78153000000b004ba97674bf7mr6968548pfn.4.1640355143130;
        Fri, 24 Dec 2021 06:12:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s9sm1106007pfw.174.2021.12.24.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 06:12:22 -0800 (PST)
Message-ID: <61c5d546.1c69fb81.58acd.26cc@mx.google.com>
Date:   Fri, 24 Dec 2021 06:12:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211224
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 771 runs, 77 regressions (next-20211224)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 771 runs, 77 regressions (next-20211224)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre  | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6q-sabrelite          | arm   | lab-collabora | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6q-sabrelite          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6q-sabresd            | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6qp-sabresd           | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6sx-sdb               | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6ull-14x14-evk        | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx6ull-14x14-evk        | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx7d-sdb                | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx7ulp-evk              | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =

imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | clang-13 | defconfig    =
                | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp       | clang-13 | defconfig    =
                | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig    =
                | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+cry=
pto             | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+ima=
                | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+cry=
pto             | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+ima=
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp       | clang-13 | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig+ima=
                | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | clang-13 | defconfig    =
                | 2          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig    =
                | 2          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+cry=
pto             | 2          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+ima=
                | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | clang-13 | defconfig    =
                | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig    =
                | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+cry=
pto             | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+ima=
                | 2          =

zynqmp-zcu102            | arm64 | lab-cip       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64 | lab-cip       | clang-13 | defconfig    =
                | 1          =

zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig    =
                | 1          =

zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+cry=
pto             | 1          =

zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+ima=
                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211224/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211224
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ea586a076e8aa606c59b66d86660590f18354b11 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c97c04e252984397134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c97c04e252984397=
135
        new failure (last pass: next-20211223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beagle-xm                | arm   | lab-baylibre  | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59f5bc6d0edae9539711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59f5bc6d0edae95397=
120
        failing since 23 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabrelite          | arm   | lab-collabora | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e396bf1dc112539715d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e396bf1dc1125397=
15e
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabrelite          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59b5cde2fa2780a39714e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59b5cde2fa2780a397=
14f
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabrelite          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c650db7c93e8e397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c650db7c93e8e397=
138
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e6891b3b27b1639713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e6891b3b27b16397=
13c
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59bb926ac09454739711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59bb926ac094547397=
11f
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c82c04e25298439711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c82c04e252984397=
120
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a04aebd8932acd397124

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a04aebd8932acd397=
125
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59ef5f30c70903f397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59ef5f30c70903f397=
157
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c4dd9a08c819939713c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c4dd9a08c8199397=
13d
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59da125f278ffe03971df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59da125f278ffe0397=
1e0
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6qp-sabresd           | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59ee1f30c70903f397140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59ee1f30c70903f397=
141
        failing since 0 day (last pass: next-20211013, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6sx-sdb               | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a1bc1728e4aca3397129

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a1bc1728e4aca3397=
12a
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a02e1d4ce2ccf3397142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a02e1d4ce2ccf3397=
143
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59cd8a5c54df23b39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59cd8a5c54df23b397=
11f
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6sx-sdb               | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e88bb9019eb87397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e88bb9019eb87397=
129
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a1ce019e89979539711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a1ce019e899795397=
11f
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a0181d4ce2ccf3397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a0181d4ce2ccf3397=
124
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59cbb2541c9ba3b39717c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59cbb2541c9ba3b397=
17d
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e383db66b3a0c397129

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e383db66b3a0c397=
12a
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ull-14x14-evk        | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a503e04e796799397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a503e04e796799397=
121
        new failure (last pass: next-20211021) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ull-14x14-evk        | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59ebb5c28d3c9e4397152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59ebb5c28d3c9e4397=
153
        new failure (last pass: next-20211021) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59f7b677cc2340a397130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59f7b677cc2340a397=
131
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59f28a138fa194939713c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59f28a138fa1949397=
13d
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59cd32541c9ba3b39722d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59cd32541c9ba3b397=
22e
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59d9725f278ffe0397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59d9725f278ffe0397=
157
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7ulp-evk              | arm   | lab-nxp       | clang-13 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a25b73ebacfa4039711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a25b73ebacfa40397=
11f
        failing since 0 day (last pass: next-20211220, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a0f2cc78cc495a397181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a0f2cc78cc495a397=
182
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59cd62541c9ba3b397230

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59cd62541c9ba3b397=
231
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7ulp-evk              | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59f78677cc2340a39712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59f78677cc2340a397=
12b
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59fdaf13baa5ac6397134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59fdaf13baa5ac6397=
135
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | clang-13 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a1e3abe954469e397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a1e3abe954469e397=
121
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59d5c2a5f474a1d39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59d5c2a5f474a1d397=
11f
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp       | clang-13 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59f9ff4c8679b0539712d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59f9ff4c8679b05397=
12e
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59a89c326ea5028397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59a89c326ea5028397=
121
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c19abefd42b51397133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c19abefd42b51397=
134
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e10aca27d0387397157

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e10aca27d0387397=
158
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-baylibre  | gcc-10   | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a387d859978bba397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a387d859978bba397=
121
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59b9366ff16010c397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59b9366ff16010c397=
138
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59c5abceed8cccf39716c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59c5abceed8cccf397=
16d
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp       | gcc-10   | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59feff13baa5ac6397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59feff13baa5ac6397=
157
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a24600d37bc2b239711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a24600d37bc2b2397=
11f
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | clang-13 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a42b44c2e1d5f3397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a42b44c2e1d5f3397=
129
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59b813a5a08c4f7397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59b813a5a08c4f7397=
133
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a0911cb3bbb4c239711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a0911cb3bbb4c2397=
120
        failing since 1 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-10   | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c5a60991274d4a7639711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c5a60991274d4a76397=
120
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59cf8784d1652c9397129

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59cf8784d1652c939716e
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:11:49.867280  /lava-71985/1/../bin/lava-test-case
    2021-12-24T10:11:49.868457  <8>[   17.015488] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59cf8784d1652c939716f
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:11:50.920017  /lava-71985/1/../bin/lava-test-case
    2021-12-24T10:11:50.920425  <8>[   18.034803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:11:50.920678  /lava-71985/1/../bin/lava-test-case
    2021-12-24T10:11:50.920918  <8>[   18.051273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:11:50.921158  /lava-71985/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | clang-13 | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59d9825f278ffe0397163

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59d9825f278ffe03971a8
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:14:36.122860  /lava-71987/1/../bin/lava-test-case
    2021-12-24T10:14:36.123924  <8>[   19.883813] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59d9825f278ffe03971a9
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:14:37.173154  /lava-71987/1/../bin/lava-test-case
    2021-12-24T10:14:37.173752  <8>[   20.903078] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:14:37.173992  /lava-71987/1/../bin/lava-test-case
    2021-12-24T10:14:37.174210  <8>[   20.918922] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:14:37.174428  /lava-71987/1/../bin/lava-test-case
    2021-12-24T10:14:37.174642  <8>[   20.934645] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:14:37.174851  /lava-71987/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c5994df130e42fd5397135

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c5994df130e42fd539717a
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T09:56:19.631848  /lava-71971/1/../bin/lava-test-case
    2021-12-24T09:56:19.632820  <8>[   13.809675] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
5994df130e42fd539717b
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T09:56:20.681944  /lava-71971/1/../bin/lava-test-case
    2021-12-24T09:56:20.682682  <8>[   14.828398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T09:56:20.682999  /lava-71971/1/../bin/lava-test-case
    2021-12-24T09:56:20.683249  <8>[   14.844368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T09:56:20.683504  /lava-71971/1/../bin/lava-test-case
    2021-12-24T09:56:20.683739  <8>[   14.860293] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T09:56:20.684002  /lava-71971/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59a63f38a195cd3397163

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59a64f38a195cd33971a8
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211221)

    2021-12-24T10:00:52.595095  /lava-71974/1/../bin/lava-test-case
    2021-12-24T10:00:52.596120  <8>[   17.568899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59a64f38a195cd33971a9
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211221)

    2021-12-24T10:00:53.645282  /lava-71974/1/../bin/lava-test-case
    2021-12-24T10:00:53.646051  <8>[   18.588163] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:00:53.646368  /lava-71974/1/../bin/lava-test-case
    2021-12-24T10:00:53.646618  <8>[   18.604170] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:00:53.646876  /lava-71974/1/../bin/lava-test-case
    2021-12-24T10:00:53.647112  <8>[   18.620212] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:00:53.647348  /lava-71974/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59bf4d85e35f15b397124

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59bf4d85e35f15b397169
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:07:24.899590  /lava-71980/1/../bin/lava-test-case
    2021-12-24T10:07:24.900731  <8>[   18.437051] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59bf4d85e35f15b39716a
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:07:25.952809  /lava-71980/1/../bin/lava-test-case
    2021-12-24T10:07:25.953210  <8>[   19.456862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:07:25.953466  /lava-71980/1/../bin/lava-test-case
    2021-12-24T10:07:25.953815  <8>[   19.472807] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:07:25.954062  /lava-71980/1/../bin/lava-test-case
    2021-12-24T10:07:25.954299  <8>[   19.489607] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:07:25.954534  /lava-71980/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron   | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59e7416bed3d2b739713b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59e7416bed3d2b7397180
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T10:18:04.311906  <8>[   17.779484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2021-12-24T10:18:05.321518  /lava-71991/1/../bin/lava-test-case
    2021-12-24T10:18:05.322546  <8>[   18.795952] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59e7416bed3d2b7397181
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T10:18:06.379028  /lava-71991/1/../bin/lava-test-case
    2021-12-24T10:18:06.379343  <8>[   19.815460] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:18:06.379504  /lava-71991/1/../bin/lava-test-case
    2021-12-24T10:18:06.379652  <8>[   19.831383] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:18:06.379800  /lava-71991/1/../bin/lava-test-case
    2021-12-24T10:18:06.379968  <8>[   19.848991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:18:06.380125  /lava-71991/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59ce4575b41e93e397123

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59ce4575b41e93e39716f
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:11:43.333922  /lava-71984/1/../bin/lava-test-case
    2021-12-24T10:11:43.335093  <8>[   13.655563] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59ce4575b41e93e397170
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:11:44.386134  /lava-71984/1/../bin/lava-test-case
    2021-12-24T10:11:44.386893  <8>[   14.674879] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:11:44.387174  /lava-71984/1/../bin/lava-test-case
    2021-12-24T10:11:44.387456  <8>[   14.691374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:11:44.387675  /lava-71984/1/../bin/lava-test-case
    2021-12-24T10:11:44.387904  <8>[   14.708142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:11:44.388116  /lava-71984/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | clang-13 | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59e24618ce00f18397141

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59e25618ce00f1839718d
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:17:01.440201  /lava-71988/1/../bin/lava-test-case
    2021-12-24T10:17:01.441269  <8>[   13.559122] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59e25618ce00f1839718e
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:17:02.490319  /lava-71988/1/../bin/lava-test-case
    2021-12-24T10:17:02.491083  <8>[   14.577939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:17:02.491399  /lava-71988/1/../bin/lava-test-case
    2021-12-24T10:17:02.491644  <8>[   14.593939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:17:02.491922  /lava-71988/1/../bin/lava-test-case
    2021-12-24T10:17:02.492156  <8>[   14.609946] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:17:02.492389  /lava-71988/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c5994baea7f8e479397141

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c5994caea7f8e47939718d
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T09:56:23.636762  /lava-71970/1/../bin/lava-test-case
    2021-12-24T09:56:23.637943  <8>[   13.541139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
5994caea7f8e47939718e
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T09:56:24.688778  /lava-71970/1/../bin/lava-test-case
    2021-12-24T09:56:24.689542  <8>[   14.559909] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T09:56:24.689855  /lava-71970/1/../bin/lava-test-case
    2021-12-24T09:56:24.690099  <8>[   14.577116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T09:56:24.690351  /lava-71970/1/../bin/lava-test-case
    2021-12-24T09:56:24.690582  <8>[   14.594022] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T09:56:24.690815  /lava-71970/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59a65b9eabc2e93397146

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59a65b9eabc2e93397192
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211221)

    2021-12-24T10:00:48.207434  /lava-71975/1/../bin/lava-test-case
    2021-12-24T10:00:48.211530  <8>[   13.502052] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59a65b9eabc2e93397193
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211221)

    2021-12-24T10:00:49.258310  /lava-71975/1/../bin/lava-test-case
    2021-12-24T10:00:49.258714  <8>[   14.520545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:00:49.258974  /lava-71975/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59bf545f09fca7c397129

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59bf645f09fca7c397175
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:07:40.682854  /lava-71981/1/../bin/lava-test-case
    2021-12-24T10:07:40.684026  <8>[   13.595364] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59bf645f09fca7c397176
        failing since 3 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-24T10:07:41.735120  /lava-71981/1/../bin/lava-test-case
    2021-12-24T10:07:41.735878  <8>[   14.614222] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:07:41.736192  /lava-71981/1/../bin/lava-test-case
    2021-12-24T10:07:41.736441  <8>[   14.630148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:07:41.736695  /lava-71981/1/../bin/lava-test-case
    2021-12-24T10:07:41.736930  <8>[   14.647142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:07:41.737163  /lava-71981/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron   | gcc-10   | defconfig+ima=
                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c59e89928a155b4a397128

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c59e89928a155b4a397174
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T10:18:31.000635  /lava-71990/1/../bin/lava-test-case
    2021-12-24T10:18:31.001727  <8>[   13.552125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
59e89928a155b4a397175
        failing since 6 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-24T10:18:32.054176  /lava-71990/1/../bin/lava-test-case
    2021-12-24T10:18:32.055967  <8>[   14.571627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-24T10:18:32.056258  /lava-71990/1/../bin/lava-test-case
    2021-12-24T10:18:32.056483  <8>[   14.587574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-24T10:18:32.056704  /lava-71990/1/../bin/lava-test-case
    2021-12-24T10:18:32.056914  <8>[   14.603662] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-24T10:18:32.057125  /lava-71990/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | clang-13 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59d06072439fa663971e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59d06072439fa66397=
1e8
        failing since 31 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | clang-13 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59e97bb9019eb87397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59e97bb9019eb87397=
157
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59a4a518824bcfe397127

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59a4a518824bcfe397=
128
        failing since 31 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+cry=
pto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59b9e79fd62e1b439713d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59b9e79fd62e1b4397=
13e
        failing since 31 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59bc626ac094547397163

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59bc626ac094547397=
164
        failing since 31 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
zynqmp-zcu102            | arm64 | lab-cip       | gcc-10   | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c59ffe4a415202b339713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211224/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c59ffe4a415202b3397=
13c
        failing since 31 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
