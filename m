Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B63A255807
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 11:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgH1JwH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 05:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgH1JwD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 05:52:03 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB276C061264
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:52:02 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id nv17so280381pjb.3
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2QDUMY06MaS1u197fweKP2MKf5hA/VfVYumZk7znMFQ=;
        b=phmj9rnbN6Zc8h24TDOLAqbFFpCyscRj1/BYEougu83208S5EBMQvlhON6/fKJAHpS
         ljcBzStpN3lNxUTMwJh9rhbSZHzOVc3Mjgi9rrp9IUU2yltWP6avMtvX/EM6DzwAjG5p
         wURCHpFAUmK+Km/zwJvErsYc2redOz3eDUsHYkVhcVv1mj4wMGERjLLavPrvdejL0XI/
         g9TFJzD7EN6inE8CrICQwbckbM7XcxUh81piG5b4uQePyf/nZDEEgnOSV7A8FeRYc5Do
         5LBvOJNHjfST4uXQNVC/+POtTICqLZ0edLonEDr8eYqxw0qu1Rf0r6TrZYobitT3Masx
         mDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2QDUMY06MaS1u197fweKP2MKf5hA/VfVYumZk7znMFQ=;
        b=Lslxam1CgTP2Gs1PEpyGCW7Lb6AwF3zOWscUqgE4mFbDxGSfQ3UU4Vu0VkbCmVCNyy
         KN517VbgTI4nXFhuakZjltU9qRjFLs3POik+M3zBCUzIaFO8EX0QQA/r0Z244PpyA0vt
         RDBNP1cwWbs7G5lno9/UzaRGPmhB7GxTRZRgUyuYtSRN5/gr9sp0NCx0MHw1RgENjoRU
         1Q/FKq2ZGJU67eK+I+HWYMe5Q5SYKtlfS29GJ7sHk6ZYKXgFodZjocmOvvNx1jBiyYU7
         7+XoP/OplgGYyzEv5JIV/tXd7CtLl3SDo5t9UDvcYno6zPlQyhVhHaX5Xb0EFhlrGocY
         5d9w==
X-Gm-Message-State: AOAM531CBp1Nayn8yJnR4XsT2PlmLu+S1iXjkGOQFzcxlWv34B83L0rk
        bR6xNjUBWusDb4sTrjM96kc3rnBmlDmJkg==
X-Google-Smtp-Source: ABdhPJwM0UJDMCbZUuxzi6mMOf8hQc6E11eh9z+HSUpL4qiy37DfqcxbkJq5DboiQiDgRG//jdvstQ==
X-Received: by 2002:a17:902:9f86:: with SMTP id g6mr700033plq.32.1598608320243;
        Fri, 28 Aug 2020 02:52:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gt24sm796218pjb.15.2020.08.28.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 02:51:59 -0700 (PDT)
Message-ID: <5f48d3bf.1c69fb81.7acb.1502@mx.google.com>
Date:   Fri, 28 Aug 2020 02:51:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200828
Subject: next/master baseline: 450 runs, 10 regressions (next-20200828)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 450 runs, 10 regressions (next-20200828)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200828/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200828
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b36c969764ab12faebb74711c942fa3e6eaf1e96 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f489c65ed41ca38a09fb435

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f489c65ed41ca38a09fb=
436
      failing since 121 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48b69a278bd84f4f9fb42d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48b69a278bd84f4f9fb=
42e
      failing since 7 days (last pass: next-20200820, first fail: next-2020=
0821)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f489f790e37996f999fb453

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f489f790e37996f999fb=
454
      failing since 3 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48a5f605e10663289fb46c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48a5f605e10663289fb=
46d
      failing since 3 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48a88a56835299ac9fb51f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48a88a56835299ac9fb=
520
      failing since 34 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48a9c31366dea51c9fb432

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48a9c31366dea51c9fb=
433
      failing since 34 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f489ee0d4ad8f718b9fb47e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f489ee0d4ad8f7=
18b9fb484
      failing since 43 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-28 06:06:18.804000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-28 06:06:18.810000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-28 06:06:18.816000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-28 06:06:18.822000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-28 06:06:18.833000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-28 06:06:18.834000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-28 06:06:18.840000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-28 06:06:18.846000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-28 06:06:18.851000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-28 06:06:18.858000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f489f94f3e51f95129fb4c0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f489f94f3e51f9=
5129fb4c6
      failing since 43 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-28 06:09:16.336000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-28 06:09:16.341000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-28 06:09:16.347000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-28 06:09:16.353000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-28 06:09:16.358000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-28 06:09:16.364000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-28 06:09:16.370000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-28 06:09:16.376000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-28 06:09:16.382000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-28 06:09:16.387000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48a0ec9bc89496079fb451

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48a0ec9bc89496079fb=
452
      failing since 37 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f489e70b72ce827f09fb456

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200828/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200828/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f489e70b72ce827f09fb=
457
      new failure (last pass: next-20200826)  =20
