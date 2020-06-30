Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEFA20F68A
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 15:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbgF3N7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 09:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388342AbgF3N7m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2020 09:59:42 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1851EC061755
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 06:59:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id d194so6616196pga.13
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vb5SjwUFMwMCzQkGQQ8xsJb+RbczcxdQj9aJpVXPn/k=;
        b=NqotgDrfUYrJnrhk6ElngFKctNYpUTp0eUGChc6rCWflVdS1NulJzFH8lkndByxF/d
         HMbBRmvoa0UDkIKGgtzeG/rULKJMcXmx4TSxxznGTzyYPT1oNbuE7p7y26Sb/EByjLto
         lu7hac+7Cp1blBD+IBGygTwKoQThOiweMO/tJNMQ9u0/JIlCo8FYDVQWLlmwzhPpGXT7
         zBd4zjxJMgeSv5udd3UDuzvi8e6RCj4DXpJuyVALQMtBnqPFe82iYy8ozkd4T1VTCUEJ
         h+LKTaMcA5eiLIkImK3W3TrGdt7V4V8WCpal/ebyT623xeTssEhghdlP8agfrBxKju95
         9YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vb5SjwUFMwMCzQkGQQ8xsJb+RbczcxdQj9aJpVXPn/k=;
        b=dctq6f0yNpGiqhIenTT67KtOegPhTwQ3cnpJefXlKu+/mrsDnvfhO1+BV32wwWOuZj
         nfEkAPC4xp8JBk1wed1ilFRkYGhl5fCm0VnS2JFD/fzXP/We2CWOeios4YAZmKW3YajW
         1hVhDeG0UlQQyrsbBeEki/1WhYszIX5cEfskUkd84A6bwuD4L4Kgy/inER3GWmX89V7q
         5Jk0ld6MHF3M8QBSB9PbmHlGDmlZfItP+6Ii5fX/1E5RWqi7kJuJoKK4i9IHArWJoJJV
         f1vwBU+Fv7j5uOoCsY0CjVBN1tPTeW8m/QxegybcNBlve7JiC6yFwGnRJNnBZTXxvjgJ
         5vng==
X-Gm-Message-State: AOAM530hlWrUqNnYcaCm2L1OSPZY4g7Bl3NuNPKu/yuKK9dXlr7XqCTt
        Sqqm5Ww+FvKniLLyVAJRNjipFg4XM1Q=
X-Google-Smtp-Source: ABdhPJyfd1tTb5SE/Z5IsjacfNziBvvJXp2pLAb7ZbYMQVgXkpoinZwdGD+6EvqAK2ZdmROaEg/aZw==
X-Received: by 2002:a62:8848:: with SMTP id l69mr14212955pfd.314.1593525580831;
        Tue, 30 Jun 2020 06:59:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c15sm2914261pgb.4.2020.06.30.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:59:40 -0700 (PDT)
Message-ID: <5efb454c.1c69fb81.9256b.7fc4@mx.google.com>
Date:   Tue, 30 Jun 2020 06:59:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200630
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 177 runs, 4 regressions (next-20200630)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 177 runs, 4 regressions (next-20200630)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 4/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-baylibre  | gcc-8    | vexpress_defconf=
ig           | 3/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-cip       | gcc-8    | vexpress_defconf=
ig           | 3/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-collabora | gcc-8    | vexpress_defconf=
ig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200630/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200630
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f2b92b14533e646e434523abdbafddb727c23898 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efb0dca697a84c7ff85bb71

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efb0dca697a84c7=
ff85bb76
      new failure (last pass: next-20200629)
      2 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-baylibre  | gcc-8    | vexpress_defconf=
ig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efb0726d73804aa7085bb23

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efb0727d73804aa=
7085bb28
      failing since 24 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-cip       | gcc-8    | vexpress_defconf=
ig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efb0741d73804aa7085bb47

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efb0741d73804aa=
7085bb4a
      failing since 24 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-collabora | gcc-8    | vexpress_defconf=
ig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efb073568f129b6c085bb29

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200630/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efb073568f129b6=
c085bb2c
      failing since 24 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
