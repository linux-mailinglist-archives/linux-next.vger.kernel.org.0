Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4B627F371
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 22:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3Ule (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 16:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Ule (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 16:41:34 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DF3C061755
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 13:41:33 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z19so2064620pfn.8
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ijpYFhX9UcLGCJRKh0YNEJ4/Oxw3MmGlf4je+CbUMU4=;
        b=t4KNCHzgwI4B2EVr58/NHl1WHT/WpnNNuFr1l8+emWI8P/3wdI1fqRshu+vIpeuyqZ
         Q6kPONJJefKgytpTQUa1BjmhbvioBZLmbrRbOnAqDyPlW0emaPw9NMwriuGMu44NF91L
         s3J0uUV6uEiPd+8jouS2VBuKBnYI+v8mcwvubDUCJmqwVdy4NtpNlP5Dwaujd0Of0uCG
         KnWlsdOLr3mBHcRCvBqaiC+yneTbJyD5OrnHYdzg7rLnbkQ5Z3H1LIJS27iaSC49nNDw
         3kxp6r3OL+T3DcCzO9qJrNqSUaXigQXMMwezNoTfmCt6u/mHfnVEu/XJczY+DZySN7IN
         Gtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ijpYFhX9UcLGCJRKh0YNEJ4/Oxw3MmGlf4je+CbUMU4=;
        b=aafuajwCgpn8Wr2m4zUKc+9z3L7L8YV7MUex5a/TqToHiQXT3IV1bhkVkjglswbo9R
         KIriS/aTNh18/UlNVncoun/J0+yKfM0LxAsA0gjlUdgzrRWf7l2QMMHkh0I7r5fZ14SQ
         vsGtMHZM4eaFgTMJyZTPAcysYG5TaxYgKuh9HgJnDC2GHlg2Jt1bYQEraLmpMUIObW2T
         Gm/wrnPMYh4sc4gm1ZKO/9Nx+7QRwCQLIMe6nqjZmYiO+be4Tcpe8lerWHyW9skS8SU1
         GCvVSwVlnCOpWOsX9eRrCwbCiBM9aFoBn26qE/f4f6U7DDCFgSECCmWvTmTcv9/b4yaI
         OLJw==
X-Gm-Message-State: AOAM5338zoMPGohCmbmLTrklttr3CJ48DtUwmsNo+XXGJG2kwlKCYlHx
        7zjB4zsJDYSA0Ci876rs7yXbLJq1Nx1QYw==
X-Google-Smtp-Source: ABdhPJwjxvO6e8zp1iee/9DLmqG3kkGauwTjXto1KUHIYaxpTynEkCcuJxlODX55OBasSyAVjnYIvA==
X-Received: by 2002:a63:d604:: with SMTP id q4mr3588341pgg.238.1601498492833;
        Wed, 30 Sep 2020 13:41:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm3791813pfx.126.2020.09.30.13.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 13:41:32 -0700 (PDT)
Message-ID: <5f74ed7c.1c69fb81.9495c.7818@mx.google.com>
Date:   Wed, 30 Sep 2020 13:41:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc7-256-g8876d85bb9d7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 303 runs,
 3 regressions (v5.9-rc7-256-g8876d85bb9d7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 303 runs, 3 regressions (v5.9-rc7-256-g8876d85=
bb9d7)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc7-256-g8876d85bb9d7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc7-256-g8876d85bb9d7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8876d85bb9d7e2e0aaca64dafdf22f9faa3e5948 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74b74a4f51215d0987718e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74b74a4f51215d09877=
18f
      failing since 148 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f74b606d9aa76a7188771b3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f74b606d9aa76a=
7188771b9
      failing since 56 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-30 16:44:49.165000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-30 16:44:49.170000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-30 16:44:49.176000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-30 16:44:49.182000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-30 16:44:49.188000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-30 16:44:49.194000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-30 16:44:49.199000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-30 16:44:49.205000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-30 16:44:49.211000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-30 16:44:49.217000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74b8c491c0f1b9c287717a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-25=
6-g8876d85bb9d7/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74b8c491c0f1b9c2877=
17b
      failing since 56 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
