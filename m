Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4339F47DB9B
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 01:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244887AbhLWAAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Dec 2021 19:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhLWAAY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2021 19:00:24 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59923C061574
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2021 16:00:24 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y7so3041062plp.0
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2021 16:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=O8naoY/LBpQn6Dc9MJs2S+455uMkTnPM3gc726Sl1QQ=;
        b=L8ztIyOhWCPL7buBiUyn3NQcHfWW1AAewDhQW7eMxnfqFn+dGGQMXxM/xCxVm5Fh4f
         j3SS+uNT/tMaSGqEmcMlRnGu8lYjuWZ/rMGWKIzyh1JPZVkq6o7KUv5Q4HNhZsFe1n1T
         91ObOa7kxzxN3EfxmovqGYeedKSbNWq0+Rr1aeE09/+ta/42acYjieRP8Nh1VK13sZFL
         aY+8rUfDWEyU0B+EaIztvO0lZmozzstpP56+NpYf4V+R5UV96pY3wDlS2NjqAF/IfsEY
         dleLnaiDu+zvuz/0i9I7QpPw63KNKyzJfxk8z8yr5XJrkDYF0jZ284A2hDkR5oSZhQ52
         w9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=O8naoY/LBpQn6Dc9MJs2S+455uMkTnPM3gc726Sl1QQ=;
        b=6wmszvioNnxC/6C9s5d9CB/WsNMlr3VPFZb9qojF+rGKHwb/DTCOtbxSSoRhFsXZUV
         V13wV8j+zCsW0LCIAXSVLfbqghFjBP04kAMw5ZhvkfxxGgZOjlcowSrfE0OKCzrERpg/
         sN4d+4Gi+Psu2IYOX1Oj3MMvIoOahpq16UHuhxL8MN4idPhEQQh5sZwaAHkPMJ6J6DHQ
         YMHb2MOeI9UiXrUJi502kA2bQxOLmuPatzJup+86g/wMFtgmFoxpAsOsJ0jRngTfhlrS
         dW9+89HHBM3+17w8XdXrdI58r+wG4+5uel/5cipuRZrFF1omfrquRBkx/QSDk/AwkebJ
         IJrg==
X-Gm-Message-State: AOAM533NCT0PulBkSybGaUXgF+X1+AZEhB7lU7nIOpg39U2A+YjsKC3c
        LnNCwQ6wy4tHVfLJkmfItEU+74LXYytedrgZ/kQ=
X-Google-Smtp-Source: ABdhPJyaL+JM29v2ZSxNoDpq6OTclF6nNLmG9vrD+JuDNOAJuwMTdCA91qPPisCSR5ruO0sG7/+WEQ==
X-Received: by 2002:a17:902:8346:b0:148:b843:751a with SMTP id z6-20020a170902834600b00148b843751amr72332pln.141.1640217622237;
        Wed, 22 Dec 2021 16:00:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm3045020pge.23.2021.12.22.16.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 16:00:21 -0800 (PST)
Message-ID: <61c3bc15.1c69fb81.468de.8fe5@mx.google.com>
Date:   Wed, 22 Dec 2021 16:00:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211222
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 601 runs, 72 regressions (next-20211222)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 601 runs, 72 regressions (next-20211222)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =

imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
config           | 1          =

imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =

imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config           | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =

imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =

imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =

imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-13 | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | clang-13 | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | clang-13 | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+im=
a                | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211222/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211222
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2bd48302750c652889a2604b3df8b591c1d3af08 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61c37ec35bf76e714739711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c37ec35bf76e7147397=
11f
        failing since 1 day (last pass: next-20211220, first fail: next-202=
11221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c380e11cc9e4c6d2397169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c380e11cc9e4c6d2397=
16a
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c383c25faf5e0e80397140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c383c25faf5e0e80397=
141
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38162045015a023397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38162045015a023397=
149
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c384076a2b83cd6639712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c384076a2b83cd66397=
12f
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c381ac200c0deb1b397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c381ac200c0deb1b397=
14a
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c384a6b4d03d5fda397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c384a6b4d03d5fda397=
137
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38263283ff6314f397141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38263283ff6314f397=
142
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3850de0d79f7f48397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3850de0d79f7f48397=
149
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3827bb4bc06d7ce3971b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3827bb4bc06d7ce397=
1b5
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c384ff09e957492f39712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c384ff09e957492f397=
130
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c382110183a0351239712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c382110183a03512397=
130
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38566354b9333e139712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38566354b9333e1397=
12d
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3823f3363fbbddc397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3823f3363fbbddc397=
14a
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c384fc7ba96bee8639711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c384fc7ba96bee86397=
11f
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38f607f9fb79cb43971c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38f607f9fb79cb4397=
1c8
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c389696463b63f3d397139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c389696463b63f3d397=
13a
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c382a16355d409e439714f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c382a16355d409e4397=
150
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3843197476d897139713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3843197476d8971397=
13c
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c386139eeb60a8f0397154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c386139eeb60a8f0397=
155
        new failure (last pass: next-20211216) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c387a266ad19351b39715d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c387a266ad19351b397=
15e
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3896f09f553e4bd39712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3896f09f553e4bd397=
12b
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38aeb93205c767f397129

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38aeb93205c767f397=
12a
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c383024fc0103b5f39715b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c383024fc0103b5f397=
15c
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c383ba4190e318d339711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c383ba4190e318d3397=
120
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3844597476d8971397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3844597476d8971397=
157
        new failure (last pass: next-20211216) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3844797476d897139715c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3844797476d8971397=
15d
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c385fc97a4e5cdcc397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c385fc97a4e5cdcc397=
133
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3923a23c889799d397141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3923a23c889799d397=
142
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c382df45c986c40f3971a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c382df45c986c40f397=
1a7
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38492a03b451f65397152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38492a03b451f65397=
153
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3862a767559d074397124

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3862a767559d074397=
125
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38875121f220ae0397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38875121f220ae0397=
129
        new failure (last pass: next-20211216) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38add1ea3769a96397140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38add1ea3769a96397=
141
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38d1d1d3053b5f9397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38d1d1d3053b5f9397=
138
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c38950e045e1d28b397143

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c38951e045e1d28b397188
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:23:21.239417  /lava-71060/1/../bin/lava-test-case
    2021-12-22T20:23:21.240474  <8>[   17.227762] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
38951e045e1d28b397189
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:23:22.289345  /lava-71060/1/../bin/lava-test-case
    2021-12-22T20:23:22.289867  <8>[   18.246651] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:23:22.290029  /lava-71060/1/../bin/lava-test-case
    2021-12-22T20:23:22.290176  <8>[   18.263069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:23:22.290321  /lava-71060/1/../bin/lava-test-case
    2021-12-22T20:23:22.290462  <8>[   18.279079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:23:22.290603  /lava-71060/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3810508ea7530be397142

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3810508ea7530be397187
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T19:48:03.135250  /lava-71024/1/../bin/lava-test-case
    2021-12-22T19:48:03.136420  <8>[   17.193925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3810508ea7530be397188
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T19:48:04.186053  /lava-71024/1/../bin/lava-test-case
    2021-12-22T19:48:04.186796  <8>[   18.213487] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:48:04.187109  /lava-71024/1/../bin/lava-test-case
    2021-12-22T19:48:04.187355  <8>[   18.229398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:48:04.187610  /lava-71024/1/../bin/lava-test-case
    2021-12-22T19:48:04.187868  <8>[   18.245455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:48:04.188107  /lava-71024/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3826db4bc06d7ce397131

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3826eb4bc06d7ce397176
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:54:09.300458  /lava-71028/1/../bin/lava-test-case
    2021-12-22T19:54:09.303255  <8>[   16.502054] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3826eb4bc06d7ce397177
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:54:10.351009  /lava-71028/1/../bin/lava-test-case
    2021-12-22T19:54:10.351310  <8>[   17.520781] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:54:10.351485  /lava-71028/1/../bin/lava-test-case
    2021-12-22T19:54:10.351652  <8>[   17.536330] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:54:10.352260  /lava-71028/1/../bin/lava-test-case
    2021-12-22T19:54:10.352472  <8>[   17.552348] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:54:10.352625  /lava-71028/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c38349babc0413a839711f

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3834ababc0413a8397164
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:57:51.077485  /lava-71034/1/../bin/lava-test-case
    2021-12-22T19:57:51.078684  <8>[   19.285213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3834ababc0413a8397165
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:57:52.128600  /lava-71034/1/../bin/lava-test-case
    2021-12-22T19:57:52.129014  <8>[   20.304061] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:57:52.129271  /lava-71034/1/../bin/lava-test-case
    2021-12-22T19:57:52.129608  <8>[   20.320093] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:57:52.129861  /lava-71034/1/../bin/lava-test-case
    2021-12-22T19:57:52.130097  <8>[   20.336163] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:57:52.130332  /lava-71034/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c384c638ac9b5a8a3971de

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c384c638ac9b5a8a397223
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:03:59.244358  /lava-71038/1/../bin/lava-test-case
    2021-12-22T20:03:59.244654  <8>[   18.223310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
384c638ac9b5a8a397224
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:04:00.294885  /lava-71038/1/../bin/lava-test-case
    2021-12-22T20:04:00.295649  <8>[   19.241962] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:04:00.295985  /lava-71038/1/../bin/lava-test-case
    2021-12-22T20:04:00.296230  <8>[   19.259092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:04:00.296481  /lava-71038/1/../bin/lava-test-case
    2021-12-22T20:04:00.296711  <8>[   19.276068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:04:00.296942  /lava-71038/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3858e18affbb4f4397143

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3858e18affbb4f4397188
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:07:37.283247  /lava-71043/1/../bin/lava-test-case
    2021-12-22T20:07:37.284420  <8>[   18.686690] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3858e18affbb4f4397189
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:07:38.337265  /lava-71043/1/../bin/lava-test-case
    2021-12-22T20:07:38.337674  <8>[   19.706408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:07:38.337929  /lava-71043/1/../bin/lava-test-case
    2021-12-22T20:07:38.338254  <8>[   19.723381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:07:38.338436  /lava-71043/1/../bin/lava-test-case
    2021-12-22T20:07:38.338607  <8>[   19.740574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:07:38.338777  /lava-71043/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3867ff632b2facb397194

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3867ff632b2facb3971d9
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:11:31.067720  /lava-71047/1/../bin/lava-test-case
    2021-12-22T20:11:31.068920  <8>[   18.107153] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3867ff632b2facb3971da
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:11:32.119840  /lava-71047/1/../bin/lava-test-case
    2021-12-22T20:11:32.120528  <8>[   19.126467] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:11:32.120790  /lava-71047/1/../bin/lava-test-case
    2021-12-22T20:11:32.121028  <8>[   19.143640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:11:32.121265  /lava-71047/1/../bin/lava-test-case
    2021-12-22T20:11:32.121491  <8>[   19.160610] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:11:32.121706  /lava-71047/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c389653cbe742353397134

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c389653cbe742353397180
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:23:53.532123  /lava-71062/1/../bin/lava-test-case
    2021-12-22T20:23:53.533300  <8>[   13.618055] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
389653cbe742353397181
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:23:54.581881  /lava-71062/1/../bin/lava-test-case
    2021-12-22T20:23:54.582645  <8>[   14.637351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:23:54.582958  /lava-71062/1/../bin/lava-test-case
    2021-12-22T20:23:54.583206  <8>[   14.653246] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:23:54.583462  /lava-71062/1/../bin/lava-test-case
    2021-12-22T20:23:54.583696  <8>[   14.669168] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:23:54.583953  /lava-71062/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3810708ea7530be3971a0

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3810708ea7530be3971ec
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T19:48:00.969502  /lava-71025/1/../bin/lava-test-case
    2021-12-22T19:48:00.970689  <8>[   13.439825] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3810708ea7530be3971ed
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T19:48:02.021256  /lava-71025/1/../bin/lava-test-case
    2021-12-22T19:48:02.021917  <8>[   14.458586] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:48:02.022188  /lava-71025/1/../bin/lava-test-case
    2021-12-22T19:48:02.022433  <8>[   14.474920] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:48:02.022674  /lava-71025/1/../bin/lava-test-case
    2021-12-22T19:48:02.022907  <8>[   14.491939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:48:02.023139  /lava-71025/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c382e78d4fd888a6397129

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c382e78d4fd888a6397175
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:55:59.431307  /lava-71031/1/../bin/lava-test-case
    2021-12-22T19:55:59.432480  <8>[   13.458924] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
382e78d4fd888a6397176
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:56:00.483462  /lava-71031/1/../bin/lava-test-case
    2021-12-22T19:56:00.484264  <8>[   14.477665] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:56:00.484580  /lava-71031/1/../bin/lava-test-case
    2021-12-22T19:56:00.484829  <8>[   14.494829] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:56:00.485090  /lava-71031/1/../bin/lava-test-case
    2021-12-22T19:56:00.485327  <8>[   14.512073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:56:00.485568  /lava-71031/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/61c383c24190e318d3397124

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c383c24190e318d3397170
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:59:40.522026  /lava-71033/1/../bin/lava-test-case
    2021-12-22T19:59:40.523201  <8>[   13.522374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
383c24190e318d3397171
        failing since 4 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-22T19:59:41.572297  /lava-71033/1/../bin/lava-test-case
    2021-12-22T19:59:41.572991  <8>[   14.541204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T19:59:41.573253  /lava-71033/1/../bin/lava-test-case
    2021-12-22T19:59:41.573488  <8>[   14.557097] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T19:59:41.573720  /lava-71033/1/../bin/lava-test-case
    2021-12-22T19:59:41.573945  <8>[   14.573084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T19:59:41.574170  /lava-71033/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c384b238ac9b5a8a39711e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c384b238ac9b5a8a397173
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:03:55.974744  /lava-71039/1/../bin/lava-test-case
    2021-12-22T20:03:55.975917  <8>[   13.514919] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
384b238ac9b5a8a397174
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:03:57.027043  /lava-71039/1/../bin/lava-test-case
    2021-12-22T20:03:57.027718  <8>[   14.533705] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:03:57.028019  /lava-71039/1/../bin/lava-test-case
    2021-12-22T20:03:57.028259  <8>[   14.550890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:03:57.028496  /lava-71039/1/../bin/lava-test-case
    2021-12-22T20:03:57.028724  <8>[   14.567971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:03:57.028951  /lava-71039/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c3857a9b61b20e29397130

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c3857a9b61b20e2939717c
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:07:14.171980  /lava-71041/1/../bin/lava-test-case
    2021-12-22T20:07:14.177711  <8>[   13.551694] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
3857a9b61b20e2939717d
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-22T20:07:15.223688  /lava-71041/1/../bin/lava-test-case
    2021-12-22T20:07:15.224347  <8>[   14.570881] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:07:15.224625  /lava-71041/1/../bin/lava-test-case
    2021-12-22T20:07:15.224880  <8>[   14.587219] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:07:15.225130  /lava-71041/1/../bin/lava-test-case
    2021-12-22T20:07:15.225373  <8>[   14.603874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:07:15.225614  /lava-71041/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c386423ee25dfdf039716a

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c386423ee25dfdf03971b6
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:10:34.420629  /lava-71046/1/../bin/lava-test-case
    2021-12-22T20:10:34.421814  <8>[   13.554597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
386423ee25dfdf03971b7
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-22T20:10:35.469636  /lava-71046/1/../bin/lava-test-case
    2021-12-22T20:10:35.470314  <8>[   14.573417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-22T20:10:35.470582  /lava-71046/1/../bin/lava-test-case
    2021-12-22T20:10:35.470825  <8>[   14.588841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-22T20:10:35.471063  /lava-71046/1/../bin/lava-test-case
    2021-12-22T20:10:35.471293  <8>[   14.604861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-22T20:10:35.471523  /lava-71046/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38dff6c1456e61b397164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38dff6c1456e61b397=
165
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61c37ead6721fc53c5397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c37ead6721fc53c5397=
137
        failing since 1 day (last pass: next-20211220, first fail: next-202=
11221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38de48f08485df439716a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38de48f08485df4397=
16b
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3888ffa36990e61397135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3888ffa36990e61397=
136
        failing since 28 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3837b8b07541675397146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3837b8b07541675397=
147
        failing since 29 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c384e3bd18b1b961397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c384e3bd18b1b961397=
157
        failing since 29 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61c3850b09e957492f397165

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c3850b09e957492f397=
166
        failing since 29 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c386373ee25dfdf0397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c386373ee25dfdf0397=
151
        failing since 29 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c38673c745542637397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211222/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c38673c745542637397=
122
        failing since 29 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
