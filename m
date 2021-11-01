Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068A64420C8
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 20:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhKAT1N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 15:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbhKAT1N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 15:27:13 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84F5C061714
        for <linux-next@vger.kernel.org>; Mon,  1 Nov 2021 12:24:38 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y1so12218338plk.10
        for <linux-next@vger.kernel.org>; Mon, 01 Nov 2021 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CNfzR2Kd6ZWKFzxoRIWJBvkEbDfnSSObOCCY9j0u5jw=;
        b=kP52zVSPwJlXRpVV8k6zp9QQp9Yd4V3bftNnUMPA5TiYq3trD+uEUlVxrT9wqpIy30
         /nMykiVLD0k9k07FjUPlCppk8rWvTrQB9RW/mD5lYzw4dv8Hse+kUSXVR3qHZw+NRmaw
         NrGVwzmzu3xhALY+i1rH0hLF5+Obfe54AeJTYVGomFfrxZUOMzIoRWw+RyB97qcXn26i
         HuVg+Z51a0r94Mz8crx0M/boKMRixPCM9ujUhFmhuM/I/3JWB0JqN6kCo2YQmrOFBE0/
         LFc5f0d6UbFUy6n8sxY4kNSypAP6UFQGhEpGP+o0WSrCWsX9z1wd/W+UUsCi5fuNGB5D
         8xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CNfzR2Kd6ZWKFzxoRIWJBvkEbDfnSSObOCCY9j0u5jw=;
        b=NpD7tdCS0We3lG79JIvt+EcWXJMfwSSIpI793WB5TOO/0OwLgQVe+2QfQSayAbLDF1
         l9EGHRJEmaiGQPgdwt4w36Tx5tAWOfZkBwHisypx55hyacGx0b7Fylmy/BIA3fdKnGPi
         e5G1KC5KpOE/4lysZ+J+dsUo7dR6fGo/fJ//8uxMoF6zz42qfUuXOIjzoZe6O0QpvxQv
         HRH2TipwyW0tElD+jOLL3l0imONBmrBxte88KH0NHjR31MM9g63i20sFP77H6TZ3zSOI
         gNGYjIcC5p8WAdp3/S7ohPwvQMnZ4chci1eJhjcFirAJgjudf8oz5cQEEsXdDpq0ZOMo
         D+qw==
X-Gm-Message-State: AOAM531YA3HwiEdMN3f/EJ+l7ejo9scOy0qCQzS9ICGm/+N6b3CgwLlw
        DM2IqoAvKH1nu+w8jn2EXPUyJlotezoeDpth
X-Google-Smtp-Source: ABdhPJzap4tV6U1SovlWk/zl2bOLicLY7hJxGBdH6axq3zhkGbmlqVGet1e3zPxMkEgfi5u4iiGuZA==
X-Received: by 2002:a17:902:758c:b0:141:4c99:22b3 with SMTP id j12-20020a170902758c00b001414c9922b3mr26762079pll.40.1635794677823;
        Mon, 01 Nov 2021 12:24:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id il17sm204285pjb.52.2021.11.01.12.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:24:37 -0700 (PDT)
Message-ID: <61803ef5.1c69fb81.9a61a.0e99@mx.google.com>
Date:   Mon, 01 Nov 2021 12:24:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211101
X-Kernelci-Report-Type: test
Subject: next/master baseline: 612 runs, 2 regressions (next-20211101)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 612 runs, 2 regressions (next-20211101)

Regressions Summary
-------------------

platform           | arch  | lab          | compiler | defconfig           =
         | regressions
-------------------+-------+--------------+----------+---------------------=
---------+------------
beagle-xm          | arm   | lab-baylibre | clang-13 | multi_v7_defconfig  =
         | 1          =

meson-g12a-x96-max | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZ=
E_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211101/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211101
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9febf119430617d18e1b6ee4b41ce7b07965e21f =



Test Regressions
---------------- =



platform           | arch  | lab          | compiler | defconfig           =
         | regressions
-------------------+-------+--------------+----------+---------------------=
---------+------------
beagle-xm          | arm   | lab-baylibre | clang-13 | multi_v7_defconfig  =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6180083c14df9c61503358ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211101/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211101/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6180083c14df9c6150335=
8ed
        failing since 5 days (last pass: next-20211026, first fail: next-20=
211027) =

 =



platform           | arch  | lab          | compiler | defconfig           =
         | regressions
-------------------+-------+--------------+----------+---------------------=
---------+------------
meson-g12a-x96-max | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZ=
E_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61800cc79422858d043358fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211101/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211101/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61800cc79422858d04335=
8fe
        new failure (last pass: next-20211026) =

 =20
