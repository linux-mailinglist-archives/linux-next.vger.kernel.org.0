Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0143277EB1
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 05:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIYDuB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 23:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgIYDuB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 23:50:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFD3C0613CE
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 20:50:01 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 34so1377042pgo.13
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 20:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=76IzyUPeHwSQc9OA8XX7dF2yUsjfc9CXYNp5ih4menw=;
        b=XUVwZdCqggq6pqBfwNfdM/R3gal0ZiWgA+Rx5zpqUdiVvRTddkzrD2yChEpwpOwtYt
         QF4J1G0y+7/Sf+6HpvZST7LelptSLqPs8rRuixDeNKBZNve6Myxwm1jjuZxzr++XXfw4
         5HAcKIcphj4R84vrL5V5bJIaitCd+OFPaAn1Qla9Cfnbv5rcpYPHMgulWDIWTJQKqZ3F
         cNDep8fdIHD1tRI3oirYLyGflW7jE3NHdevFYp4hRtGOccI0wzyV+E/nc0BmNIsFTCYh
         grsvUt2eWSQxHyzbYQY5FEyfqK8rur+JuQU6+euZwYG0JeflDk3THah/5eNuHnt8rZ0U
         Nfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=76IzyUPeHwSQc9OA8XX7dF2yUsjfc9CXYNp5ih4menw=;
        b=qhNjtSCWqcygMz2hdapO4ZT8e2AMX60EVQA2VP6qm/dPiFhXP0bwweWVLMsYMIBNOg
         K6HLvDih85vIXZzuZ3PTZ4Z7m5OUBUbZwj+qpUIGH/qwqbt0uotr/cY47cc+Ni/bj/RQ
         ylscgHm2YmrW8GkOKpoIRJkCVC6DlQzX5vp4+Z3upQZl22GlTq4D4LiO5ndeWIqNz9GF
         NgSj2yHKUFW+l2QZPfEaRxwg/zdF29NU1p8LU200x+ymY2VzMUVr9As7i3iUUeVAcy+r
         OWN+P7i67NVGYX8Jnt9neypXbAq0ftb7qxCR2gDmQyu6PPN9jnmPf0iQxvzJTF106p4a
         yyIA==
X-Gm-Message-State: AOAM530tKLVlm+8TIDOrVKzKWfBOQtur0bz5hxfLcnmcQv1bxVNzknmc
        ut+FZWwsg5R0UXDwE/f/9iVZghd7i8MwvA==
X-Google-Smtp-Source: ABdhPJyn60ApPsk9aCpIi9+Vs97RdjuCoEonyMUHHLAUM6EByc72VrIyt2EBtPxMs4w3x9XzFH1Tfw==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id m184-20020a6226c10000b0290142250135efmr2100174pfm.79.1601005800705;
        Thu, 24 Sep 2020 20:50:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k6sm855961pfh.92.2020.09.24.20.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 20:49:59 -0700 (PDT)
Message-ID: <5f6d68e7.1c69fb81.e8876.39a4@mx.google.com>
Date:   Thu, 24 Sep 2020 20:49:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc6-434-gee3b543117db
Subject: next/pending-fixes baseline: 318 runs,
 5 regressions (v5.9-rc6-434-gee3b543117db)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 318 runs, 5 regressions (v5.9-rc6-434-gee3b543=
117db)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc6-434-gee3b543117db/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc6-434-gee3b543117db
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee3b543117dbb013d9dd7faff13db535a8073ab3 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6d32b23e4d5c5054bf9db7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6d32b23e4d5c5054bf9=
db8
      failing since 142 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6d3405d0f3e4c86dbf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6d3405d0f3e4c86dbf9=
db4
      failing since 50 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6d3553b199235473bf9db6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6d3553b199235473bf9=
db7
      new failure (last pass: v5.9-rc6-416-ga83ae2d941ef)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f6d32260491bdf698bf9db3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6d32260491bdf=
698bf9db9
      failing since 50 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-24 23:56:16.344000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-24 23:56:16.348000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-24 23:56:16.354000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-24 23:56:16.358000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-24 23:56:16.363000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-24 23:56:16.373000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-24 23:56:16.378000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-24 23:56:16.383000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-24 23:56:16.388000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-24 23:56:16.393000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6d3409be90be426fbf9dbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc6-43=
4-gee3b543117db/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6d3409be90be426fbf9=
dbd
      failing since 50 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
