Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822C42510B6
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 06:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgHYEZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 00:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgHYEZ5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 00:25:57 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E36FC061574
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 21:25:57 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q1so561861pjd.1
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 21:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oloMvMfv0PkZHz53lpPmqQ7EmU+58CaFrm+JTasK+5k=;
        b=ACciLTZTrf15EMayBavVVileVpk7UP8Ne3RUU90uIB2o2+5Zfqd8QWhVdgImiMugWF
         JKc85YrLIiDUyhk7S9wRWp2U9tAr3WFYin3F+5rk5FSq6yD+zWGox1cP5yl6/iLLxOyj
         CvgC0bxeDtK/urWVVRRcWkY3HBbaEBJ7c6A0L1fN2ZXp5gf8SPltg9jOWmZdDsqZhXG+
         xvu6PO+ITaMzCsERa5GbhL9DLX71zSFDVTwVazw7luCvx93VijpBXASAgzoAg5pLFLZf
         g1GdYteMbiWS0wVYHxY9L3tG86AsExQ1l2pgUlPzw5k7ahQQDlkxBi4/qUveuaQekttR
         nvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oloMvMfv0PkZHz53lpPmqQ7EmU+58CaFrm+JTasK+5k=;
        b=rbMTWV1v1FAI4y/lw9nCwRt2Q4Nie1jzuptc5/NNvQc39vZjJwGBKSonJM6vxOHsXo
         DL1YzS4Pmz/iCtLlSFexQTjv2y3Dq2Fq1o+Jw0KQi1QWsJFkCGnozjQa03w7QYUhDofK
         XjRPPw9Od3agCOf36OznDwNLNHQoFgjTsDGsFgjjbC7Iqq6AqaFGfogVvxhAwpt08MYT
         xj5ht7kT7XvciOXRDgU4fx4XKosBT9piKSQ7KQvIOFepa30ScjbCqzbRCJIGwDL5/mg0
         Y1+yacK8g0Q7lOFd9JfMXloLA+k6kaGyFAJIe1YgIh43ZmbmJOkbabH9uEpOkQYmcYwz
         FFPA==
X-Gm-Message-State: AOAM533m7IlSI89MnsdzE3BV6xHuN0dcaTeUVzxOZ6kPUXE+KGSsbPMn
        80oK66bWmbouXbA+ck+QjNYbVXtI5xiB1Q==
X-Google-Smtp-Source: ABdhPJxojMMUga2ITYEQeBiCMyUPKe7+tWp6oT25TPE/dL0risbaCciqEICNpTRU0MDKe27FxFX4ZA==
X-Received: by 2002:a17:90b:4012:: with SMTP id ie18mr75607pjb.118.1598329556314;
        Mon, 24 Aug 2020 21:25:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g7sm1084636pjj.2.2020.08.24.21.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 21:25:55 -0700 (PDT)
Message-ID: <5f4492d3.1c69fb81.73c94.4039@mx.google.com>
Date:   Mon, 24 Aug 2020 21:25:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-260-g90854ecf6e2a
Subject: next/pending-fixes baseline: 166 runs,
 5 regressions (v5.9-rc2-260-g90854ecf6e2a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 166 runs, 5 regressions (v5.9-rc2-260-g90854ec=
f6e2a)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 0/1    =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 0/1    =

omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 4/5    =

omap4-panda      | arm   | lab-collabora | gcc-8    | omap2plus_defconfig  =
        | 0/1    =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc2-260-g90854ecf6e2a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc2-260-g90854ecf6e2a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      90854ecf6e2a489b82a57529ba6b524fd7749b48 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4455675bf3c379129fb486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4455675bf3c379129fb=
487
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4456040a5e7ffe419fb454

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4456040a5e7ffe419fb=
455
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f4459ee712f3103399fb447

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f4459ee712f310=
3399fb44d
      failing since 19 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-25 00:23:03.796000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-25 00:23:03.801000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-25 00:23:03.807000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-25 00:23:03.813000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-25 00:23:03.819000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-25 00:23:03.824000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-25 00:23:03.830000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-25 00:23:03.836000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-25 00:23:03.842000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-25 00:23:03.847000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
omap4-panda      | arm   | lab-collabora | gcc-8    | omap2plus_defconfig  =
        | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f445842327f49d3189fb43b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f445842327f49d3189fb=
43c
      failing since 19 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform         | arch  | lab           | compiler | defconfig            =
        | results
-----------------+-------+---------------+----------+----------------------=
--------+--------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44556b81af4e7d769fb439

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-26=
0-g90854ecf6e2a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44556b81af4e7d769fb=
43a
      failing since 3 days (last pass: v5.9-rc1-381-g159f8cd76711, first fa=
il: v5.9-rc1-419-gdb8c0d8e5d3c)  =20
