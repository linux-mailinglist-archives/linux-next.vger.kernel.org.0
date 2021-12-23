Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F7247E48C
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 15:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348821AbhLWOeR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 09:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhLWOeQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2021 09:34:16 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91118C061401
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 06:34:16 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso5848843pjl.3
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 06:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=izxb6M9wPu+0ijFLwqBMkknp6mThGEevJQC8LosTQd0=;
        b=7FQ8PPxZj28vqGaQqvvwYsuJz9w1f6k9qmXqaKPsyV1lXJ1pSvGvfAdzfaOWuLZsrg
         lhBvos1aV0XeGAKqXKHKkrydGcMRMjUJngnQZDkYNVaetJglB8hUeU4wIWGGSa2EvhKr
         /NSv5jaAtDq6sva2zhM/JRUHaglx6vjJ1d05p9AV1BrEF8Jd/7YeNNOL3fpuRC4IQwBP
         s297bYjVTmG+5oT/DGzIbwsJ2Fpn8300AHkmm66gqhTrRHXbpxHq2PjbunR7cgHrSYGn
         +K6vydlLXQRW4xqVbkHly1ScWHUMmUDaVYOyaDmRzc+gW0TPbHHLa6MGdzEAlMlGnPq6
         a32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=izxb6M9wPu+0ijFLwqBMkknp6mThGEevJQC8LosTQd0=;
        b=qn2QulS0wyh7mgmqV3c853PLLQnGD7HZP4vMFWT3OXd9LCF1aLfu+cTCWTXFQ1hOl7
         FAu28r06I+2e6nGyl8NtbPmsWH/JSFdtALHoyvAMxoED7tDV44TBxLCBPhUyLZtn4EZN
         HnqWd4gbq6qHSPpEyldQ25Ol9vCBN8M8yap5g08i0MQMqfO6QmQKt9IgFE6275LFutbO
         IpjuqiSuGx0rJXj8q+DDlKA4mb5ILxLYc+jwCRpxfY24JwJLJun47+x6KynBdm7l6+Fx
         R6a0U0OBL/rDsHMeG6H8s8imQ7bHiQ0Y5qVUijUaWfCpR4DcjqNzppXpkHq8UMbZ1vZT
         vyXA==
X-Gm-Message-State: AOAM53342hX01weUkZJrlcY5gERjABYItSGgQIoOfgLlyUNOf6jewYl9
        AX772l2Ywqc5v2S3ngwd4Y3+INsqXONgk13g7Hw=
X-Google-Smtp-Source: ABdhPJwBD3BeXWEsu6nJjAZC/pYzY0F2gjmq/CtpxFxhelvl/x5EtHxJMTD3LrqLWkVisPmweozpBg==
X-Received: by 2002:a17:902:a5c8:b0:148:9a08:2432 with SMTP id t8-20020a170902a5c800b001489a082432mr2591970plq.62.1640270054587;
        Thu, 23 Dec 2021 06:34:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19sm6803917pfk.83.2021.12.23.06.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 06:34:14 -0800 (PST)
Message-ID: <61c488e6.1c69fb81.b5759.203a@mx.google.com>
Date:   Thu, 23 Dec 2021 06:34:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211223
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 749 runs, 72 regressions (next-20211223)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 749 runs, 72 regressions (next-20211223)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =

imx6q-sabrelite          | arm    | lab-collabora | clang-13 | multi_v7_def=
config           | 1          =

imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6q-sabresd            | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6qp-sabresd           | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx6sx-sdb               | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx7d-sdb                | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk              | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =

imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

meson-g12b-odroid-n2     | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =

zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211223/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211223
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      79f063d60c8cfc0c215d342cb7778e2ad402c2d5 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c450006939595cb139711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c450006939595cb1397=
11f
        failing since 22 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabrelite          | arm    | lab-collabora | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44ea1b632ecf5b539713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44ea1b632ecf5b5397=
13c
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabrelite          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44c877c1b4277f4397124

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44c877c1b4277f4397=
125
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44ef1e25a635e303971e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44ef1e25a635e30397=
1e9
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44cd04ed161858e397172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44cd04ed161858e397=
173
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45082dfecdcee73397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45082dfecdcee73397=
151
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44f2d8c80839e7239712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44f2d8c80839e72397=
130
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44d87992a7ffedf397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44d87992a7ffedf397=
124
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6qp-sabresd           | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44fce655cf0b681397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44fce655cf0b681397=
157
        new failure (last pass: next-20211013) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6sx-sdb               | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45291e128ada630397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45292e128ada630397=
149
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c450cc6e94ddab07397162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c450cc6e94ddab07397=
163
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6sx-sdb               | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44e0be238b60667397186

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44e0be238b60667397=
187
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4528e17acf7727039713d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4528e17acf77270397=
13e
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c450e926b35f0902397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c450e926b35f0902397=
129
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44e06ac542fb54b397151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44e06ac542fb54b397=
152
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45017ed1926e484397134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45017ed1926e484397=
135
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44fa0b21ef7081f397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44fa0b21ef7081f397=
133
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44dd5e6d43b66ca397195

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44dd5e6d43b66ca397=
196
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7ulp-evk              | arm    | lab-nxp       | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c452206e0d00cb88397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig/clang-13/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c452206e0d00cb88397=
122
        new failure (last pass: next-20211220) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45067eef54b60a039711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45067eef54b60a0397=
11f
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7ulp-evk              | arm    | lab-nxp       | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44dd158d066d1e9397133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44dd158d066d1e9397=
134
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45702c75735ecef397140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45702c75735ecef397=
141
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c453c9aa4bf22397397125

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c453c9aa4bf22397397=
126
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44b83e6b21f2873397130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44b83e6b21f2873397=
131
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44d50dafa323dfc39712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44d50dafa323dfc397=
12b
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44f6cba601a227839711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44f6cba601a2278397=
11f
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45229856f8b965039712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45229856f8b9650397=
12b
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45549d44ddc31a3397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45549d44ddc31a3397=
133
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44b5b267d513a8d397155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44b5b267d513a8d397=
156
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44ec5023966c8f8397168

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44ec5023966c8f8397=
169
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45092c6c1dfbe16397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45092c6c1dfbe16397=
133
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4529e17acf7727039715d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4529e17acf77270397=
15e
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c459b1b92ca6bcec397196

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c459b1b92ca6bcec397=
197
        new failure (last pass: next-20211221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44c5593209cdf22397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44c5593209cdf22397=
122
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44ea0b632ecf5b539712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44ea0b632ecf5b5397=
12f
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c45274e128ada63039712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c45274e128ada630397=
12b
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c455c85a77551b35397152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c455c85a77551b35397=
153
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4580d9c0a7b9dac39714f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4580d9c0a7b9dac397=
150
        failing since 0 day (last pass: next-20211221, first fail: next-202=
11222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c452744b44f30de539711e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c452754b44f30de5397163
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:41:26.918922  /lava-71478/1/../bin/lava-test-case
    2021-12-23T10:41:26.920106  <8>[   16.956161] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
452754b44f30de5397164
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:41:27.971922  /lava-71478/1/../bin/lava-test-case
    2021-12-23T10:41:27.972271  <8>[   17.976209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:41:27.972465  /lava-71478/1/../bin/lava-test-case
    2021-12-23T10:41:27.972647  <8>[   17.992329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:41:27.972837  /lava-71478/1/../bin/lava-test-case
    2021-12-23T10:41:27.973014  <8>[   18.009443] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:41:27.973191  /lava-71478/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44ab283f9b2958839714a

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44ab283f9b2958839718f
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:08:32.623378  /lava-71441/1/../bin/lava-test-case
    2021-12-23T10:08:32.624541  <8>[   17.147077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44ab283f9b29588397190
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:08:33.674833  /lava-71441/1/../bin/lava-test-case
    2021-12-23T10:08:33.675517  <8>[   18.166421] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:08:33.675783  /lava-71441/1/../bin/lava-test-case
    2021-12-23T10:08:33.676042  <8>[   18.183516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:08:33.676282  /lava-71441/1/../bin/lava-test-case
    2021-12-23T10:08:33.676511  <8>[   18.199580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:08:33.676740  /lava-71441/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44c2e8fb934f1383971ae

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44c2e8fb934f1383971f3
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:14:46.844814  /lava-71447/1/../bin/lava-test-case
    2021-12-23T10:14:46.845903  <8>[   18.480614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44c2e8fb934f1383971f4
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:14:47.894725  /lava-71447/1/../bin/lava-test-case
    2021-12-23T10:14:47.895479  <8>[   19.499432] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:14:47.895792  /lava-71447/1/../bin/lava-test-case
    2021-12-23T10:14:47.896084  <8>[   19.515417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:14:47.896340  /lava-71447/1/../bin/lava-test-case
    2021-12-23T10:14:47.896572  <8>[   19.531580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:14:47.896804  /lava-71447/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44e3673eb67a3ca39712d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44e3773eb67a3ca397172
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:23:26.423943  /lava-71457/1/../bin/lava-test-case
    2021-12-23T10:23:26.424229  <8>[   17.985419] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44e3773eb67a3ca397173
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:23:27.472831  /lava-71457/1/../bin/lava-test-case
    2021-12-23T10:23:27.473132  <8>[   19.004855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:23:27.473289  /lava-71457/1/../bin/lava-test-case
    2021-12-23T10:23:27.473437  <8>[   19.021284] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:23:27.473584  /lava-71457/1/../bin/lava-test-case
    2021-12-23T10:23:27.473725  <8>[   19.037891] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:23:27.475106  /lava-71457/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44fdc7ebf1a876039716f

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44fdc7ebf1a87603971b4
        failing since 5 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-23T10:30:30.753066  /lava-71464/1/../bin/lava-test-case
    2021-12-23T10:30:30.754109  <8>[   18.155884] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44fdc7ebf1a87603971b5
        failing since 5 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-23T10:30:31.805137  /lava-71464/1/../bin/lava-test-case
    2021-12-23T10:30:31.805452  <8>[   19.174226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:30:31.805613  /lava-71464/1/../bin/lava-test-case
    2021-12-23T10:30:31.805764  <8>[   19.191324] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:30:31.805914  /lava-71464/1/../bin/lava-test-case
    2021-12-23T10:30:31.806126  <8>[   19.208195] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:30:31.806283  /lava-71464/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c4510c03a0688bb839714f

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c4510c03a0688bb8397194
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:35:30.583723  /lava-71472/1/../bin/lava-test-case
    2021-12-23T10:35:30.584907  <8>[   17.422019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
4510c03a0688bb8397195
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:35:31.634939  /lava-71472/1/../bin/lava-test-case
    2021-12-23T10:35:31.636128  <8>[   18.440734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:35:31.636411  /lava-71472/1/../bin/lava-test-case
    2021-12-23T10:35:31.636678  <8>[   18.457925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:35:31.636915  /lava-71472/1/../bin/lava-test-case
    2021-12-23T10:35:31.637154  <8>[   18.473738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:35:31.637382  /lava-71472/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c45234c649dfc9e5397143

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c45235c649dfc9e539718f
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:40:43.601133  /lava-71479/1/../bin/lava-test-case
    2021-12-23T10:40:43.602291  <8>[   13.556264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
45235c649dfc9e5397190
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:40:44.657366  /lava-71479/1/../bin/lava-test-case
    2021-12-23T10:40:44.657816  <8>[   14.576156] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:40:44.658075  /lava-71479/1/../bin/lava-test-case
    2021-12-23T10:40:44.660808  <8>[   14.592169] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:40:44.661100  /lava-71479/1/../bin/lava-test-case
    2021-12-23T10:40:44.661343  <8>[   14.611175] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:40:44.661586  /lava-71479/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44adbae373161f7397127

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44adbae373161f7397178
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:09:19.914177  /lava-71443/1/../bin/lava-test-case
    2021-12-23T10:09:19.915280  <8>[   13.504850] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44adbae373161f7397179
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:09:20.965633  /lava-71443/1/../bin/lava-test-case
    2021-12-23T10:09:20.965938  <8>[   14.522954] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:09:20.966097  /lava-71443/1/../bin/lava-test-case
    2021-12-23T10:09:20.966246  <8>[   14.539906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:09:20.966396  /lava-71443/1/../bin/lava-test-case
    2021-12-23T10:09:20.966540  <8>[   14.556685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:09:20.968152  /lava-71443/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44b2d6756ac574f397150

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44b2d6756ac574f39719c
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:10:44.006562  /lava-71445/1/../bin/lava-test-case
    2021-12-23T10:10:44.007738  <8>[   13.555217] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44b2d6756ac574f39719d
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:10:45.056895  /lava-71445/1/../bin/lava-test-case
    2021-12-23T10:10:45.057655  <8>[   14.574577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:10:45.057968  /lava-71445/1/../bin/lava-test-case
    2021-12-23T10:10:45.058214  <8>[   14.590582] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:10:45.058465  /lava-71445/1/../bin/lava-test-case
    2021-12-23T10:10:45.058697  <8>[   14.606568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:10:45.058928  /lava-71445/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44dbee6d43b66ca39711e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44dbee6d43b66ca39716a
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:21:45.202927  /lava-71458/1/../bin/lava-test-case
    2021-12-23T10:21:45.204115  <8>[   13.578249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44dbee6d43b66ca39716b
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211220)

    2021-12-23T10:21:46.255376  /lava-71458/1/../bin/lava-test-case
    2021-12-23T10:21:46.256110  <8>[   14.597857] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:21:46.256418  /lava-71458/1/../bin/lava-test-case
    2021-12-23T10:21:46.256662  <8>[   14.613840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:21:46.256913  /lava-71458/1/../bin/lava-test-case
    2021-12-23T10:21:46.257143  <8>[   14.630504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:21:46.257374  /lava-71458/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61c44eebe25a635e30397164

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c44eebe25a635e303971b0
        failing since 5 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-23T10:26:41.308618  /lava-71465/1/../bin/lava-test-case
    2021-12-23T10:26:41.309784  <8>[   13.439724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
44eebe25a635e303971b1
        failing since 5 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-23T10:26:42.360169  /lava-71465/1/../bin/lava-test-case
    2021-12-23T10:26:42.365460  <8>[   14.458572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:26:42.365845  /lava-71465/1/../bin/lava-test-case
    2021-12-23T10:26:42.366096  <8>[   14.475654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:26:42.366342  /lava-71465/1/../bin/lava-test-case
    2021-12-23T10:26:42.366583  <8>[   14.491761] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:26:42.366823  /lava-71465/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c450f326b35f090239713e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c450f326b35f090239718a
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:35:24.734019  /lava-71473/1/../bin/lava-test-case
    2021-12-23T10:35:24.735197  <8>[   13.550385] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
450f326b35f090239718b
        failing since 1 day (last pass: next-20211216, first fail: next-202=
11221)

    2021-12-23T10:35:25.785209  /lava-71473/1/../bin/lava-test-case
    2021-12-23T10:35:25.785732  <8>[   14.569179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-23T10:35:25.785909  /lava-71473/1/../bin/lava-test-case
    2021-12-23T10:35:25.786066  <8>[   14.586408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-23T10:35:25.786221  /lava-71473/1/../bin/lava-test-case
    2021-12-23T10:35:25.786371  <8>[   14.602439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-23T10:35:25.786523  /lava-71473/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-g12b-odroid-n2     | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44a3ab4f6ffdfbf397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44a3ab4f6ffdfbf397=
122
        new failure (last pass: next-20211222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c457e199d1d20502397134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c457e199d1d20502397=
135
        new failure (last pass: next-20211222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4469a3b45797c4539714f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4469a3b45797c45397=
150
        new failure (last pass: next-20211222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44814d80fc15dba39722f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44814d80fc15dba397=
230
        failing since 1 day (last pass: next-20211220, first fail: next-202=
11221) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44bbd835ad6440539713c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44bbd835ad64405397=
13d
        new failure (last pass: next-20211222) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4529c17acf77270397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4529c17acf77270397=
151
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44c472609572dfb397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44c472609572dfb397=
133
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44e3bf6098100e2397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44e3bf6098100e2397=
123
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44f900aece9bfe039712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44f900aece9bfe0397=
12d
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
zynqmp-zcu102            | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c451ab8c0f7cc1b43971a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211223/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c451ab8c0f7cc1b4397=
1a3
        failing since 30 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
