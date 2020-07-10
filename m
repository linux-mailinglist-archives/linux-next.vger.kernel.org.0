Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538D121BD07
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 20:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgGJSbg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 14:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgGJSbg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 14:31:36 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99753C08C5DC
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 11:31:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 1so2887892pfn.9
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=m3Ft+C84SBy53n20Vw3VpX8LZZc/Y9W9M+Coz3AG8rc=;
        b=Kq9W3Efq0drj6qXTR+BNJ7b0FCiZc4dl7Rz9DlWInC+coCgJrrhN8F6Fe7SX9KI8V3
         FbdYZYVVk7utBrOxEk399UwStguncj/aXN92V1XKmEF4zTa/RkNoeRwq8pJNnlMfO8nI
         +tfrxawlUCY9ilJxVU4nJ7IWx92d70nu5C5hA36GbPOpmA+6i2fsmFyLEbWXpu+aVH4u
         D3jfhKg6uACVcMsJtvPu2c/QJUyP98poT+GoZAzHZR0F8F3EptwPykUi0InTwHtrdSXW
         /1jMMqwtwurs2CAYbxP1iP/7EB7awaa4//Fj8gKZPnKlWZNM4KGfidrq+59cug7vEQhc
         Y1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=m3Ft+C84SBy53n20Vw3VpX8LZZc/Y9W9M+Coz3AG8rc=;
        b=f2DOeJkEkYzeKYNDhmCiHhXtrym1vwhk8sdDbwJ/+Mn+2adcd28yl97EYjGMp8+Pgt
         cBsCIK9TPX1IcE75LvC1JNPj4L/ws18eMzcx6KvdQH3oJWj2N0xtNVXspzwC7y0ovFF6
         dkBduIRuWwTPMj6wY4Cf1WxOcY80M8byYZSrIeJ4U9Q5E7EsTa4GiE6ft6AKcfiY0ZWZ
         Bi+94N+4ytHXmrIUWIJPazAZroeBJO7VkuHxk/99jM+Um+k6BscqsI/tSEo8L1cpECCV
         E6ke+pRsTwryk3lQA8LLbHgokyVlkGYl3J7eS4c5o9hXX9U34BD+OdG+Ad1ZwtPlLAYU
         rOiw==
X-Gm-Message-State: AOAM533QWhxrKFEF7QXtKwpsma5YEq5bOwDsmitT2hGETQDuC06Tghiv
        r56cXeuKiJ1wmjQywuCSpN4epyQ93O0=
X-Google-Smtp-Source: ABdhPJyiuUW/MVXs5k3goX4SquWRKmhmZ4x3YFB7wBzJoKX9vhuGLGIxMQqZDRbs5XblgMFfQPhN8Q==
X-Received: by 2002:a63:b06:: with SMTP id 6mr57662495pgl.116.1594405895762;
        Fri, 10 Jul 2020 11:31:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 64sm6709918pgb.63.2020.07.10.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 11:31:35 -0700 (PDT)
Message-ID: <5f08b407.1c69fb81.1c798.f96f@mx.google.com>
Date:   Fri, 10 Jul 2020 11:31:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200710
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 73 runs, 4 regressions (next-20200710)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 73 runs, 4 regressions (next-20200710)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
              | results
-------------------------+------+--------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained    | arm  | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =

imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

vexpress-v2p-ca15-tc1    | arm  | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =

vexpress-v2p-ca15-tc1    | arm  | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200710/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200710
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d31958b30ea3b7b6e522d6bf449427748ad45822 =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
              | results
-------------------------+------+--------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained    | arm  | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f087d62e76da330e285bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200710/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200710/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f087d62e76da330e285b=
b21
      failing since 73 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                 | arch | lab          | compiler | defconfig      =
              | results
-------------------------+------+--------------+----------+----------------=
--------------+--------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0881aa6138d5a73985bb2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200710/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200710/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0881aa6138d5a73985b=
b2f
      failing since 4 days (last pass: next-20200703, first fail: next-2020=
0706) =



platform                 | arch | lab          | compiler | defconfig      =
              | results
-------------------------+------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1    | arm  | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f08719dde7171874a85bb43

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200710/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200710/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f08719dde717187=
4a85bb46
      failing since 34 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                 | arch | lab          | compiler | defconfig      =
              | results
-------------------------+------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1    | arm  | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0871a53e684b628e85bb21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200710/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200710/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0871a53e684b62=
8e85bb24
      failing since 34 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
