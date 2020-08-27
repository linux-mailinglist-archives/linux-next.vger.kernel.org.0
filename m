Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BDD2542F9
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 12:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgH0J75 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 05:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgH0J7z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 05:59:55 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3C4C06121B
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 02:59:55 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id o13so3008094pgf.0
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vb0gUP/1bmrtUmO/PGHwOHC4YXPcByLp96+6H0wMqf0=;
        b=GPFFpugNJcIuP0PZ6if4AZw38lfHrxNl9H/PhwbrUkj6rAbHxBWWMmBT0gTns4+pK7
         vsVY/rojlyQkRdI3sUgLiV8jm8w1h19o7I++UhzMed8Aixe4ihS7gszsnSJ+35vKmrr9
         noplUYzTXuTTSkwUQ9QdICIgXaXkOA3HSfqN56h7VFlrA/ttUtXXzCJ9yIKPAhqnEFst
         GICaChDY4T7zhNeDYxDqg2w1kZZ956wwl6Q0Pi8Jm0RoeJJi7RPAGOqI2gFgKlMXJ+SY
         r4wxAtdznGZF2xBkyGgpbMmC5UPAOGDCNvKf0RN66dybp4SlTZTaopwM+m/4uZhcAaXB
         KVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vb0gUP/1bmrtUmO/PGHwOHC4YXPcByLp96+6H0wMqf0=;
        b=JeeySTFI4u99uQHIKqyokZUcJ2hz+siYfJbn0CnV9tts5L2yHtSa7grvvVbT+nO6/b
         MqaFy8tlxLCMKmAEYf4l+J1aLlEhadpEfTottgwtjqZ1Kk4oIKLon7HJhZzInl93RmTG
         +1bmDvdiHxQugApI4gTHkl/iTh8kUWyNQW0DGDOdNfY44bHJonBw5PtQZjSbmbXgocab
         Q8/PNL629WduBv200EVqsoPt2RiFhlpf+9eFXae7F5QqHO9DWtftrTZz5IUEwq9LcAdi
         +DF54Xn61ZomlsbG+QU0WE7Qw9wjNJ4CFuXn6f/vG+pcvZHh+YamNdaQRLBceyPEJVC0
         NKcQ==
X-Gm-Message-State: AOAM532xIZdf1Ll3wIKKcohJL2NABKC8YSh/bsxDR81B6L9mXjH64uCF
        wzlRK6V1igj+/gxHmWSE0pRjx0tihyzJ8Q==
X-Google-Smtp-Source: ABdhPJyrLebZrLl4PXeu5fk9G/U9qK4UT3eQawVIFElidaljidL+R6500Y3pUacDv3TreIEyWV9Mgw==
X-Received: by 2002:a62:5a81:: with SMTP id o123mr5036117pfb.213.1598522390371;
        Thu, 27 Aug 2020 02:59:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f24sm1621970pjt.53.2020.08.27.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:59:49 -0700 (PDT)
Message-ID: <5f478415.1c69fb81.638c0.4825@mx.google.com>
Date:   Thu, 27 Aug 2020 02:59:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200827
Subject: next/master baseline: 462 runs, 10 regressions (next-20200827)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 462 runs, 10 regressions (next-20200827)

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

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200827/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200827
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      88abac0b753dfdd85362a26d2da8277cb1e0842b =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4749902121601ee19fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4749902121601ee19fb=
42c
      failing since 120 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f475988fe7605d9909fb42f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f475988fe7605d9909fb=
430
      failing since 6 days (last pass: next-20200820, first fail: next-2020=
0821)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f474f658d09d078a29fb43d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f474f658d09d078a29fb=
43e
      failing since 2 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f474cdec226d086759fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f474cdec226d086759fb=
42c
      failing since 33 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f47532d22d136b8e99fb42c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f47532d22d136b8e99fb=
42d
      failing since 2 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f47584f1b40a497b69fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f47584f1b40a497b69fb=
42c
      failing since 33 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f474d2b7de24f2c0e9fb42b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f474d2b7de24f2=
c0e9fb431
      failing since 42 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-27 06:05:25.439000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-27 06:05:25.445000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-27 06:05:25.451000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-27 06:05:25.457000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-27 06:05:25.463000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-27 06:05:25.469000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-27 06:05:25.475000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-27 06:05:25.481000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-27 06:05:25.487000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-27 06:05:25.493000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f474dc60189829dc69fb447

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f474dc60189829=
dc69fb44d
      failing since 42 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-27 06:08:00.985000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-27 06:08:00.989000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-27 06:08:00.999000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-27 06:08:01.004000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-27 06:08:01.008000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-27 06:08:01.013000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-27 06:08:01.018000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-27 06:08:01.027000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-27 06:08:01.032000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-27 06:08:01.037000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f474c2f51fda3a2619fb446

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f474c2f51fda3a2619fb=
447
      failing since 36 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f474a56854399d81e9fb443

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200827/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200827/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f474a56854399d81e9fb=
444
      new failure (last pass: next-20200826)  =20
