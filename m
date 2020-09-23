Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882B9274F6C
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 05:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIWDMB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Sep 2020 23:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIWDMA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2020 23:12:00 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC24C061755
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2020 20:12:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d6so14165929pfn.9
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2020 20:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=B1jEx8tIC9EZBmbkbRsmLHIiL5/YLiLgd+sH0hYKA8Q=;
        b=uurFUTTwC9e9TbC4DdthjOswhelo/jecoB2c2S3pn9c0W3euozorlvMdZisbNYPXMY
         QkJj+61XUX8lOadEv9I6S9f7Q5OcbZ5v6f6F+v7i+n3LM+6Xjja7Jo4EU15Qw/2vQyeY
         GL9CsyNMa0GhZvmY+kDXwecsSsUub7kjCklDRJ8v/SorfNJp+BnuSXwC78mnWJB+mI2X
         SQF/vmDZVB/9T79CKTeMFISVqJYqEqXqyWH87lKzI6DeM8PCHFBjQjr2tFNoAUrjES97
         uAB5DjFchieV1f1GHuQTEz2nJPLzAcz4xgliZxbAYTUYfa4qlWX+wDbfPelG60/IqbBK
         HL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=B1jEx8tIC9EZBmbkbRsmLHIiL5/YLiLgd+sH0hYKA8Q=;
        b=LwMt/miGe2etLjf9zR10hyl7pX9Q6ufLXimYWKsAyF90CNs688crS0tJb9mZGM4T4X
         fibN/mu7DJc83CiDQokYAy/ilMhmHakJGFuq4NVygmdC/Z43ZYruTXhvdBRF8tiMpzE4
         Gq0bIvNeBtqXmEO+sjQFuK6eX7xV1ZZgRuio0mmGkvSiX6toTWBxPhMTJLRR9eGCOpwq
         c2h5/jVdRQx0ziUuw5xvNYxU2X5vbJjQAiD3lj0fUCSYymVZLvvQ6xoChv6YUOXSTgR6
         MzKUjvxLLPn1TKsOo1BSG3BXuwBKTtZRbRDBb7y/unxdQSWP5ibmPRGCOD4LNWIzRf1j
         9w/w==
X-Gm-Message-State: AOAM532tSMEC5WSfVX5Art+q0TY4oR4LNJFsv9X3/HgU2TcJAmFom5oc
        Hfw0IFZhr0WPPnN5kfGk3e2eP0U6u+byuQ==
X-Google-Smtp-Source: ABdhPJztzVp85w9PwVQmKKZykbPegeq6wg2Ecoyf4H/Butuv5XPy5Lxhp9MOIOBX4khaoFSzk3S3wQ==
X-Received: by 2002:a63:2e42:: with SMTP id u63mr6024469pgu.292.1600830719812;
        Tue, 22 Sep 2020 20:11:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y3sm17660487pfb.18.2020.09.22.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 20:11:59 -0700 (PDT)
Message-ID: <5f6abcff.1c69fb81.9f59c.c296@mx.google.com>
Date:   Tue, 22 Sep 2020 20:11:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc6-391-g5849c6655ec3
Subject: next/pending-fixes baseline: 317 runs,
 6 regressions (v5.9-rc6-391-g5849c6655ec3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 317 runs, 6 regressions (v5.9-rc6-391-g5849c66=
55ec3)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc6-391-g5849c6655ec3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc6-391-g5849c6655ec3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5849c6655ec33bd5902f0c6231d334b614053a3b =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a864df370ea1692bf9de8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a864df370ea1692bf9=
de9
      failing since 140 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a961e17ab9db3b7bf9dcc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a961e17ab9db3b7bf9=
dcd
      failing since 4 days (last pass: v5.9-rc5-318-g177467af003a, first fa=
il: v5.9-rc5-353-gfc14a2f59553)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a98e75a0cf459bfbf9dc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a98e75a0cf459bfbf9=
dc4
      failing since 48 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6aa2aa69753d1ebabf9dc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6aa2aa69753d1ebabf9=
dc8
      new failure (last pass: v5.9-rc5-353-gfc14a2f59553)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f6a888af8db90693bbf9dbd

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6a888af8db906=
93bbf9dc3
      failing since 48 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-22 23:28:02.831000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-22 23:28:02.837000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-22 23:28:02.842000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-22 23:28:02.848000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-22 23:28:02.854000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-22 23:28:02.860000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-22 23:28:02.865000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-22 23:28:02.871000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-22 23:28:02.877000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-22 23:28:02.883000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a8b22fd74317cfdbf9ddb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-39=
1-g5849c6655ec3/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a8b22fd74317cfdbf9=
ddc
      failing since 48 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
