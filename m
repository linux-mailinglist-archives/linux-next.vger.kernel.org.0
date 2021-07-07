Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734813BE66D
	for <lists+linux-next@lfdr.de>; Wed,  7 Jul 2021 12:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhGGKlP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 06:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhGGKlO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Jul 2021 06:41:14 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E82C061574
        for <linux-next@vger.kernel.org>; Wed,  7 Jul 2021 03:38:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id m15so821972plx.7
        for <linux-next@vger.kernel.org>; Wed, 07 Jul 2021 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kCmM8riPE+QjChDIbSqv0c7pgede6ngkJGKIH+KO/Jk=;
        b=n2nctVzN/wRwQ3JRzD9AuW4tjD9Nayo3hK3DvsD7XfO7H14bIxPjs0Bo3BjViF3BLg
         4LApsGP/CSuWgGQL1F5neJqgaBzTshUUxFWyi3JH8+RhGz6AZlY2ljNpCesEfS/YlFMd
         P69XOi75vsBrfi2cMgq1cPBzevuLrBSEUxpni+PO6kBljF8F6FRcVV4LKX2OcsTMMX+b
         DAdHGxSgziNVRARcuTeXRnXSFWsZHvvxI9Hy4il0B6/WPwotQu50T1mzk8f67TFfIsoR
         5a2g6dAOaOAnXeRFzP4c3V+WZ47gnAoPKTwGushWB/ImnhaK5YANwuvsWrClbhZ1jcov
         y6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kCmM8riPE+QjChDIbSqv0c7pgede6ngkJGKIH+KO/Jk=;
        b=cpG02TIB9XiRe4ogB/tTwoQyQNLJhPh9iIAaS8GKIxFHiDTHoc9leUpTnXQLrA31H2
         IEdKoRfqQcmR9CiKvf18Eitiu6l/r+vAMOU1BPWhmpBFvhIPbpyCN99YeMW9+cLL4qUD
         a95xnxEWDz8WLRSMJzhWCpQgj9VTUI8FbYAqQmjfbIa6fcaPTemmP6ZCizAdChUNJToj
         SZxxcSl40IVAc7wwEvS5bhbNSUO5HznC0/EqKNZoU7RE7Nx1RJUOwc+dh7bAPieuhH8A
         kBKx2DBTTLU9OVV3EUGP3kuIe8Alrw0/7aupgyoMKJZs7GHDbmaid/Y5xxmCjfoDNx4T
         NiUQ==
X-Gm-Message-State: AOAM532BtqW9/z/FeY9RJiXnilOmW2gpBTJiTO4YwZ+JnYO7SQzpmLAE
        oMEkL0elVxFmUr2XLIKLTvw5CY98YTcKQVyU
X-Google-Smtp-Source: ABdhPJzZqx/8xvRguwaxn2p06b8xswKwew0dlZL2w7DQ7s6LbdWyi0Q5NhTlFkkqRmEj63O+DDfmDQ==
X-Received: by 2002:a17:90a:420b:: with SMTP id o11mr24955749pjg.201.1625654313742;
        Wed, 07 Jul 2021 03:38:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm22545112pgk.32.2021.07.07.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:38:33 -0700 (PDT)
Message-ID: <60e58429.1c69fb81.878de.3115@mx.google.com>
Date:   Wed, 07 Jul 2021 03:38:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210707
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 766 runs, 37 regressions (next-20210707)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 766 runs, 37 regressions (next-20210707)

Regressions Summary
-------------------

platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | clang-12 | multi_v7_de=
fconfig           | 1          =

am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =

am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-10 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-12 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

bcm2837-rpi-3-b-32      | arm    | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =

beaglebone-black        | arm    | lab-cip         | clang-12 | multi_v7_de=
fconfig           | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fconfig           | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | omap2plus_d=
efconfig          | 1          =

d2500cc                 | x86_64 | lab-clabbe      | clang-10 | x86_64_defc=
onfig             | 1          =

d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
onfig             | 1          =

d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...86_kvm_guest | 1          =

hifive-unleashed-a00    | riscv  | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

hip07-d05               | arm64  | lab-collabora   | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64  | lab-collabora   | clang-10 | defconfig  =
                  | 1          =

hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig  =
                  | 1          =

imx6q-sabresd           | arm    | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk              | arm64  | lab-nxp         | clang-10 | defconfig  =
                  | 1          =

imx8mp-evk              | arm64  | lab-nxp         | clang-12 | defconfig  =
                  | 1          =

imx8mp-evk              | arm64  | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls   | arm64  | lab-kontron     | clang-10 | defconfig  =
                  | 1          =

kontron-kbox-a-230-ls   | arm64  | lab-kontron     | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls   | arm64  | lab-kontron     | gcc-8    | defconfig  =
                  | 1          =

meson-gxl-s905d-p230    | arm64  | lab-baylibre    | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

rk3328-rock64           | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | clang-10 | defconfig  =
                  | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210707/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210707
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee268dee405b4710e179426a431ffe0cdee14f13 =



Test Regressions
---------------- =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | clang-12 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e55a9d507db5acde11796f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/clang-12/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/clang-12/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e55a9d507db5acde117=
970
        failing since 5 days (last pass: next-20210629, first fail: next-20=
210701) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e559ea795d7fe753117974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e559ea795d7fe753117=
975
        failing since 5 days (last pass: next-20210629, first fail: next-20=
210701) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e55a25c69d0e14a911796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-am57xx-bea=
gle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-am57xx-bea=
gle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e55a25c69d0e14a9117=
96b
        failing since 6 days (last pass: next-20210629, first fail: next-20=
210630) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e55a24795d7fe75311797a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e55a24795d7fe753117=
97b
        failing since 5 days (last pass: next-20210629, first fail: next-20=
210701) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54889461a4461691179c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54889461a446169117=
9c8
        failing since 132 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5469ef67e09b0d51179ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5469ef67e09b0d5117=
9cf
        failing since 19 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54d93d4d9e3554d11799a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54d93d4d9e3554d117=
99b
        failing since 19 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | clang-12 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54aebbc6928040411799a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54aebbc69280404117=
99b
        failing since 19 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e543ceeb06dcfb5b117980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e543ceeb06dcfb5b117=
981
        failing since 19 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e545363c1fbb09a711796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e545363c1fbb09a7117=
96b
        failing since 19 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e548065603967d05117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e548065603967d05117=
983
        failing since 19 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32      | arm    | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54537524631fa1911796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54537524631fa19117=
96b
        failing since 26 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | clang-12 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54b28b5eeeb18e311796b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54b28b5eeeb18e3117=
96c
        failing since 5 days (last pass: next-20210629, first fail: next-20=
210701) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e543d05fa1721d0811799c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e543d05fa1721d08117=
99d
        failing since 6 days (last pass: next-20210629, first fail: next-20=
210630) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5445a70ca32db18117985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5445a70ca32db18117=
986
        failing since 6 days (last pass: next-20210629, first fail: next-20=
210630) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e544218bdfdd755b11796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e544218bdfdd755b117=
96e
        failing since 5 days (last pass: next-20210629, first fail: next-20=
210701) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | clang-10 | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60e544bc1321d544ed1179c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig/clang-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig/clang-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e544bc1321d544ed117=
9c7
        failing since 0 day (last pass: next-20210603, first fail: next-202=
10706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54213916ab41b4d1179de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54213916ab41b4d117=
9df
        failing since 0 day (last pass: next-20210603, first fail: next-202=
10706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54367e9d50080b81179a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54367e9d50080b8117=
9a4
        failing since 0 day (last pass: next-20210603, first fail: next-202=
10706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hifive-unleashed-a00    | riscv  | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5443e63e72e433b117987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5443e63e72e433b117=
988
        failing since 68 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54dd8eb600e2c5b117a19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54dd8eb600e2c5b117=
a1a
        failing since 85 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e55c39fdae40fed1117990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e55c39fdae40fed1117=
991
        failing since 85 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5453d20594074a611796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5453d20594074a6117=
96b
        failing since 6 days (last pass: next-20210628, first fail: next-20=
210629) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54996691d9b22d411796b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54996691d9b22d4117=
96c
        failing since 6 days (last pass: next-20210628, first fail: next-20=
210629) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5539a337059953d117972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5539a337059953d117=
973
        failing since 6 days (last pass: next-20210624, first fail: next-20=
210629) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd           | arm    | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54634d63fec3e3b1179a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54634d63fec3e3b117=
9a6
        failing since 254 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx8mp-evk              | arm64  | lab-nxp         | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e55246d208aa710e117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e55246d208aa710e117=
978
        failing since 0 day (last pass: next-20210629, first fail: next-202=
10706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx8mp-evk              | arm64  | lab-nxp         | clang-12 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54faf94f2bfcad211796b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54faf94f2bfcad2117=
96c
        new failure (last pass: next-20210706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx8mp-evk              | arm64  | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e544fb4313710beb1179b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e544fb4313710beb117=
9b2
        failing since 7 days (last pass: next-20210628, first fail: next-20=
210629) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
kontron-kbox-a-230-ls   | arm64  | lab-kontron     | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54da303c29ee987117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54da303c29ee987117=
977
        failing since 8 days (last pass: next-20210625, first fail: next-20=
210628) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
kontron-kbox-a-230-ls   | arm64  | lab-kontron     | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e543de620319eaf81179ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e543de620319eaf8117=
9ad
        failing since 6 days (last pass: next-20210629, first fail: next-20=
210630) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
kontron-kbox-a-230-ls   | arm64  | lab-kontron     | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e547b2045d44d9c8117985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e547b2045d44d9c8117=
986
        failing since 0 day (last pass: next-20210701, first fail: next-202=
10706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
meson-gxl-s905d-p230    | arm64  | lab-baylibre    | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54ab7320c420d87117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54ab7320c420d87117=
978
        new failure (last pass: next-20210629) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3328-rock64           | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e542fe88feb10bbb117974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e542fe88feb10bbb117=
975
        failing since 21 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54657deb18595fe117975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54657deb18595fe117=
976
        failing since 146 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/60e54d9dde11bb3ff211798f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e54d9dde11bb3ff2117=
990
        new failure (last pass: next-20210706) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5444fde9ccbb0e6117983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210707/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5444fde9ccbb0e6117=
984
        failing since 146 days (last pass: next-20210209, first fail: next-=
20210210) =

 =20
