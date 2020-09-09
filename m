Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C1263301
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 18:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbgIIQzL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 12:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730699AbgIIPwj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 11:52:39 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F92C06136D
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 07:13:09 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id m5so2145991pgj.9
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dOFu0ijUgv7w8BBWoOzQ6rXl2M6HsXqqu8P0+QLRG6o=;
        b=NALkRTVH7jPo3Ig29xVmQejoBQOxhzHHsDUEhx4pVwhejckSS4910wGdBOQjvz/6X+
         Vu/r+Po0vZjyDUI8uHJf6xQjhAczmlJPpn9lQQ/khdR1cuDqCaIQBTpR9XMNrAondynh
         l2zBjYTxhqmk1QWW2TukyyhHz1VgTwBF6zrvOI76fVwvd452Dz4N9m4rYCG6ZYAVF7OH
         sUY9YWlt02hxSopLeJ56Tp+X+I1p+7BIDSMZ5f5LTeVZAfA6lTg0t/Ovk3EAZqWLkN+2
         7JOVMRGA2biiR5MAPzszKD336fJcqIBnYfSvZ0lym2lR3rzSGMNzA0UtB8QwIkuaBkoK
         p6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dOFu0ijUgv7w8BBWoOzQ6rXl2M6HsXqqu8P0+QLRG6o=;
        b=JxsJvvlVMfwFHTYzV/L7j5vhli2mKrAz62MRZs79ia2x7i1LNUJRinKZpE1Luf0uhh
         0+41wE1HYKTx1cujogN/j2UtqMHYzG/A8UA69w1o4suZ58Obe/PCmkmUMndwse3ijahO
         G02LXLqbtFOicXjUUDRZDGjchdhdt+tV7wT+YJdbA4VMmu9SDuNVgSfz1V++bXKd2qtQ
         +LAbwpqWl1Tkw7+P4vNiJE+KQDeOsHOFT0MZDyQLb5K/lwC5UjoBpBebTJUXEXlH3cgY
         lSKYasrceIVN9p7r275j62xvcaotpIexugaErhJTwCqWLiLviwuLFvfnsLMWbUNrPd1P
         sTKQ==
X-Gm-Message-State: AOAM532nVyelYyh/svysOH0hZkABAK2IuIDKLLbUnzkNH+SKfXnTIAug
        3YYgGAxvCJkptiDmIvoWhyhKXD2C2xPFsg==
X-Google-Smtp-Source: ABdhPJyZm3AJBcO6gp/LtG9SNl5FHh1Lmzc9GapIwh3DBJni6m3pXNb37oHwPgdGEGYItTFE3RiqCg==
X-Received: by 2002:a63:7f59:: with SMTP id p25mr779454pgn.146.1599660787399;
        Wed, 09 Sep 2020 07:13:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m21sm2954128pfo.13.2020.09.09.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 07:13:06 -0700 (PDT)
Message-ID: <5f58e2f2.1c69fb81.3f1f.7fd0@mx.google.com>
Date:   Wed, 09 Sep 2020 07:13:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200908
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 288 runs, 7 regressions (next-20200908)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 288 runs, 7 regressions (next-20200908)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
odroid-xu3        | arm  | lab-collabora | clang-10 | multi_v7_defconfig   =
        | 0/1    =

odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 0/1    =

panda             | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 4/5    =

panda             | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 4/5    =

panda             | arm  | lab-collabora | gcc-8    | omap2plus_defconfig  =
        | 0/1    =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200908/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200908
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dff9f829e5b0181d4ed9d35aa62d695292399b54 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
odroid-xu3        | arm  | lab-collabora | clang-10 | multi_v7_defconfig   =
        | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58dee27827216f73d35396

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58dee27827216f73d35=
397
      failing since 19 days (last pass: next-20200820, first fail: next-202=
00821)  =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58dda33cd5fce187d35381

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58dda33cd5fce187d35=
382
      failing since 46 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
panda             | arm  | lab-collabora | gcc-8    | multi_v7_defconfig   =
        | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f58b015e02dd41fe8d3538b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58b015e02dd41=
fe8d3538f
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-09 10:35:59.213000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-09 10:35:59.219000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-09 10:35:59.225000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-09 10:35:59.231000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-09 10:35:59.238000  kern  :alert : BUG: Bad page state in proce=
s<6>[   34.075927] smsc95xx v2.0.0
    2020-09-09 10:35:59.240000  s swapper/0  pfn:9c806
    2020-09-09 10:35:59.246000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-09 10:35:59.252000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-09 10:35:59.258000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-09 10:35:59.264000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (52 line(s) more)
      =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
panda             | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f58b22042ac856e8fd35373

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58b22042ac856=
e8fd35377
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-09 10:43:52.817000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-09 10:43:52.823000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-09 10:43:52.829000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-09 10:43:52.834000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-09 10:43:52.840000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-09 10:43:52.846000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-09 10:43:52.852000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-09 10:43:52.857000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-09 10:43:52.863000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-09 10:43:52.869000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
panda             | arm  | lab-collabora | gcc-8    | omap2plus_defconfig  =
        | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58b628cc31c28279d35380

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58b628cc31c28279d35=
381
      failing since 49 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform          | arch | lab           | compiler | defconfig            =
        | results
------------------+------+---------------+----------+----------------------=
--------+--------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f58b4013eeca170f9d35379

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200908/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58b4013eeca17=
0f9d3537d
      new failure (last pass: next-20200903)
      4 lines

    2020-09-09 10:52:42.283000  kern  :alert : pgd =3D 03b9de52
    2020-09-09 10:52:42.295000  kern  :alert : [003bffc4] *pgd=3D8000000020=
4003, *pmd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f58b4013eec=
a170f9d3537e
      new failure (last pass: next-20200903)
      42 lines

    2020-09-09 10:52:42.320000  kern  :emerg : Process kworker/0:1 (pid: 29=
, stack limit =3D 0x76c2a364)
    2020-09-09 10:52:42.320000  kern  :emerg : Stack: (0xea1fdd70 to 0xea1f=
e000)
    2020-09-09 10:52:42.332000  kern  :emerg : dd60:                       =
              ea1fdda2 00000001 ffffffff c08312e4
    2020-09-09 10:52:42.332000  kern  :emerg : dd80: ea1fddf0 ffffff04 ffff=
0a00 c0da4628 00000016 e9224000 ea1fdda2 e9224000
    2020-09-09 10:52:42.345000  kern  :emerg : dda0: c16bb5ec c0835140 c16b=
b5ec ffffff04 ffff0a00 c0af5194 e941e420 e9224000
    2020-09-09 10:52:42.357000  kern  :emerg : ddc0: 16ddbfff ea1fc000 e941=
e400 ffffff04 ffff0a00 2d8e927c e90afac0 ea1fc000
    2020-09-09 10:52:42.370000  kern  :emerg : dde0: ea1fc000 00000002 e922=
4000 e941e420 c1bc1930 e941e400 e940a000 c08354c0
    2020-09-09 10:52:42.370000  kern  :emerg : de00: ea1fde18 2d8e927c e922=
4000 00000000 c0dd3fa4 c16bb5ec 003bffc4 2d8e927c
    2020-09-09 10:52:42.382000  kern  :emerg : de20: ffff0a00 2d8e927c 003b=
ffc4 2d8e927c ea1fc000 c1bc07b4 e9224000 0000004a
    2020-09-09 10:52:42.394000  kern  :emerg : de40: e940a000 e940a000 e922=
4000 c1692f20 e940a000 c0dd4048 0000000f 00000000
    ... (31 line(s) more)
      =20
