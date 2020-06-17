Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846DD1FCB3F
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 12:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgFQKsu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 06:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQKss (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 06:48:48 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AFFC061573
        for <linux-next@vger.kernel.org>; Wed, 17 Jun 2020 03:48:48 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id i12so798187pju.3
        for <linux-next@vger.kernel.org>; Wed, 17 Jun 2020 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2QhlW0D5HQR6JOG41L9TDanbwncqIYXlQNRULGb/YPE=;
        b=YwbaE0QEV973/VKaViX637FMigVrDhNqAo+nnGkmjcsmPrO31QWoiaZ+X8f/WsWFgK
         m1+sg+LHvIrDycsFe5dyxTZVnjvjZ2whlrrIPbFamkRKKxFO/DWvDnRVZmKQKWMLcVGH
         KrKsyUFJFfI9FXdgGP1zPwB5WNGzOWlbCpytUmKRxz5dm1fbcDBcCETXvRIaKD5mX/O3
         hCt1gvzhtEqaC96EOJEdJqcNekwkLxjhcOCGMto32pWIdWjZdqqQe/WeoCs754KUFWh3
         3s4kn8ePra7Decds5oWsC8JEjuPI78nprr+NUt7nR2cFrHaslKC92sNkQxuStJAEAjjA
         f1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2QhlW0D5HQR6JOG41L9TDanbwncqIYXlQNRULGb/YPE=;
        b=rUXMMeEbAmQzHTPzDkZiIgDgznNvwSxmHZuPWJY1UCDo1YH5F5vHd/Atmk7ijNvtBW
         KpDntm0T+NoE1Ohc5CXTTJI9jyKl7m3ZqzQ9uJyCfvy2IJpvkgII59l93xueyWpIBEIh
         jheSlHlHhzLo6peJjeAYuazCo8JEHu2EuZjeIEmZnba5yAzLDuoWRX5M7jZ5nwkq8QQw
         /2aiUO7Rg+u/NnwWBpImKjaxnC9XFe6m3gKHgnA855g7Y0YM55CC8H+peALCaxIZsSUQ
         oyLZMyVFr8JeVMgmOOwb5nHGWrSmtxpD39FGq3FUOUCCkXEYmbCcbp58eK1aQjIt3pUS
         TaGA==
X-Gm-Message-State: AOAM533DUn6QwDiQzmMtQz8V+lCd2enIn9j7EHtUvGXhwvyPwVSVPNR/
        S6tN8GM3fXQB2bEwG831yO6HBcMtdHg=
X-Google-Smtp-Source: ABdhPJxuA1q1oYkMl1OtEi2HaM1Rr4Wa2dsztERFyCds3ylx0eC6tMw1Eauup35AUTf+7UBC/TQIGw==
X-Received: by 2002:a17:90a:aa83:: with SMTP id l3mr7155099pjq.73.1592390927841;
        Wed, 17 Jun 2020 03:48:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y3sm19411413pff.37.2020.06.17.03.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:48:47 -0700 (PDT)
Message-ID: <5ee9f50f.1c69fb81.aa5d2.de18@mx.google.com>
Date:   Wed, 17 Jun 2020 03:48:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200617
Subject: next/master baseline: 59 runs, 5 regressions (next-20200617)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 59 runs, 5 regressions (next-20200617)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-8    | sama5_de=
fconfig       | 0/1    =

da850-lcdk                   | arm  | lab-baylibre    | gcc-8    | davinci_=
all_defconfig | 3/5    =

imx27-phytec-phycard-s-rdk   | arm  | lab-pengutronix | gcc-8    | imx_v4_v=
5_defconfig   | 0/1    =

ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig    | 0/1    =

vexpress-v2p-ca15-tc1        | arm  | lab-baylibre    | gcc-8    | vexpress=
_defconfig    | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200617/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200617
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5fcb9628fd1227a5f11d87171cb1b8b5c414d9d9 =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-8    | sama5_de=
fconfig       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee9bf36319c9e1fa897bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200617/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200617/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee9bf36319c9e1fa897b=
f11
      failing since 49 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
da850-lcdk                   | arm  | lab-baylibre    | gcc-8    | davinci_=
all_defconfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee9b9b4b911334e0b97bf09

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200617/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200617/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee9b9b4b911334=
e0b97bf0e
      failing since 0 day (last pass: next-20200614, first fail: next-20200=
616)
      33 lines =



platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
imx27-phytec-phycard-s-rdk   | arm  | lab-pengutronix | gcc-8    | imx_v4_v=
5_defconfig   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee9bea4d1060a02b697bf25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v4_v5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200617/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200617/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee9bea4d1060a02b697b=
f26
      failing since 0 day (last pass: next-20200615, first fail: next-20200=
616) =



platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee9be0c2163a97f4c97bf22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200617/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200617/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee9be0c2163a97f4c97b=
f23
      failing since 0 day (last pass: next-20200615, first fail: next-20200=
616) =



platform                     | arch | lab             | compiler | defconfi=
g             | results
-----------------------------+------+-----------------+----------+---------=
--------------+--------
vexpress-v2p-ca15-tc1        | arm  | lab-baylibre    | gcc-8    | vexpress=
_defconfig    | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee9c0944841aa613097bf09

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200617/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200617/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee9c0944841aa61=
3097bf0c
      failing since 11 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
