Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8F3252D06
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 13:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgHZLyE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 07:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729204AbgHZLx7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Aug 2020 07:53:59 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2332C061574
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 04:53:59 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id t185so839285pfd.13
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=60ul5Ao7IStJdFcvDIFQOqcm3PT21DF4b6DGDX5kDjU=;
        b=oQxMqZXi1pdYyDRNBpLmYcEOrGMmOn+LVjfqpOXIxPdv7orwhWOIPNwNNNDffTDcSE
         Is3jDz6oc2q0WpIDRRueR+qexqMnyLRMzn5mImtC/1/A03CVANVnC+/hQbB3HdsVwUGS
         aR+WWf/yivcXehYkbqwpn0/q6dK0QNP4sIpReRQpzeDe4404sZ3JBYwXkzgR3HGasUYD
         HCOIVxwrnUXmu1cYQ3g7BhV5ZFOkpK5dm5EgnznXGyqryZeTtL/qlfHbhSf3otuEdYQH
         AT8u5moM5Fy60qLeNSzm5PFRmY0adLZcbogKpsg9CkKlhk06sIUlxiRIGnPcZpUk+Nia
         qBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=60ul5Ao7IStJdFcvDIFQOqcm3PT21DF4b6DGDX5kDjU=;
        b=TjWoV9KCFH6lYtlyhzpBi+SbFwiChqm72FsnNPQhUTxhMOZeAqodcdHizCtMKYbDnJ
         0+vDdPL6H1MZ+CmouJdo8IxD87h3SpxIGAuWHcWVwhqW5AKrjtHAHcMSxR0KjyOUbBN9
         8fdiFCkFfrPWje1XkVethFOiH/kfSbTW80mV+pbRhQoQSTZbmE1XEtPR+enDff99AhUp
         qIuuz6wmaxsdUppUCXVwYkOF98YEQTNcvWa1W0LgdTU/DNBhR6adLEbTpRhpabCDN4Ua
         Afwgu0XcK4WmKx8vFkLezq1S2GdMWJuP9G5l1kJGwghEntjPKWfrAfGHcb/TqZqrA9W3
         ENyA==
X-Gm-Message-State: AOAM5311gpdtUUA7wORNkYS40aYQ4h3UdDGPG+P0kiPNglGDBqjoiCFp
        H4zNV5QNzGyDMB/fr/JbpcfeHCVpaUoGfQ==
X-Google-Smtp-Source: ABdhPJz5HNKzqNKRqtKVBeOFSLUXeUaIAZj6IG64/JPMg0xCHOMu6x313TNf+lax1+JEDoJvx6sn3A==
X-Received: by 2002:a62:5e04:: with SMTP id s4mr11962665pfb.67.1598442838042;
        Wed, 26 Aug 2020 04:53:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e29sm2686877pfm.127.2020.08.26.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 04:53:57 -0700 (PDT)
Message-ID: <5f464d55.1c69fb81.a4635.5f28@mx.google.com>
Date:   Wed, 26 Aug 2020 04:53:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200826
Subject: next/master baseline: 473 runs, 12 regressions (next-20200826)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 12 regressions (next-20200826)

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

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 83/88  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200826/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200826
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f37be72473a007d5d66c52f6cdf43fc8c0961f95 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46161624f5d14d209fb437

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46161624f5d14d209fb=
438
      failing since 119 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4622c55d8f21649c9fb42c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4622c55d8f21649c9fb=
42d
      failing since 5 days (last pass: next-20200820, first fail: next-2020=
0821)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46187cc11d40940e9fb43f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46187cc11d40940e9fb=
440
      failing since 2 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4619c442067bc05b9fb444

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4619c442067bc05b9fb=
445
      failing since 32 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f461b07b6873c557d9fb42f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f461b07b6873c557d9fb=
430
      failing since 32 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f461eda97f7d53a9a9fb475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f461eda97f7d53a9a9fb=
476
      failing since 2 days (last pass: next-20200821, first fail: next-2020=
0824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f461632c7c8c3e9b19fb443

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f461632c7c8c3e=
9b19fb449
      failing since 41 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-26 07:58:36.511000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-26 07:58:36.517000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-26 07:58:36.523000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-26 07:58:36.529000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-26 07:58:36.535000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-26 07:58:36.540000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-26 07:58:36.546000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-26 07:58:36.552000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-26 07:58:36.558000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-26 07:58:36.563000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f46197b4aa00c04729fb440

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f46197b4aa00c0=
4729fb446
      failing since 41 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-26 08:12:37.875000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-26 08:12:37.881000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-26 08:12:37.887000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-26 08:12:37.893000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-26 08:12:37.899000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-26 08:12:37.905000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-26 08:12:37.911000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-26 08:12:37.917000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-26 08:12:37.923000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-26 08:12:37.929000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4618fed46b3e7c159fb455

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4618fed46b3e7c159fb=
456
      failing since 35 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46179edd260961129fb44e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46179edd260961129fb=
44f
      new failure (last pass: next-20200825)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f4617472cf7f9b4399fb430

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200826/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200826/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f4617472cf7f9b=
4399fb489
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      11 lines

    2020-08-26 08:03:08.628000  kern  :alert : Mem abort info:
    2020-08-26 08:03:08.632000  kern  :alert :   ESR =3D 0x96000006
    2020-08-26 08:03:08.638000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-26 08:03:08.641000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-26 08:03:08.645000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-26 08:03:08.648000  kern  :alert : Data abort info:
    2020-08-26 08:03:08.652000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-26 08:03:08.655000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-26 08:03:08.663000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000efc35000
    2020-08-26 08:03:08.674000  kern  :alert : [0000000000000010] pgd=3D000=
00000ebfd6003, p4d=3D00000000ebfd6003, pud=3D00000000ebfd4003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f4617472cf7=
f9b4399fb48a
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      2 lines

    2020-08-26 08:03:08.695000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =20
