Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C601E4A92DB
	for <lists+linux-next@lfdr.de>; Fri,  4 Feb 2022 04:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356883AbiBDD54 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Feb 2022 22:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356880AbiBDD54 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Feb 2022 22:57:56 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F85C061714
        for <linux-next@vger.kernel.org>; Thu,  3 Feb 2022 19:57:55 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l24-20020a17090aec1800b001b55738f633so6996312pjy.1
        for <linux-next@vger.kernel.org>; Thu, 03 Feb 2022 19:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sBrYbyiIO5FxHauA9iVjTAmo8jFq1Is705b9FHd65j8=;
        b=H3fpTlaNMRp7AJyUhRPuA2zk+m+GGyiMEe1ZOPgxUysVgYIUH8gH6xPpWmSSkIOq3l
         RrXfQxz8tw0WJTLzEBqKWas/ojmw7ihSqqqAEshtN1UkmeW57VFFuuN0+TXfzYpX40d3
         XVgbAdWBmA4EXIgMGs7ZaZJNmrGEI9JOKrqDOjTmURK0B5Rjlyb8bjwQMvAULYS5STeW
         RKTDUalr+W1JuUIHBQgj8D8u9Rm4epAikyDViyluB4DCvIZe1qO+VzuIdR+5nYx9l2oc
         ZFSmhQOWRObQO6lOr43jJJTeY7Engd8fPcdkjiQzBquKeRt5S20gDQh45K7/H0zCknQw
         48DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sBrYbyiIO5FxHauA9iVjTAmo8jFq1Is705b9FHd65j8=;
        b=0KOMFsovQl1x0bwKZ+nisHUF92YA74H2b8v5ArkjrIAHwozAnxqVqUz0/oeZVFtbip
         HeoTAHd4S3GJmjfCpP74fEl2jPpxZpTGUdS60Wb3XKRxPshKnPnPsBZavIVBWLoT35ks
         Av2rM1C+QPFtgN63LyQGQx/Uof9GF4iTrw5c0ssPog6AKG7J8piPiG8Zz7biKv09ecGT
         8uH52eqOhSez3+iEm18X0/4hHfkdoOZLzScH7fTDvAhVYlk3MhN2sh96C7aAcJZZ0IRO
         811K4cGMUNSjlwezKm0rjQoacxz0XhSg8ihNf2yyUCalVG54eqZFdW8qs4oxf4nb1YYU
         BzkA==
X-Gm-Message-State: AOAM532Gz0RDiFeXK/4HBwNP/9u4a5iG2tENaLrru5hBzoWId97JJLwO
        VKCfVuTjRq5NiQzsEpc5hdWCv/VSyO/ISRc8
X-Google-Smtp-Source: ABdhPJyACCe8o0e7hXkA8yVRNnfUzUl15bmhldZezIrAuOJ4by54Kp/wpXsKQIXChFmoObNvsa1ZOA==
X-Received: by 2002:a17:90b:350c:: with SMTP id ls12mr1052346pjb.44.1643947075287;
        Thu, 03 Feb 2022 19:57:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j12sm378393pgf.63.2022.02.03.19.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 19:57:55 -0800 (PST)
Message-ID: <61fca443.1c69fb81.63f4f.1bfa@mx.google.com>
Date:   Thu, 03 Feb 2022 19:57:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc2-403-g6098f9527e1d
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 582 runs,
 3 regressions (v5.17-rc2-403-g6098f9527e1d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 582 runs, 3 regressions (v5.17-rc2-403-g6098f9=
527e1d)

Regressions Summary
-------------------

platform               | arch   | lab          | compiler | defconfig      =
        | regressions
-----------------------+--------+--------------+----------+----------------=
--------+------------
da850-lcdk             | arm    | lab-baylibre | gcc-10   | davinci_all_def=
config  | 1          =

imx6ul-14x14-evk       | arm    | lab-nxp      | gcc-10   | imx_v6_v7_defco=
nfig    | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-cip      | gcc-10   | x86_64_defconfi=
g+debug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc2-403-g6098f9527e1d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc2-403-g6098f9527e1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6098f9527e1d4fdede9898dd5e8672dbb6f6d754 =



Test Regressions
---------------- =



platform               | arch   | lab          | compiler | defconfig      =
        | regressions
-----------------------+--------+--------------+----------+----------------=
--------+------------
da850-lcdk             | arm    | lab-baylibre | gcc-10   | davinci_all_def=
config  | 1          =


  Details:     https://kernelci.org/test/plan/id/61fc6f2b56e8dcf5ce5d6f17

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fc6f2b56e8dcf=
5ce5d6f1e
        failing since 11 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-04T00:11:16.821910  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-04T00:11:16.943617  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-04T00:11:16.943925  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-04T00:11:16.944124  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform               | arch   | lab          | compiler | defconfig      =
        | regressions
-----------------------+--------+--------------+----------+----------------=
--------+------------
imx6ul-14x14-evk       | arm    | lab-nxp      | gcc-10   | imx_v6_v7_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/61fc70a92713541d615d6f0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fc70a92713541d615d6=
f0b
        failing since 14 days (last pass: v5.16-7998-gbeebf0a29205, first f=
ail: v5.16-11408-ga51e80162547) =

 =



platform               | arch   | lab          | compiler | defconfig      =
        | regressions
-----------------------+--------+--------------+----------+----------------=
--------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-cip      | gcc-10   | x86_64_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/61fc7046bc6fc2d7415d6f3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/x86_64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-4=
03-g6098f9527e1d/x86_64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fc7046bc6fc2d7415d6=
f3f
        new failure (last pass: v5.17-rc2-341-g1c6ffcd3a088) =

 =20
