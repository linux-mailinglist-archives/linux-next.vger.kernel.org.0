Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F0827F83B
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 05:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730646AbgJADto (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 23:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730560AbgJADtn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 23:49:43 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC81C061755
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 20:49:42 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id l126so3168474pfd.5
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 20:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y76I5A3ryJtXWQ4dWNU4ihL5H53XnBgY1lh4GRF2NRo=;
        b=0xJZ/nAAu1wz/I+5+/zaySCJJ3fCTUvQ2Pek2cjX1SWNq+tcwou4jAfgvWOTfEHFZE
         Nkl90AWKVoMdKUTwotAu5g/NUw2A8nzDWa92CpzhCvCsbNlCLOWDo6EokIxDloJmZnUv
         ZD3EzcVbjwvCsZ5AmVkI7MY2WOC/bpgYOeOcUhpCQE9BdFQsUgZGto7Za0VeRXFi6ngB
         dj1CqK2Fz5YlS0zYMfOGsjI1xA+CBKp6xRsrrEdMSp6zylpB8Xeeaw/g7BgrN+ZwQp4m
         jfH5lhReaeIjfA+PKddC+4kMXWab/Xr0QU+Kz4Yv2d5jytKBx6VHbretmqOmdtMisheR
         Cz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y76I5A3ryJtXWQ4dWNU4ihL5H53XnBgY1lh4GRF2NRo=;
        b=QL3Ef3RNY3SB7Cf/esiJ/x1TsjqgqijcbHwot/PGneiquFE1HPw15qLGiie6HTDUBB
         K+RdF2Wp/mQsCZnX9o9ab2sAZjUdgZzYmJ7OlGhLEFgKTm7XFAtSbvvQw/ddpUe/5XE1
         rTaK5iw/wZMnXrd4qEOrPeQUq3OoODr2UDR3JA3n0uX8NhCh4blUMZpecdqVHTmRJAPL
         XvMlCHYzfMJ/ayJD1mqyB3RNP4Zo2HUdfJP++YGnxaeu8u/sqDt1FY2Dh5FXnHAIu9DB
         yxPnb4S1rKqIIeh6xDzyiOo1A5RKIW8IUkFLUKzE9VpdivX5exuYR5UHpQfnvwfKe4od
         qy6w==
X-Gm-Message-State: AOAM5336YomTLi53i6ryqz09XeQbV3b+ogGIiLnEqGLyclKLc0VfWmHc
        O6LU0VsPZA9haAo1MtManaw1IgKXv9r+RA==
X-Google-Smtp-Source: ABdhPJzhC0OxUq8TdUh9DpYEjMd3SG1vtoZi9oYaEi3ie7UHNJuBSbT431zjYGKsaSC8vUJSJ35MeQ==
X-Received: by 2002:a63:e602:: with SMTP id g2mr4664416pgh.427.1601524180232;
        Wed, 30 Sep 2020 20:49:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f9sm3611973pjq.26.2020.09.30.20.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 20:49:39 -0700 (PDT)
Message-ID: <5f7551d3.1c69fb81.cf4a9.86a0@mx.google.com>
Date:   Wed, 30 Sep 2020 20:49:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc7-297-gd069a655f589
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 285 runs,
 3 regressions (v5.9-rc7-297-gd069a655f589)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 285 runs, 3 regressions (v5.9-rc7-297-gd069a65=
5f589)

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
v5.9-rc7-297-gd069a655f589/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc7-297-gd069a655f589
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d069a655f5891c241683eca4c45aad9f977ed5f0 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f751944f283859b8787717d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f751944f283859b87877=
17e
      failing since 148 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f751d09b37aed25a0877184

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f751d09b37aed2=
5a087718a
      failing since 56 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-01 00:04:19.331000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-01 00:04:19.336000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-01 00:04:19.342000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-01 00:04:19.348000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-01 00:04:19.354000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-01 00:04:19.359000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-01 00:04:19.365000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-01 00:04:19.371000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-01 00:04:19.377000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-01 00:04:19.382000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f751c120343fe52d087718b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-29=
7-gd069a655f589/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f751c120343fe52d0877=
18c
      failing since 56 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
