Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738D34B0A0C
	for <lists+linux-next@lfdr.de>; Thu, 10 Feb 2022 10:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237363AbiBJJ4K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Feb 2022 04:56:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiBJJ4J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2022 04:56:09 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70808128
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 01:56:11 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y18so1365791plb.11
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TdQ31KRpPriQhlrUevLbqCFUVR1pLkZyM/eTfdGpq8o=;
        b=6Qk7scXYcJ03uAGOqdahgYFvxDiu6ZXQuwrC7TyFwUZpf8YeasvWRkqSqyLav296xG
         vbkGsMgC1GAHCJpzYDCQqy05Tp+mBG8gh0RIV2UWfep2BKUAzFW5LsGKHxduZ4ga9dSm
         AyGFn9P2Dcdoed9aaUyDpOSczZBk3zJX0s9feCRkvyspI2ad22iKv3llc4EjX6K3Qdo9
         M8Qif4TaXZfb56k71HuYLc9LQWPHJDeZ46VC2Fi7v/gaOK5Bb2qTjB9cVAS4DgBnZKRs
         W7MZmJZRA3JmsrxX/l7Hh39m6BcT8oAI9wDn21JgoUpKSYAqRJX0ibvWORLzjIxT5dcd
         TDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TdQ31KRpPriQhlrUevLbqCFUVR1pLkZyM/eTfdGpq8o=;
        b=42OP0lox6KP59liOqNky32OGvcxrbhB/MiHjKFqqV3r55fZvrzPiryFgzlBzTdGTRf
         JFyKWwjyXLbfJwXAlWia9kjlayL/uF1C8sK05fJCY6nDna7ffzi0HDHhrx+kWorD+iKp
         Z+3Iz4P9d7VWVxVyPuuCxjTxijrxAuSq0JK3vUAx4xk6Man+E+OvchXeRhACKRIVb1II
         HHa1mWeYKEUoIAzga7Ja/ZquKYb2VJXUpcrCVyZsBTI416cmVcb0Q5hHn95JkclpSX6P
         KyOCo4UqH5aZtErrTjY2H6o2hR7eM5XpcnlDooO4jANjDPNc9bn/Dpx4D4yHQ4w6a/tC
         5pBQ==
X-Gm-Message-State: AOAM5301tSi7BpCGCFKa24SGNeAK2g4Q4UY+IsCxu7jOz7TD54iztrAv
        DidrHQkC8HK7O9Cq2osRKl/Ys7BnBHwindIMpso=
X-Google-Smtp-Source: ABdhPJyqGZo27tcqgvKbtaAinGENpQgpEAqCtqvku5mQhzHayJuXqWeUqD4Cvt48LWOYzkxLWpenXw==
X-Received: by 2002:a17:90b:3512:: with SMTP id ls18mr1924396pjb.224.1644486970792;
        Thu, 10 Feb 2022 01:56:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m20sm23322601pfk.215.2022.02.10.01.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 01:56:10 -0800 (PST)
Message-ID: <6204e13a.1c69fb81.616df.a13c@mx.google.com>
Date:   Thu, 10 Feb 2022 01:56:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc3-356-gdfd7907f4e4f
Subject: next/pending-fixes baseline: 308 runs,
 3 regressions (v5.17-rc3-356-gdfd7907f4e4f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 308 runs, 3 regressions (v5.17-rc3-356-gdfd790=
7f4e4f)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
asus-C436FA-Flip-hatch | x86_64 | lab-collabora | gcc-10   | x86_64_defcon.=
..6-chromebook | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

da850-lcdk             | arm    | lab-baylibre  | gcc-10   | davinci_all_de=
fconfig        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc3-356-gdfd7907f4e4f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc3-356-gdfd7907f4e4f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dfd7907f4e4fe53417c1436f4a727a143e0ba2d2 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
asus-C436FA-Flip-hatch | x86_64 | lab-collabora | gcc-10   | x86_64_defcon.=
..6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6204a59e74f6c3ec4ec6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204a59e74f6c3ec4ec62=
96d
        new failure (last pass: v5.17-rc3-310-g301c67a59c13) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204bcdec1681fc31bc62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204bcdec1681fc31bc62=
987
        failing since 92 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
da850-lcdk             | arm    | lab-baylibre  | gcc-10   | davinci_all_de=
fconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6204a90b577d9cc4d1c6296b

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
56-gdfd7907f4e4f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204a90b577d9cc=
4d1c6296f
        failing since 17 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-10T05:56:19.022384  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-10T05:56:19.022680  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-10T05:56:19.022867  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-10T05:56:19.067163  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =20
